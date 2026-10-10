.class public Lcom/google/android/talk/ContactInfoQuery;
.super Ljava/lang/Object;
.source "ContactInfoQuery.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;,
        Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;
    }
.end annotation


# static fields
.field private static final AVATAR_DATA_COLUMN:I = 0x5

.field private static final CONTACT_ID_COLUMN:I = 0x0

.field private static final CONTACT_INFO_QUERY_TOKEN:I = 0x14

.field private static final CONTACT_PROJECTION:[Ljava/lang/String;

.field private static final CONTACT_PROJECTION_WITH_AVATAR:[Ljava/lang/String;

.field private static final CONTACT_SELECTION_ONLY_USERNAME:Ljava/lang/String; = "username=?"

.field private static final CONTACT_SELECTION_WITH_ACCOUNT:Ljava/lang/String; = "username=? AND account=?"

.field private static final CONTACT_TYPE_COLUMN:I = 0x2

.field private static final NICKNAME_COLUMN:I = 0x1

.field private static final PRESENCE_CUSTOM_STATUS_COLUMN:I = 0x4

.field private static final PRESENCE_STATUS_COLUMN:I = 0x3


# instance fields
.field private mContactInfoCallback:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;

.field private mContactInfoCursor:Landroid/database/Cursor;

.field private mContactInfoQueryHandler:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;

.field private mContactInfoSelectionArgs:[Ljava/lang/String;

.field private mContentObserver:Landroid/database/ContentObserver;

.field private mContext:Landroid/content/Context;

.field private mHaveContactInfo:Z

.field private mIncludeAvatar:Z

.field private mLogLevel:I

.field private mSelection:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 44
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "nickname"

    aput-object v1, v0, v3

    const-string v1, "type"

    aput-object v1, v0, v4

    const-string v1, "mode"

    aput-object v1, v0, v5

    const-string v1, "status"

    aput-object v1, v0, v6

    sput-object v0, Lcom/google/android/talk/ContactInfoQuery;->CONTACT_PROJECTION:[Ljava/lang/String;

    .line 52
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "nickname"

    aput-object v1, v0, v3

    const-string v1, "type"

    aput-object v1, v0, v4

    const-string v1, "mode"

    aput-object v1, v0, v5

    const-string v1, "status"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string v2, "avatars_data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/ContactInfoQuery;->CONTACT_PROJECTION_WITH_AVATAR:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;JLjava/lang/String;Landroid/database/ContentObserver;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "accountId"    # J
    .param p4, "contact"    # Ljava/lang/String;
    .param p5, "contentObserver"    # Landroid/database/ContentObserver;
    .param p6, "includeAvatar"    # Z

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mLogLevel:I

    .line 83
    invoke-virtual {p0, p2, p3, p4}, Lcom/google/android/talk/ContactInfoQuery;->setContactInfo(JLjava/lang/String;)V

    .line 84
    new-instance v0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;

    invoke-direct {v0, p0, p1}, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;-><init>(Lcom/google/android/talk/ContactInfoQuery;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoQueryHandler:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;

    .line 85
    iput-object p5, p0, Lcom/google/android/talk/ContactInfoQuery;->mContentObserver:Landroid/database/ContentObserver;

    .line 86
    iput-object p1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContext:Landroid/content/Context;

    .line 87
    iput-boolean p6, p0, Lcom/google/android/talk/ContactInfoQuery;->mIncludeAvatar:Z

    .line 88
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method static synthetic access$002(Lcom/google/android/talk/ContactInfoQuery;Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;
    .param p1, "x1"    # Landroid/database/Cursor;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    return-object p1
.end method

.method static synthetic access$100(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/ContentObserver;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContentObserver:Landroid/database/ContentObserver;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/talk/ContactInfoQuery;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;
    .param p1, "x1"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lcom/google/android/talk/ContactInfoQuery;->mHaveContactInfo:Z

    return p1
.end method

.method static synthetic access$300(Lcom/google/android/talk/ContactInfoQuery;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;

    .prologue
    .line 30
    iget v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mLogLevel:I

    return v0
.end method

.method static synthetic access$400(Lcom/google/android/talk/ContactInfoQuery;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/google/android/talk/ContactInfoQuery;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/talk/ContactInfoQuery;)Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ContactInfoQuery;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCallback:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 225
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ContactInfoQuery] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    return-void
.end method


# virtual methods
.method public cleanupContactInfoCursor()V
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    .line 216
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContentObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContentObserver:Landroid/database/ContentObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 220
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    .line 222
    :cond_1
    return-void
.end method

.method public getAvatar()Landroid/graphics/drawable/Drawable;
    .locals 4

    .prologue
    .line 152
    const/4 v0, 0x0

    .line 154
    .local v0, "avatar":Landroid/graphics/drawable/Drawable;
    iget-boolean v2, p0, Lcom/google/android/talk/ContactInfoQuery;->mIncludeAvatar:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_1

    .line 155
    iget-object v2, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    const/4 v3, 0x5

    invoke-static {v2, v3}, Lcom/google/android/talk/DatabaseUtils;->getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 156
    .local v1, "avatarBitmap":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 157
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0    # "avatar":Landroid/graphics/drawable/Drawable;
    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .end local p0    # "this":Lcom/google/android/talk/ContactInfoQuery;
    .restart local v0    # "avatar":Landroid/graphics/drawable/Drawable;
    :goto_0
    move-object v2, v0

    .line 163
    .end local v1    # "avatarBitmap":Landroid/graphics/Bitmap;
    :goto_1
    return-object v2

    .line 159
    .restart local v1    # "avatarBitmap":Landroid/graphics/Bitmap;
    .restart local p0    # "this":Lcom/google/android/talk/ContactInfoQuery;
    :cond_0
    iget-object p0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContext:Landroid/content/Context;

    .end local p0    # "this":Lcom/google/android/talk/ContactInfoQuery;
    check-cast p0, Landroid/app/Activity;

    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 163
    .end local v1    # "avatarBitmap":Landroid/graphics/Bitmap;
    .restart local p0    # "this":Lcom/google/android/talk/ContactInfoQuery;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public getCustomPresence()Ljava/lang/String;
    .locals 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 180
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNickName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 184
    iget-object v1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    iget-object v1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "nickName":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/android/talk/StringUtils;->parseAbbreviatedAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 189
    .end local v0    # "nickName":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getPresenceStatus()I
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCursor:Landroid/database/Cursor;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 172
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasContactInfo()Z
    .locals 1

    .prologue
    .line 148
    iget-boolean v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mHaveContactInfo:Z

    return v0
.end method

.method public requeryForContactInfo()V
    .locals 2

    .prologue
    .line 210
    iget v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    const-string v0, "requeryForContactInfo"

    invoke-direct {p0, v0}, Lcom/google/android/talk/ContactInfoQuery;->log(Ljava/lang/String;)V

    .line 211
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/ContactInfoQuery;->startQueryForContactInfo()V

    .line 212
    return-void
.end method

.method public setContactInfo(JLjava/lang/String;)V
    .locals 4
    .param p1, "accountId"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 91
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 92
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    aput-object p3, v0, v2

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoSelectionArgs:[Ljava/lang/String;

    .line 93
    const-string v0, "username=? AND account=?"

    iput-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mSelection:Ljava/lang/String;

    .line 98
    :goto_0
    return-void

    .line 95
    :cond_0
    new-array v0, v3, [Ljava/lang/String;

    aput-object p3, v0, v2

    iput-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoSelectionArgs:[Ljava/lang/String;

    .line 96
    const-string v0, "username=?"

    iput-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mSelection:Ljava/lang/String;

    goto :goto_0
.end method

.method public setContactInfoCallback(Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;)V
    .locals 0
    .param p1, "cb"    # Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoCallback:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;

    .line 102
    return-void
.end method

.method public startQueryForContactInfo()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x14

    .line 194
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoQueryHandler:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->cancelOperation(I)V

    .line 196
    iget v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mLogLevel:I

    const/4 v3, 0x1

    if-lt v0, v3, :cond_0

    const-string v0, "startQueryForContactInfo"

    invoke-direct {p0, v0}, Lcom/google/android/talk/ContactInfoQuery;->log(Ljava/lang/String;)V

    .line 197
    :cond_0
    iget v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mLogLevel:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startQueryForContactInfo: selection => "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/talk/ContactInfoQuery;->mSelection:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ContactInfoQuery;->log(Ljava/lang/String;)V

    .line 201
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoQueryHandler:Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;

    sget-object v3, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    iget-boolean v4, p0, Lcom/google/android/talk/ContactInfoQuery;->mIncludeAvatar:Z

    if-eqz v4, :cond_2

    sget-object v4, Lcom/google/android/talk/ContactInfoQuery;->CONTACT_PROJECTION_WITH_AVATAR:[Ljava/lang/String;

    :goto_0
    iget-object v5, p0, Lcom/google/android/talk/ContactInfoQuery;->mSelection:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/talk/ContactInfoQuery;->mContactInfoSelectionArgs:[Ljava/lang/String;

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    return-void

    .line 201
    :cond_2
    sget-object v4, Lcom/google/android/talk/ContactInfoQuery;->CONTACT_PROJECTION:[Ljava/lang/String;

    goto :goto_0
.end method
