.class public Lcom/google/android/talk/DatabaseUtils;
.super Ljava/lang/Object;
.source "DatabaseUtils.java"


# static fields
.field private static final ACCOUNT_COLUMN_ID:I = 0x0

.field private static final ACCOUNT_ID_PROJECTION:[Ljava/lang/String;

.field private static final AVATAR_PROJECTION:[Ljava/lang/String;

.field private static final AVATAR_QUERY_SELECTION:Ljava/lang/String; = "contact=?"

.field private static CONTACT_COLUMN_ID:I = 0x0

.field private static final CONTACT_PROJECTION:[Ljava/lang/String;

.field private static final DATA_COLUMN:I = 0x1

.field private static final PROVIDER_COLUMN_ID:I

.field private static final PROVIDER_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const-string v4, "_id"

    .line 39
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v4, v0, v2

    sput-object v0, Lcom/google/android/talk/DatabaseUtils;->PROVIDER_PROJECTION:[Ljava/lang/String;

    .line 45
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v4, v0, v2

    sput-object v0, Lcom/google/android/talk/DatabaseUtils;->ACCOUNT_ID_PROJECTION:[Ljava/lang/String;

    .line 51
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v4, v0, v2

    const-string v1, "data"

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/android/talk/DatabaseUtils;->AVATAR_PROJECTION:[Ljava/lang/String;

    .line 243
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v4, v0, v2

    sput-object v0, Lcom/google/android/talk/DatabaseUtils;->CONTACT_PROJECTION:[Ljava/lang/String;

    .line 246
    sput v2, Lcom/google/android/talk/DatabaseUtils;->CONTACT_COLUMN_ID:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static final IsUserInRosterList(Landroid/content/ContentResolver;Ljava/lang/String;J)Z
    .locals 9
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 249
    const/4 v7, 0x0

    .line 251
    .local v7, "retVal":Z
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v0, "username"

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 253
    .local v8, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "=? AND "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    const-string v0, "account"

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    const/16 v0, 0x3d

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 257
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 258
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object p1, v4, v0

    .line 260
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/DatabaseUtils;->CONTACT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 266
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 268
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    const/4 v7, 0x1

    .line 272
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 278
    :goto_0
    return v7

    .line 272
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 275
    :cond_1
    const-string v0, "IsUserInRosterList"

    invoke-static {v0}, Lcom/google/android/talk/DatabaseUtils;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static computeAvatarHash([B)Ljava/lang/String;
    .locals 3
    .param p0, "data"    # [B

    .prologue
    .line 177
    :try_start_0
    const-string v2, "SHA-1"

    invoke-static {v2}, Landroid/security/MessageDigest;->getInstance(Ljava/lang/String;)Landroid/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 184
    .local v0, "digest":Landroid/security/MessageDigest;
    invoke-virtual {v0, p0}, Landroid/security/MessageDigest;->update([B)V

    .line 185
    invoke-virtual {v0}, Landroid/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/talk/DatabaseUtils;->encodeHex([B)Ljava/lang/String;

    move-result-object v2

    .end local v0    # "digest":Landroid/security/MessageDigest;
    :goto_0
    return-object v2

    .line 179
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 180
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 181
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static decodeAvatar([B)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "data"    # [B

    .prologue
    .line 146
    if-nez p0, :cond_0

    .line 147
    const/4 v0, 0x0

    .line 149
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method private static encodeHex([B)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    const/16 v3, 0x10

    .line 189
    new-instance v0, Ljava/lang/StringBuffer;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 191
    .local v0, "hex":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 192
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    if-ge v2, v3, :cond_0

    .line 193
    const-string v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 195
    :cond_0
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 191
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 198
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getAccountIdForUsername(Landroid/content/ContentResolver;Ljava/lang/String;)J
    .locals 9
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 61
    const-string v3, "username=?"

    .line 63
    .local v3, "selection":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 64
    .local v4, "selectionArgs":[Ljava/lang/String;
    aput-object p1, v4, v1

    .line 66
    sget-object v1, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/DatabaseUtils;->ACCOUNT_ID_PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 72
    .local v6, "c":Landroid/database/Cursor;
    const-wide/16 v7, 0x0

    .line 74
    .local v7, "retVal":J
    if-eqz v6, :cond_1

    .line 76
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v7

    .line 80
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 86
    :goto_0
    return-wide v7

    .line 80
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 83
    :cond_1
    const-string v0, "getAccountIdForUsername"

    invoke-static {v0}, Lcom/google/android/talk/DatabaseUtils;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p1, "dataColumn"    # I

    .prologue
    .line 153
    invoke-static {p0, p1}, Lcom/google/android/talk/DatabaseUtils;->loadAvatarData(Landroid/database/Cursor;I)[B

    move-result-object v0

    .line 154
    .local v0, "rawData":[B
    invoke-static {v0}, Lcom/google/android/talk/DatabaseUtils;->decodeAvatar([B)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public static getAvatarFromOwnCursor(Landroid/database/Cursor;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 3
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 125
    const/4 v1, 0x0

    .line 127
    .local v1, "retVal":Landroid/graphics/drawable/BitmapDrawable;
    if-nez p0, :cond_0

    .line 128
    const/4 v2, 0x0

    .line 138
    :goto_0
    return-object v2

    .line 131
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 132
    const/4 v2, 0x1

    invoke-static {p0, v2}, Lcom/google/android/talk/DatabaseUtils;->getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 133
    .local v0, "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 134
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .end local v1    # "retVal":Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct {v1, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .end local v0    # "b":Landroid/graphics/Bitmap;
    .restart local v1    # "retVal":Landroid/graphics/drawable/BitmapDrawable;
    :cond_1
    move-object v2, v1

    .line 138
    goto :goto_0
.end method

.method public static final getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J
    .locals 10
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 284
    const-wide/16 v7, 0x0

    .line 286
    .local v7, "pid":J
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v0, "username"

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    .local v9, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "=? AND "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    const-string v0, "account"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    const/16 v0, 0x3d

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 292
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 293
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object p1, v4, v0

    .line 295
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/DatabaseUtils;->CONTACT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 301
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 303
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 304
    sget v0, Lcom/google/android/talk/DatabaseUtils;->CONTACT_COLUMN_ID:I

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v7

    .line 307
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 313
    :goto_0
    return-wide v7

    .line 307
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 310
    :cond_1
    const-string v0, "getIdForContact"

    invoke-static {v0}, Lcom/google/android/talk/DatabaseUtils;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getProviderIdForName(Landroid/content/ContentResolver;Ljava/lang/String;)J
    .locals 9
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 90
    sget-object v1, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/DatabaseUtils;->PROVIDER_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "name=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0x22

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 96
    .local v6, "c":Landroid/database/Cursor;
    const-wide/16 v7, 0x0

    .line 98
    .local v7, "retVal":J
    if-eqz v6, :cond_1

    .line 100
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v7

    .line 104
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 110
    :goto_0
    return-wide v7

    .line 104
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 107
    :cond_1
    const-string v0, "getProviderIdForName"

    invoke-static {v0}, Lcom/google/android/talk/DatabaseUtils;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static final hasActiveChats(Landroid/content/Context;)Z
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 202
    const-wide/16 v0, -0x1

    invoke-static {p0, v0, v1}, Lcom/google/android/talk/DatabaseUtils;->numChatsByAccountId(Landroid/content/Context;J)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static loadAvatarData(Landroid/database/Cursor;I)[B
    .locals 1
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p1, "dataColumn"    # I

    .prologue
    .line 142
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    return-object v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 360
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DatabaseUtils] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    return-void
.end method

.method private static logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p0, "function"    # Ljava/lang/String;

    .prologue
    .line 364
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[Databaseutils] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    return-void
.end method

.method static final numChatsByAccountId(Landroid/content/Context;J)I
    .locals 9
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "accountId"    # J

    .prologue
    const/4 v2, 0x0

    .line 219
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 220
    .local v0, "cr":Landroid/content/ContentResolver;
    const/4 v3, 0x0

    .line 222
    .local v3, "where":Ljava/lang/String;
    const-wide/16 v4, -0x1

    cmp-long v1, p1, v4

    if-eqz v1, :cond_0

    .line 223
    const-string v1, "contact_id in (select _id from contacts where account=%d)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 226
    :cond_0
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 229
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 231
    .local v7, "numChats":I
    if-eqz v6, :cond_1

    .line 233
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 235
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 240
    :goto_0
    return v7

    .line 235
    :catchall_0
    move-exception v1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v1

    .line 238
    :cond_1
    const-string v1, "numChatsByAccountId"

    invoke-static {v1}, Lcom/google/android/talk/DatabaseUtils;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static final pruneOldMessageHistory(Landroid/content/ContentResolver;Ljava/util/Map;)V
    .locals 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/talk/ProviderDef;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 318
    .local p1, "providerDefs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/talk/ProviderDef;>;"
    const-string v0, "gtalk_chat_message_lifetime"

    const-wide/32 v1, 0x240c8400

    invoke-static {p0, v0, v1, v2}, Landroid/provider/Settings$Gservices;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 321
    .local v0, "chatMsgLifetime":J
    const-string v2, "gtalk_otr_message_lifetime"

    const-wide/32 v3, 0x5265c00

    invoke-static {p0, v2, v3, v4}, Landroid/provider/Settings$Gservices;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v4

    .line 324
    .local v4, "otrMsgLifetime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 325
    .local v2, "now":J
    sub-long v6, v2, v0

    .line 326
    .local v6, "ts":J
    sub-long v1, v2, v4

    .line 328
    .end local v0    # "chatMsgLifetime":J
    .end local v2    # "now":J
    .local v1, "ts2":J
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v3, "date"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .end local v4    # "otrMsgLifetime":J
    move-result-object v3

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 331
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 333
    .local v3, "selection":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 334
    const-string v4, "date"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 335
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 337
    .local v4, "selection2":Ljava/lang/String;
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v1

    .line 339
    .local v1, "logLevel":I
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    .end local p1    # "providerDefs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/talk/ProviderDef;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 340
    .end local v6    # "ts":J
    .local v0, "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/talk/ProviderDef;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 341
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/talk/ProviderDef;

    .line 343
    .local p1, "def":Lcom/google/android/talk/ProviderDef;
    iget-wide v5, p1, Lcom/google/android/talk/ProviderDef;->mId:J

    invoke-static {v5, v6}, Landroid/provider/Im$Messages;->getContentUriByProvider(J)Landroid/net/Uri;

    move-result-object v2

    const/4 v5, 0x0

    invoke-virtual {p0, v2, v3, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 346
    .local v2, "result":I
    const/4 v5, 0x1

    if-ne v1, v5, :cond_1

    .line 347
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pruneOldMessageHistory: deleted "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .end local v2    # "result":I
    const-string v5, " messages"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/talk/DatabaseUtils;->log(Ljava/lang/String;)V

    .line 350
    :cond_1
    iget-wide v5, p1, Lcom/google/android/talk/ProviderDef;->mId:J

    invoke-static {v5, v6}, Landroid/provider/Im$Messages;->getOtrMessagesContentUriByProvider(J)Landroid/net/Uri;

    move-result-object p1

    .end local p1    # "def":Lcom/google/android/talk/ProviderDef;
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v4, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    .line 353
    .local p1, "result":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 354
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pruneOldMessageHistory: deleted "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    .end local p1    # "result":I
    const-string v2, " OTR messages"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/talk/DatabaseUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 357
    :cond_2
    return-void
.end method

.method public static queryAvatarCursorForUser(Landroid/content/ContentResolver;Ljava/lang/String;JJ)Landroid/database/Cursor;
    .locals 7
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    const/4 v0, 0x1

    .line 115
    invoke-static {p2, p3, p4, p5, v0}, Lcom/google/android/talk/AvatarCache;->getInstance(JJZ)Lcom/google/android/talk/AvatarCache;

    move-result-object v6

    .line 116
    .local v6, "cache":Lcom/google/android/talk/AvatarCache;
    invoke-virtual {v6}, Lcom/google/android/talk/AvatarCache;->getAvatarUri()Landroid/net/Uri;

    move-result-object v1

    .line 117
    .local v1, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/google/android/talk/DatabaseUtils;->AVATAR_PROJECTION:[Ljava/lang/String;

    const-string v3, "contact=?"

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method static final removeChatsByContactId(Landroid/content/ContentResolver;J)I
    .locals 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "contactId"    # J

    .prologue
    .line 212
    const-string v1, "contact_id = %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "where":Ljava/lang/String;
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public static saveAvatar(Landroid/content/ContentResolver;Ljava/lang/String;JJLandroid/graphics/Bitmap;)V
    .locals 7
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J
    .param p6, "avatar"    # Landroid/graphics/Bitmap;

    .prologue
    .line 159
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 160
    .local v2, "os":Ljava/io/ByteArrayOutputStream;
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x4b

    invoke-virtual {p6, v5, v6, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 161
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 163
    .local v1, "data":[B
    new-instance v4, Landroid/content/ContentValues;

    const/4 v5, 0x3

    invoke-direct {v4, v5}, Landroid/content/ContentValues;-><init>(I)V

    .line 164
    .local v4, "values":Landroid/content/ContentValues;
    const-string v5, "contact"

    invoke-virtual {v4, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    const-string v5, "data"

    invoke-virtual {v4, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 166
    const-string v5, "hash"

    invoke-static {v1}, Lcom/google/android/talk/DatabaseUtils;->computeAvatarHash([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const/4 v5, 0x1

    invoke-static {p2, p3, p4, p5, v5}, Lcom/google/android/talk/AvatarCache;->getInstance(JJZ)Lcom/google/android/talk/AvatarCache;

    move-result-object v0

    .line 170
    .local v0, "cache":Lcom/google/android/talk/AvatarCache;
    invoke-virtual {v0}, Lcom/google/android/talk/AvatarCache;->getAvatarUri()Landroid/net/Uri;

    move-result-object v3

    .line 171
    .local v3, "uri":Landroid/net/Uri;
    invoke-virtual {p0, v3, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 172
    return-void
.end method
