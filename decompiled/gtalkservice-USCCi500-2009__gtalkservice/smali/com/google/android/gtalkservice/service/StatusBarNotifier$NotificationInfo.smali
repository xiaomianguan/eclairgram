.class Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
.super Ljava/lang/Object;
.source "StatusBarNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/StatusBarNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NotificationInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;,
        Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    }
.end annotation


# instance fields
.field mAccountId:J

.field mContext:Landroid/content/Context;

.field mIntent:Landroid/content/Intent;

.field private mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

.field mRemoteView:Landroid/widget/RemoteViews;

.field mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

.field mRemoteViewForOneChat:Landroid/widget/RemoteViews;

.field mSnippet:Ljava/lang/String;

.field mTitle:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Landroid/content/Context;)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    new-instance v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;-><init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    .line 216
    iput-object p2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mContext:Landroid/content/Context;

    .line 218
    new-instance v0, Landroid/widget/RemoteViews;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f030001

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForOneChat:Landroid/widget/RemoteViews;

    .line 221
    new-instance v0, Landroid/widget/RemoteViews;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/high16 v2, 0x7f030000

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

    .line 223
    return-void
.end method

.method static synthetic access$500(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    return-object v0
.end method

.method private buildSnippet(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 335
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 337
    .local v1, "i":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .line 338
    .local v4, "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    const/4 v5, 0x5

    if-lt v1, v5, :cond_1

    .line 339
    const/16 v5, 0x2026

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    .end local v4    # "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mSnippet:Ljava/lang/String;

    .line 351
    return-void

    .line 343
    .restart local v4    # "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    :cond_1
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    if-lez v1, :cond_2

    .line 344
    const-string v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    :cond_2
    iget-object v5, v4, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mNickname:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0
.end method

.method private getNthAvatarResId(I)I
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 380
    packed-switch p1, :pswitch_data_0

    .line 392
    const v0, 0x7f060002

    :goto_0
    return v0

    .line 382
    :pswitch_0
    const v0, 0x7f060003

    goto :goto_0

    .line 384
    :pswitch_1
    const v0, 0x7f060004

    goto :goto_0

    .line 386
    :pswitch_2
    const v0, 0x7f060005

    goto :goto_0

    .line 388
    :pswitch_3
    const v0, 0x7f060006

    goto :goto_0

    .line 390
    :pswitch_4
    const v0, 0x7f060007

    goto :goto_0

    .line 380
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private update()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 282
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->getList()Ljava/util/ArrayList;

    move-result-object v2

    .line 283
    .local v2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 285
    .local v0, "count":I
    if-nez v0, :cond_0

    .line 286
    iput-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mTitle:Ljava/lang/String;

    .line 287
    iput-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mSnippet:Ljava/lang/String;

    .line 288
    iput-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteView:Landroid/widget/RemoteViews;

    .line 289
    iput-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;

    .line 319
    :goto_0
    return-void

    .line 291
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .line 293
    .local v1, "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    iget-object v3, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mNotificationIntent:Landroid/content/Intent;

    iput-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;

    .line 295
    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 296
    iget-object v3, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mTitle:Ljava/lang/String;

    iput-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mTitle:Ljava/lang/String;

    .line 297
    iget-object v3, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mMessage:Ljava/lang/String;

    iput-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mSnippet:Ljava/lang/String;

    goto :goto_0

    .line 303
    :cond_1
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mContext:Landroid/content/Context;

    const v4, 0x7f05000f

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mTitle:Ljava/lang/String;

    .line 308
    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->buildSnippet(Ljava/util/ArrayList;)V

    .line 312
    invoke-static {}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$300()Landroid/content/Intent;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;

    .line 313
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;

    const-string v4, "accountId"

    iget-wide v5, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mAccountId:J

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    goto :goto_0
.end method

.method private updateChatDashboardView(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 354
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;>;"
    const/4 v1, 0x0

    .line 356
    .local v1, "i":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .line 357
    .local v3, "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->getNthAvatarResId(I)I

    move-result v0

    .line 359
    .local v0, "avatarResId":I
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 361
    iget-object v4, v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mAvatar:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_0

    .line 362
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

    iget-object v5, v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mAvatar:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v0, v5}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 368
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 369
    goto :goto_0

    .line 364
    :cond_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

    const v5, 0x7f020001

    invoke-virtual {v4, v0, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto :goto_1

    .line 371
    .end local v0    # "avatarResId":I
    .end local v3    # "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    :cond_1
    :goto_2
    const/4 v4, 0x6

    if-ge v1, v4, :cond_2

    .line 372
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->getNthAvatarResId(I)I

    move-result v5

    const/16 v6, 0x8

    invoke-virtual {v4, v5, v6}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 373
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 376
    :cond_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForChatDashboard:Landroid/widget/RemoteViews;

    iput-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteView:Landroid/widget/RemoteViews;

    .line 377
    return-void
.end method

.method private updateOneChatView(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;)V
    .locals 4
    .param p1, "item"    # Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .prologue
    const v3, 0x7f060009

    .line 322
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForOneChat:Landroid/widget/RemoteViews;

    const v1, 0x7f06000a

    iget-object v2, p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 324
    iget-object v0, p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mAvatar:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForOneChat:Landroid/widget/RemoteViews;

    iget-object v1, p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mAvatar:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v3, v1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 330
    :goto_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForOneChat:Landroid/widget/RemoteViews;

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteView:Landroid/widget/RemoteViews;

    .line 331
    return-void

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteViewForOneChat:Landroid/widget/RemoteViews;

    const v1, 0x7f020001

    invoke-virtual {v0, v3, v1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto :goto_0
.end method


# virtual methods
.method public add(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Z
    .locals 12
    .param p1, "accountId"    # J
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "nickname"    # Ljava/lang/String;
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "message"    # Ljava/lang/String;
    .param p7, "intent"    # Landroid/content/Intent;

    .prologue
    .line 240
    iput-wide p1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mAccountId:J

    .line 242
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->containsSender(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 243
    iget-object v10, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    new-instance v2, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mContext:Landroid/content/Context;

    move-object v3, p0

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v2 .. v9}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;-><init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v10, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->addItem(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;)Z

    .line 266
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->update()V

    .line 268
    const/4 v2, 0x1

    return v2

    .line 248
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->getItem(I)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    move-result-object v11

    .line 249
    .local v11, "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    iget-object v10, v11, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    .line 251
    .local v10, "firstSender":Ljava/lang/String;
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NotificationInfo.add("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), old first sender ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$200(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V

    .line 254
    :cond_1
    invoke-virtual {v10, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 255
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    const-string v3, "NotificationInfo.add: reshuffle sender names"

    invoke-static {v2, v3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$200(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V

    .line 256
    :cond_2
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->removeItemBySender(Ljava/lang/String;)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    move-result-object v11

    .line 257
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v2, v11}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->addItem(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;)Z

    .line 261
    :cond_3
    move-object/from16 v0, p5

    move-object v1, v11

    iput-object v0, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mTitle:Ljava/lang/String;

    .line 262
    move-object/from16 v0, p6

    move-object v1, v11

    iput-object v0, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mMessage:Ljava/lang/String;

    .line 263
    move-object/from16 v0, p7

    move-object v1, v11

    iput-object v0, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mNotificationIntent:Landroid/content/Intent;

    goto :goto_0
.end method

.method getFirstItem()Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    .locals 2

    .prologue
    .line 226
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->getList()Ljava/util/ArrayList;

    move-result-object v0

    .line 227
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 228
    const/4 v1, 0x0

    .line 231
    .end local p0    # "this":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    :goto_0
    return-object v1

    .restart local p0    # "this":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    check-cast p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    move-object v1, p0

    goto :goto_0
.end method

.method public getRemoteView()Landroid/widget/RemoteViews;
    .locals 1

    .prologue
    .line 397
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteView:Landroid/widget/RemoteViews;

    return-object v0
.end method

.method public hasNotification()Z
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mSnippet:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mRemoteView:Landroid/widget/RemoteViews;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 1
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 272
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->containsSender(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mNotificationItems:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->removeItemBySender(Ljava/lang/String;)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .line 274
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->update()V

    .line 275
    const/4 v0, 0x1

    .line 278
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
