.class public Lcom/google/android/talk/BuddyInfo;
.super Landroid/app/Activity;
.source "BuddyInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/BuddyInfo$QueryHandler;,
        Lcom/google/android/talk/BuddyInfo$RosterListener;
    }
.end annotation


# static fields
.field private static final AVATAR_DATA_COLUMN:I = 0x4

.field private static final CUSTOM_STATUS_COLUMN:I = 0x2

.field private static final NICKNAME_COLUMN:I = 0x1

.field private static final PRESENCE_COLUMN:I = 0x3

.field private static final QUERY_PROJECTION:[Ljava/lang/String;

.field private static final QUERY_SELECTION:Ljava/lang/String; = "contacts._id=?"

.field private static final QUERY_TOKEN:I = 0x1

.field private static final USERNAME_COLUMN:I


# instance fields
.field protected mApp:Lcom/google/android/talk/TalkApp;

.field private mAvatarView:Landroid/widget/QuickContactBadge;

.field private mCursor:Landroid/database/Cursor;

.field protected final mHandler:Landroid/os/Handler;

.field private mImSession:Lcom/google/android/gtalkservice/IImSession;

.field private mNickname:Ljava/lang/String;

.field private mNicknameField:Landroid/widget/EditText;

.field private mPresenceView:Landroid/widget/ImageView;

.field mQueryHandler:Lcom/google/android/talk/BuddyInfo$QueryHandler;

.field private mQuerySelectionArg:[Ljava/lang/String;

.field private mRosterListener:Lcom/google/android/talk/BuddyInfo$RosterListener;

.field protected mService:Lcom/google/android/gtalkservice/IGTalkService;

.field private mStatusView:Landroid/widget/TextView;

.field private mUserId:J

.field private mUsername:Ljava/lang/String;

.field private mUsernameField:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 52
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "username"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "nickname"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "status"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "mode"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "avatars_data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/BuddyInfo;->QUERY_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 67
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mHandler:Landroid/os/Handler;

    .line 70
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mQuerySelectionArg:[Ljava/lang/String;

    .line 97
    new-instance v0, Lcom/google/android/talk/BuddyInfo$RosterListener;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyInfo$RosterListener;-><init>(Lcom/google/android/talk/BuddyInfo;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mRosterListener:Lcom/google/android/talk/BuddyInfo$RosterListener;

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/BuddyInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyInfo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->startQuery()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/BuddyInfo;)Landroid/database/Cursor;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BuddyInfo;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method static synthetic access$102(Lcom/google/android/talk/BuddyInfo;Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyInfo;
    .param p1, "x1"    # Landroid/database/Cursor;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    return-object p1
.end method

.method static synthetic access$200(Lcom/google/android/talk/BuddyInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyInfo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->update()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/talk/BuddyInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyInfo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->saveNickname()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/talk/BuddyInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyInfo;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->serviceStateChanged()V

    return-void
.end method

.method private initView()V
    .locals 3

    .prologue
    .line 201
    const v1, 0x7f0b0003

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/QuickContactBadge;

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mAvatarView:Landroid/widget/QuickContactBadge;

    .line 202
    const v1, 0x7f0b0006

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mPresenceView:Landroid/widget/ImageView;

    .line 203
    const v1, 0x7f0b0005

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mUsernameField:Landroid/widget/TextView;

    .line 204
    const v1, 0x7f0b0004

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mNicknameField:Landroid/widget/EditText;

    .line 205
    const v1, 0x7f0b0007

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mStatusView:Landroid/widget/TextView;

    .line 207
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mNicknameField:Landroid/widget/EditText;

    new-instance v2, Lcom/google/android/talk/BuddyInfo$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/BuddyInfo$1;-><init>(Lcom/google/android/talk/BuddyInfo;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 219
    const v1, 0x7f0b0008

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 220
    .local v0, "button":Landroid/widget/Button;
    new-instance v1, Lcom/google/android/talk/BuddyInfo$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/BuddyInfo$2;-><init>(Lcom/google/android/talk/BuddyInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 227
    const v1, 0x7f0b0009

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "button":Landroid/widget/Button;
    check-cast v0, Landroid/widget/Button;

    .line 228
    .restart local v0    # "button":Landroid/widget/Button;
    new-instance v1, Lcom/google/android/talk/BuddyInfo$3;

    invoke-direct {v1, p0}, Lcom/google/android/talk/BuddyInfo$3;-><init>(Lcom/google/android/talk/BuddyInfo;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    return-void
.end method

.method private registerForServiceStateChanged()V
    .locals 3

    .prologue
    .line 236
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/BuddyInfo$4;

    invoke-direct {v2, p0}, Lcom/google/android/talk/BuddyInfo$4;-><init>(Lcom/google/android/talk/BuddyInfo;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 241
    return-void
.end method

.method private saveNickname()V
    .locals 8

    .prologue
    const/4 v6, 0x1

    const-string v7, "talk"

    .line 343
    iget-object v3, p0, Lcom/google/android/talk/BuddyInfo;->mNicknameField:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 345
    .local v1, "newNickname":Ljava/lang/String;
    iget-object v3, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 371
    :goto_0
    return-void

    .line 349
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 350
    const v3, 0x7f06002d

    invoke-static {p0, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 354
    :cond_1
    const/4 v2, 0x0

    .line 356
    .local v2, "saved":Z
    :try_start_0
    iget-object v3, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v3, :cond_2

    .line 357
    iget-object v3, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mUsername:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-interface {v3, v4, v1, v5}, Lcom/google/android/gtalkservice/IImSession;->editContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    const/4 v2, 0x1

    .line 366
    :goto_1
    if-nez v2, :cond_3

    .line 367
    const v3, 0x7f06002c

    invoke-static {p0, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 360
    :cond_2
    :try_start_1
    const-string v3, "talk"

    const-string v4, "[BuddyInfo] saveNickname: empty IM session"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 362
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 363
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v3, "talk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BuddyInfo] saveNickname caught"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 369
    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_3
    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    goto :goto_0
.end method

.method private serviceStateChanged()V
    .locals 5

    .prologue
    const-string v4, "talk"

    .line 248
    iget-object v2, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v2}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    .line 250
    .local v1, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v1, :cond_1

    .line 251
    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 252
    iget-object v2, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/talk/TalkApp;->getImSessionFromActivityIntent(Landroid/content/Intent;)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    .line 253
    iget-object v2, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v2, :cond_0

    .line 254
    const-string v2, "talk"

    const-string v2, "Empty IM session. Finish!"

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    .line 268
    :goto_0
    return-void

    .line 260
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v3, p0, Lcom/google/android/talk/BuddyInfo;->mRosterListener:Lcom/google/android/talk/BuddyInfo$RosterListener;

    invoke-interface {v2, v3}, Lcom/google/android/gtalkservice/IImSession;->addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 261
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 262
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BuddyInfo] serviceStateChanged caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 265
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    goto :goto_0
.end method

.method private startQuery()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 272
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mQueryHandler:Lcom/google/android/talk/BuddyInfo$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyInfo$QueryHandler;->cancelOperation(I)V

    .line 274
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mQueryHandler:Lcom/google/android/talk/BuddyInfo$QueryHandler;

    sget-object v3, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    sget-object v4, Lcom/google/android/talk/BuddyInfo;->QUERY_PROJECTION:[Ljava/lang/String;

    const-string v5, "contacts._id=?"

    iget-object v6, p0, Lcom/google/android/talk/BuddyInfo;->mQuerySelectionArg:[Ljava/lang/String;

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/BuddyInfo$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    return-void
.end method

.method private unregisterForServiceStateChanged()V
    .locals 2

    .prologue
    .line 244
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->removeServiceStateChangedCallback(Landroid/os/Handler;)V

    .line 245
    return-void
.end method

.method private update()V
    .locals 9

    .prologue
    const-string v8, "talk"

    const-string v7, "[BuddyInfo] update: got exception calling update()"

    .line 284
    :try_start_0
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    .line 286
    .local v0, "app":Lcom/google/android/talk/TalkApp;
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mUsername:Ljava/lang/String;

    .line 287
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mUsernameField:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/google/android/talk/BuddyInfo;->mUsername:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    if-nez v4, :cond_0

    .line 290
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x1

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    .line 291
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mNicknameField:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 294
    :cond_0
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mStatusView:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    const/4 v6, 0x2

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 296
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x4

    invoke-static {v4, v5}, Lcom/google/android/talk/DatabaseUtils;->getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 300
    .local v2, "b":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_1

    .line 301
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 306
    .local v1, "avatar":Landroid/graphics/drawable/Drawable;
    :goto_0
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mAvatarView:Landroid/widget/QuickContactBadge;

    invoke-virtual {v4, v1}, Landroid/widget/QuickContactBadge;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 307
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mAvatarView:Landroid/widget/QuickContactBadge;

    iget-object v5, p0, Lcom/google/android/talk/BuddyInfo;->mUsername:Ljava/lang/String;

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/widget/QuickContactBadge;->assignContactFromEmail(Ljava/lang/String;Z)V

    .line 309
    iget-object v4, p0, Lcom/google/android/talk/BuddyInfo;->mPresenceView:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    const/4 v6, 0x3

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/google/android/talk/TalkApp;->getStatusIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 323
    .end local v0    # "app":Lcom/google/android/talk/TalkApp;
    .end local v1    # "avatar":Landroid/graphics/drawable/Drawable;
    .end local v2    # "b":Landroid/graphics/Bitmap;
    :goto_1
    return-void

    .line 303
    .restart local v0    # "app":Lcom/google/android/talk/TalkApp;
    .restart local v2    # "b":Landroid/graphics/Bitmap;
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/database/CursorIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/StaleDataException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .restart local v1    # "avatar":Landroid/graphics/drawable/Drawable;
    goto :goto_0

    .line 310
    .end local v0    # "app":Lcom/google/android/talk/TalkApp;
    .end local v1    # "avatar":Landroid/graphics/drawable/Drawable;
    .end local v2    # "b":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v4

    move-object v3, v4

    .line 311
    .local v3, "ex":Landroid/database/CursorIndexOutOfBoundsException;
    const-string v4, "talk"

    const-string v4, "[BuddyInfo] update: got exception calling update()"

    invoke-static {v8, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 315
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    goto :goto_1

    .line 316
    .end local v3    # "ex":Landroid/database/CursorIndexOutOfBoundsException;
    :catch_1
    move-exception v4

    move-object v3, v4

    .line 317
    .local v3, "ex":Landroid/database/StaleDataException;
    const-string v4, "talk"

    const-string v4, "[BuddyInfo] update: got exception calling update()"

    invoke-static {v8, v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 321
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    goto :goto_1
.end method


# virtual methods
.method protected final onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v5, 0x0

    .line 129
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 131
    const v1, 0x7f030003

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyInfo;->setContentView(I)V

    .line 133
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->initView()V

    .line 135
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    .line 136
    new-instance v1, Lcom/google/android/talk/BuddyInfo$QueryHandler;

    invoke-direct {v1, p0, p0}, Lcom/google/android/talk/BuddyInfo$QueryHandler;-><init>(Lcom/google/android/talk/BuddyInfo;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mQueryHandler:Lcom/google/android/talk/BuddyInfo$QueryHandler;

    .line 138
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 139
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "userId"

    invoke-virtual {v0, v1, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/BuddyInfo;->mUserId:J

    .line 140
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mQuerySelectionArg:[Ljava/lang/String;

    const/4 v2, 0x0

    iget-wide v3, p0, Lcom/google/android/talk/BuddyInfo;->mUserId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 142
    iget-wide v1, p0, Lcom/google/android/talk/BuddyInfo;->mUserId:J

    cmp-long v1, v1, v5

    if-nez v1, :cond_0

    .line 143
    const-string v1, "talk"

    const-string v2, "[BuddyInfo.onCreate: invalid user id = 0"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    .line 149
    :goto_0
    return-void

    .line 148
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->registerForServiceStateChanged()V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 172
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 174
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 177
    :cond_0
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 153
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 155
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 156
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eq v1, v0, :cond_1

    .line 157
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->handleDisconnectedService()V

    .line 158
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->registerForServiceStateChanged()V

    .line 162
    :goto_0
    return-void

    .line 160
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->serviceStateChanged()V

    goto :goto_0
.end method

.method protected final onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 335
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 337
    const-string v0, "o-nickname"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    .line 338
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo;->mNicknameField:Landroid/widget/EditText;

    const-string v1, "nickname"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 339
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 166
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 167
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->startQuery()V

    .line 168
    return-void
.end method

.method protected final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 327
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 329
    const-string v0, "nickname"

    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mNicknameField:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    const-string v0, "o-nickname"

    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mNickname:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    return-void
.end method

.method protected onStop()V
    .locals 4

    .prologue
    .line 181
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 183
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    .line 184
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 185
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mCursor:Landroid/database/Cursor;

    .line 189
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_1

    .line 190
    iget-object v1, p0, Lcom/google/android/talk/BuddyInfo;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyInfo;->mRosterListener:Lcom/google/android/talk/BuddyInfo$RosterListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/google/android/talk/BuddyInfo;->unregisterForServiceStateChanged()V

    .line 198
    return-void

    .line 192
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 193
    .local v0, "ex":Ljava/lang/Exception;
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BuddyInfo] onStop: caught exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
