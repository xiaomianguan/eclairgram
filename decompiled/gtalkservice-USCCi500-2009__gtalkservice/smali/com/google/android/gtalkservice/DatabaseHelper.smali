.class public Lcom/google/android/gtalkservice/DatabaseHelper;
.super Ljava/lang/Object;
.source "DatabaseHelper.java"


# static fields
.field private static final ACCOUNT_PROJECTION:[Ljava/lang/String;

.field private static CONTACT_COLUMN_ID:I = 0x0

.field private static CONTACT_COLUMN_NICKNAME:I = 0x0

.field private static final CONTACT_PROJECTION:[Ljava/lang/String;

.field private static final DBG:Z = false

.field private static final GROUP_MEMBERS_PROJECTION:[Ljava/lang/String;

.field public static final OTR_COLUMN:I = 0x1

.field public static final OTR_PROJECTION:[Ljava/lang/String;

.field public static final USERNAME_COLUMN:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const-string v6, "nickname"

    const-string v2, "_id"

    .line 40
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v2, v0, v3

    const-string v1, "nickname"

    aput-object v6, v0, v4

    sput-object v0, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_PROJECTION:[Ljava/lang/String;

    .line 45
    sput v3, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_COLUMN_ID:I

    .line 46
    sput v4, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_COLUMN_NICKNAME:I

    .line 48
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "groupId"

    aput-object v1, v0, v3

    const-string v1, "nickname"

    aput-object v6, v0, v4

    sput-object v0, Lcom/google/android/gtalkservice/DatabaseHelper;->GROUP_MEMBERS_PROJECTION:[Ljava/lang/String;

    .line 53
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v2, v0, v3

    const-string v1, "pw"

    aput-object v1, v0, v4

    const-string v1, "active"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "last_login_state"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gtalkservice/DatabaseHelper;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    .line 60
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "username"

    aput-object v1, v0, v3

    const-string v1, "otr"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/android/gtalkservice/DatabaseHelper;->OTR_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final addAccount(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;Z)J
    .locals 7
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "locked"    # Z

    .prologue
    const/4 v6, 0x1

    .line 153
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addAccount: provider="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", username="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", locked="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 156
    :cond_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3, v6}, Landroid/content/ContentValues;-><init>(I)V

    .line 157
    .local v3, "values":Landroid/content/ContentValues;
    move-object v0, p3

    .line 159
    .local v0, "accountName":Ljava/lang/String;
    const-string v4, "active"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 160
    const-string v4, "name"

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    const-string v4, "provider"

    new-instance v5, Ljava/lang/Long;

    invoke-direct {v5, p1, p2}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 162
    const-string v4, "username"

    invoke-virtual {v3, v4, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    const-string v4, "pw"

    invoke-virtual {v3, v4, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const-string v4, "locked"

    if-eqz p5, :cond_1

    move v5, v6

    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 167
    :try_start_0
    sget-object v4, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v4, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 168
    .local v2, "uri":Landroid/net/Uri;
    if-eqz v2, :cond_2

    .line 169
    invoke-static {v2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 175
    .end local v2    # "uri":Landroid/net/Uri;
    :goto_1
    return-wide v4

    .line 164
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 171
    :catch_0
    move-exception v4

    move-object v1, v4

    .line 172
    .local v1, "e":Landroid/database/SQLException;
    const-string v4, "GTalkService"

    const-string v5, "addAccount caught "

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 175
    .end local v1    # "e":Landroid/database/SQLException;
    :cond_2
    const-wide/16 v4, 0x0

    goto :goto_1
.end method

.method public static addBulkContacts(Landroid/content/ContentResolver;Landroid/net/Uri;JJJLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Landroid/net/Uri;
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J
    .param p6, "contactList"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Landroid/net/Uri;",
            "JJJ",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/net/Uri;"
        }
    .end annotation

    .prologue
    .line 320
    .local p8, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p9, "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p10, "typeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p11, "subscriptionStatusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p12, "subscriptionTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p13, "quickContactAttrArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p14, "rejectedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 322
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "username"

    invoke-virtual {v3, v4, p8}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 323
    const-string p8, "nickname"

    .end local p8    # "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3, p8, p9}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 324
    const-string p8, "provider"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    .end local p2    # "providerId":J
    invoke-virtual {v3, p8, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 325
    const-string p2, "account"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {v3, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 326
    const-string p2, "contactList"

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {v3, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 327
    const-string p2, "type"

    invoke-virtual {v3, p2, p10}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 328
    const-string p2, "subscriptionStatus"

    move-object v0, v3

    move-object v1, p2

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 329
    const-string p2, "subscriptionType"

    move-object v0, v3

    move-object v1, p2

    move-object/from16 v2, p12

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 330
    const-string p2, "qc"

    move-object v0, v3

    move-object v1, p2

    move-object/from16 v2, p13

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 331
    const-string p2, "rejected"

    move-object v0, v3

    move-object v1, p2

    move-object/from16 v2, p14

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 336
    :try_start_0
    invoke-virtual {p0, p1, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 339
    .end local p0    # "resolver":Landroid/content/ContentResolver;
    .end local p1    # "uri":Landroid/net/Uri;
    :goto_0
    return-object p0

    .line 337
    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception p0

    .line 338
    .local p0, "e":Landroid/database/SQLException;
    const-string p1, "GTalkService"

    .end local p1    # "uri":Landroid/net/Uri;
    const-string p2, "addBulkContacts caught "

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 339
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public static addContact(Landroid/content/ContentResolver;JJJLjava/lang/String;Ljava/lang/String;III)Landroid/net/Uri;
    .locals 4
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "contactList"    # J
    .param p7, "username"    # Ljava/lang/String;
    .param p8, "nickname"    # Ljava/lang/String;
    .param p9, "type"    # I
    .param p10, "subscriptionStatus"    # I
    .param p11, "subscriptionType"    # I

    .prologue
    .line 288
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 290
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "username"

    invoke-virtual {v1, v2, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const-string v2, "nickname"

    invoke-virtual {v1, v2, p8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v2, "provider"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 293
    const-string v2, "account"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 294
    const-string v2, "contactList"

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 295
    const-string v2, "type"

    invoke-static {p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 296
    const-string v2, "subscriptionStatus"

    invoke-static {p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 297
    const-string v2, "subscriptionType"

    invoke-static {p11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 302
    :try_start_0
    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 305
    :goto_0
    return-object v2

    .line 303
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 304
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "addContact caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 305
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static final addOrUpdateAccount(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;Z)J
    .locals 16
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "locked"    # Z

    .prologue
    .line 72
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "addOrUpdateAccount: provider="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", username="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", locked="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 75
    :cond_0
    const-string v8, "provider=? AND username=?"

    .line 77
    .local v8, "selection":Ljava/lang/String;
    const/4 v5, 0x2

    new-array v9, v5, [Ljava/lang/String;

    .line 78
    .local v9, "selectionArgs":[Ljava/lang/String;
    const/4 v5, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v5

    .line 79
    const/4 v5, 0x1

    aput-object p3, v9, v5

    .line 81
    sget-object v6, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    sget-object v7, Lcom/google/android/gtalkservice/DatabaseHelper;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    const-string v10, "name ASC"

    move-object/from16 v5, p0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 87
    .local v10, "cursor":Landroid/database/Cursor;
    const/4 v11, 0x1

    .line 89
    .local v11, "updateActive":Z
    const/4 v12, 0x0

    .line 90
    .local v12, "updatePassword":Z
    const-wide/16 v5, 0x0

    .line 92
    .local v5, "accountId":J
    if-eqz v10, :cond_4

    .line 94
    :try_start_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 95
    const-string v7, "_id"

    invoke-interface {v10, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v10, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    .line 96
    const-string v7, "active"

    invoke-interface {v10, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v10, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 98
    .local v7, "active":I
    sget-boolean v13, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v13, :cond_1

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "addOrUpdateAccount: found account for username="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object v0, v13

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " accountId="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", active="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 101
    :cond_1
    const/4 v13, 0x1

    if-ne v7, v13, :cond_2

    .line 102
    const/4 v7, 0x0

    .end local v11    # "updateActive":Z
    .local v7, "updateActive":Z
    move v11, v7

    .line 105
    .end local v7    # "updateActive":Z
    .restart local v11    # "updateActive":Z
    :cond_2
    if-eqz p4, :cond_8

    .line 106
    const-string v7, "pw"

    invoke-interface {v10, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v10, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 109
    .local v7, "oldPassword":Ljava/lang/String;
    move-object/from16 v0, p4

    move-object v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .end local v7    # "oldPassword":Ljava/lang/String;
    if-nez v7, :cond_8

    .line 110
    const/4 v7, 0x1

    .end local v12    # "updatePassword":Z
    .local v7, "updatePassword":Z
    move v15, v7

    .end local v7    # "updatePassword":Z
    .local v15, "updatePassword":Z
    move v7, v11

    .end local v11    # "updateActive":Z
    .local v7, "updateActive":Z
    move v11, v15

    .line 115
    .end local v15    # "updatePassword":Z
    .local v11, "updatePassword":Z
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    move v10, v7

    .line 124
    .end local v7    # "updateActive":Z
    .local v10, "updateActive":Z
    :goto_1
    if-eqz v10, :cond_3

    .line 125
    new-instance v7, Landroid/content/ContentValues;

    const/4 v12, 0x1

    invoke-direct {v7, v12}, Landroid/content/ContentValues;-><init>(I)V

    .line 126
    .local v7, "values":Landroid/content/ContentValues;
    const-string v12, "active"

    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v7, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 128
    :try_start_1
    sget-object v12, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "provider="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object v0, v13

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p0

    move-object v1, v12

    move-object v2, v7

    move-object v3, v13

    move-object v4, v14

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    .line 139
    .end local v7    # "values":Landroid/content/ContentValues;
    :cond_3
    :goto_2
    const-wide/16 v12, 0x0

    cmp-long v7, v5, v12

    if-nez v7, :cond_5

    .line 140
    invoke-static/range {p0 .. p5}, Lcom/google/android/gtalkservice/DatabaseHelper;->addAccount(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;Z)J

    move-result-wide p0

    .line 145
    .end local v5    # "accountId":J
    .end local p1    # "providerId":J
    .local p0, "accountId":J
    :goto_3
    return-wide p0

    .line 115
    .restart local v5    # "accountId":J
    .local v10, "cursor":Landroid/database/Cursor;
    .local v11, "updateActive":Z
    .restart local v12    # "updatePassword":Z
    .local p0, "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "providerId":J
    :catchall_0
    move-exception p0

    move-object/from16 p3, p0

    move/from16 p2, v11

    .end local v11    # "updateActive":Z
    .end local p1    # "providerId":J
    .local p2, "updateActive":Z
    move-wide/from16 p0, v5

    .end local v5    # "accountId":J
    .end local p3    # "username":Ljava/lang/String;
    .local p0, "accountId":J
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw p3

    .line 118
    .end local p2    # "updateActive":Z
    .restart local v5    # "accountId":J
    .restart local v11    # "updateActive":Z
    .local p0, "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "providerId":J
    .restart local p3    # "username":Ljava/lang/String;
    :cond_4
    const-string v7, "addOrUpdateAccount"

    invoke-static {v7}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    move v10, v11

    .end local v11    # "updateActive":Z
    .local v10, "updateActive":Z
    move v11, v12

    .end local v12    # "updatePassword":Z
    .local v11, "updatePassword":Z
    goto :goto_1

    .line 132
    .restart local v7    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v7

    .line 133
    .local v7, "e":Landroid/database/SQLException;
    const-string v12, "GTalkService"

    const-string v13, "addOrUpdateAccount caught "

    invoke-static {v12, v13, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 141
    .end local v7    # "e":Landroid/database/SQLException;
    :cond_5
    if-nez v10, :cond_6

    if-eqz v11, :cond_7

    .line 142
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move/from16 v2, p5

    move-object v3, v8

    move-object v4, v9

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateAccount(Landroid/content/ContentResolver;Ljava/lang/String;ZLjava/lang/String;[Ljava/lang/String;)V

    :cond_7
    move-wide/from16 p0, v5

    .end local v5    # "accountId":J
    .end local p1    # "providerId":J
    .local p0, "accountId":J
    goto :goto_3

    .restart local v5    # "accountId":J
    .local v10, "cursor":Landroid/database/Cursor;
    .local v11, "updateActive":Z
    .restart local v12    # "updatePassword":Z
    .local p0, "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "providerId":J
    :cond_8
    move v7, v11

    .end local v11    # "updateActive":Z
    .local v7, "updateActive":Z
    move v11, v12

    .end local v12    # "updatePassword":Z
    .local v11, "updatePassword":Z
    goto :goto_0
.end method

.method public static final clearAllChats(Landroid/content/ContentResolver;J)V
    .locals 0
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    .line 861
    invoke-static {p0, p1, p2}, Lcom/google/android/gtalkservice/DatabaseHelper;->clearAllChatsForAccount(Landroid/content/ContentResolver;J)V

    .line 863
    invoke-static {p0, p1, p2}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteGroupchatContacts(Landroid/content/ContentResolver;J)V

    .line 864
    return-void
.end method

.method static final clearAllChatsForAccount(Landroid/content/ContentResolver;J)V
    .locals 1
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    const/4 v0, 0x0

    .line 718
    invoke-static {p0, p1, p2, v0, v0}, Lcom/google/android/gtalkservice/DatabaseHelper;->clearChatsForAccount(Landroid/content/ContentResolver;JLjava/lang/String;[Ljava/lang/String;)V

    .line 719
    return-void
.end method

.method static final clearChatsForAccount(Landroid/content/ContentResolver;JLjava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 726
    sget-object v2, Landroid/provider/Im$Chats;->CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    invoke-static {v2, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 728
    .local v1, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-virtual {p0, v1, p3, p4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 733
    :goto_0
    return-void

    .line 730
    :catch_0
    move-exception v0

    .line 731
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "clearChatsForAccount caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static final clearOtrMessagesForAccount(Landroid/content/ContentResolver;J)V
    .locals 4
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    .line 737
    invoke-static {p1, p2}, Landroid/provider/Im$Messages;->getOtrMessagesContentUriByAccount(J)Landroid/net/Uri;

    move-result-object v1

    .line 739
    .local v1, "uri":Landroid/net/Uri;
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 744
    :goto_0
    return-void

    .line 741
    :catch_0
    move-exception v0

    .line 742
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "clearOtrMessagesForAccount caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static final clearStoredRoster(Landroid/content/ContentResolver;J)V
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    .line 576
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 592
    :goto_0
    return-void

    .line 580
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "clearStoredRoster for account = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 582
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "account"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 583
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v2, 0x3d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 586
    :try_start_0
    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 587
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 588
    .local v1, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "clearStoredRoster caught "

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static constructWhereClause(Ljava/lang/String;JJ)Ljava/lang/String;
    .locals 2
    .param p0, "username"    # Ljava/lang/String;
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J

    .prologue
    .line 470
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 472
    .local v0, "whereClause":Ljava/lang/StringBuilder;
    const-string v1, "account"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    const-string v1, "=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 475
    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    if-eqz p0, :cond_0

    .line 478
    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    const-string v1, "username"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    invoke-static {v0, p0}, Landroid/database/DatabaseUtils;->appendEscapedSQLString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 484
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static deleteContact(Landroid/content/ContentResolver;JJLjava/lang/String;)I
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "username"    # Ljava/lang/String;

    .prologue
    .line 406
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "deleteContact: username="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 407
    :cond_0
    invoke-static {p5, p1, p2, p3, p4}, Lcom/google/android/gtalkservice/DatabaseHelper;->constructWhereClause(Ljava/lang/String;JJ)Ljava/lang/String;

    move-result-object v1

    .line 409
    .local v1, "whereClause":Ljava/lang/String;
    :try_start_0
    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 412
    :goto_0
    return v2

    .line 410
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 411
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "deleteContact caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 412
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static deleteContacts(Landroid/content/ContentResolver;JLjava/util/Collection;)I
    .locals 12
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "J",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p3, "rosterEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    const/4 v11, 0x0

    .line 418
    invoke-interface {p3}, Ljava/util/Collection;->size()I

    move-result v1

    .line 420
    .local v1, "count":I
    sget-boolean v9, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v9, :cond_0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "deleteContacts for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " entries"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 422
    :cond_0
    if-nez v1, :cond_1

    move v9, v11

    .line 460
    :goto_0
    return v9

    .line 426
    :cond_1
    new-array v8, v1, [Ljava/lang/String;

    .line 428
    .local v8, "selectionArgs":[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 430
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v9, "account"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    const-string v9, "=\'"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 433
    const-string v9, "\' AND ("

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    const/4 v4, 0x0

    .line 436
    .local v4, "i":I
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/RosterEntry;

    .line 437
    .local v3, "entry":Lorg/jivesoftware/smack/RosterEntry;
    const-string v9, "username"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "=?"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    const/4 v9, 0x1

    sub-int v9, v1, v9

    if-ge v4, v9, :cond_2

    .line 439
    const-string v9, " OR "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    :cond_2
    invoke-virtual {v3}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    .line 443
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 446
    .end local v3    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_3
    const/16 v9, 0x29

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 449
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 450
    .local v7, "selection":Ljava/lang/String;
    sget-boolean v9, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v9, :cond_4

    .line 451
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "deleteContacts: selection="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 452
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_2
    array-length v9, v8

    if-ge v6, v9, :cond_4

    .line 453
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  selectionArg["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v8, v6

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 452
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 457
    .end local v6    # "j":I
    :cond_4
    sget-object v9, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v9, v7, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    goto/16 :goto_0

    .line 458
    .end local v7    # "selection":Ljava/lang/String;
    :catch_0
    move-exception v9

    move-object v2, v9

    .line 459
    .local v2, "e":Landroid/database/SQLException;
    const-string v9, "GTalkService"

    const-string v10, "deleteContact caught "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v9, v11

    .line 460
    goto/16 :goto_0
.end method

.method static final deleteGroupMember(Landroid/content/ContentResolver;JLjava/lang/String;)Z
    .locals 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "groupId"    # J
    .param p3, "nickname"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 664
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "nickname"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 665
    .local v4, "whereClause":Ljava/lang/StringBuilder;
    const-string v5, "=?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    new-array v2, v6, [Ljava/lang/String;

    .line 668
    .local v2, "selectionArgs":[Ljava/lang/String;
    aput-object p3, v2, v7

    .line 670
    sget-object v5, Landroid/provider/Im$GroupMembers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v5, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    .line 672
    .local v3, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 675
    .local v1, "result":I
    if-lez v1, :cond_0

    move v5, v6

    .line 678
    .end local v1    # "result":I
    :goto_0
    return v5

    .restart local v1    # "result":I
    :cond_0
    move v5, v7

    .line 675
    goto :goto_0

    .line 676
    .end local v1    # "result":I
    :catch_0
    move-exception v5

    move-object v0, v5

    .line 677
    .local v0, "e":Landroid/database/SQLException;
    const-string v5, "GTalkService"

    const-string v6, "deleteGroupMember caught "

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v7

    .line 678
    goto :goto_0
.end method

.method static final deleteGroupchatContacts(Landroid/content/ContentResolver;J)V
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    const/16 v4, 0x3d

    .line 596
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 612
    :goto_0
    return-void

    .line 600
    :cond_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "deleteGroupchatContacts for account = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 602
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "account"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 603
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 604
    const-string v2, " AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    const-string v2, "type"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 608
    :try_start_0
    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 609
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 610
    .local v1, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "deleteGroupchatContacts caught "

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static final getGroupMemberList(Landroid/content/ContentResolver;J)Ljava/util/List;
    .locals 9
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "groupId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "J)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 684
    sget-object v0, Landroid/provider/Im$GroupMembers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 686
    .local v1, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/google/android/gtalkservice/DatabaseHelper;->GROUP_MEMBERS_PROJECTION:[Ljava/lang/String;

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 690
    .local v6, "c":Landroid/database/Cursor;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 691
    .local v8, "retVal":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v6, :cond_1

    .line 693
    :try_start_0
    const-string v0, "nickname"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 694
    .local v7, "nicknameCol":I
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 695
    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 698
    .end local v7    # "nicknameCol":I
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .restart local v7    # "nicknameCol":I
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 705
    .end local v7    # "nicknameCol":I
    :goto_1
    return-object v8

    .line 701
    :cond_1
    const-string v0, "getGroupMemberList"

    invoke-static {v0}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static final getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J
    .locals 10
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 203
    const-wide/16 v7, 0x0

    .line 205
    .local v7, "pid":J
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v0, "username"

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .local v9, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "=? AND "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    const-string v0, "account"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    const/16 v0, 0x3d

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 211
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 212
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object p1, v4, v0

    .line 214
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 220
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 222
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    sget v0, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_COLUMN_ID:I

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v7

    .line 226
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 232
    :goto_0
    return-wide v7

    .line 226
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 229
    :cond_1
    const-string v0, "getIdForContact"

    invoke-static {v0}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static final getNicknameCursor(Landroid/content/ContentResolver;Ljava/lang/String;J)Landroid/database/Cursor;
    .locals 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 238
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v0, "username"

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 240
    .local v7, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "=? AND "

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    const-string v0, "account"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    const/16 v0, 0x3d

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 244
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .line 245
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    aput-object p1, v4, v0

    .line 247
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 253
    .local v6, "c":Landroid/database/Cursor;
    return-object v6
.end method

.method public static final getNicknameForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)Ljava/lang/String;
    .locals 3
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 261
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/DatabaseHelper;->getNicknameCursor(Landroid/content/ContentResolver;Ljava/lang/String;J)Landroid/database/Cursor;

    move-result-object v0

    .line 263
    .local v0, "c":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 265
    .local v1, "retVal":Ljava/lang/String;
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    sget v2, Lcom/google/android/gtalkservice/DatabaseHelper;->CONTACT_COLUMN_NICKNAME:I

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 269
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 272
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 273
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseAbbrevAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 276
    :cond_1
    return-object v1

    .line 269
    :catchall_0
    move-exception v2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v2
.end method

.method static getOffTheRecordCursor(Landroid/content/ContentResolver;JLjava/lang/String;)Landroid/database/Cursor;
    .locals 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    const-string v2, "=?"

    .line 816
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 817
    .local v7, "selection":Ljava/lang/StringBuilder;
    const-string v0, "account"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 818
    const-string v0, "username"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    .line 821
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 822
    const/4 v0, 0x1

    aput-object p3, v4, v0

    .line 824
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/DatabaseHelper;->OTR_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 831
    .local v6, "cursor":Landroid/database/Cursor;
    return-object v6
.end method

.method public static getPresence(Landroid/content/ContentResolver;Landroid/net/Uri;J)I
    .locals 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "contactId"    # J

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 519
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "mode"

    aput-object v0, v2, v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "contact_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 525
    .local v6, "c":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 527
    .local v7, "presence":I
    if-eqz v6, :cond_1

    .line 529
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 530
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 533
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 538
    :goto_0
    return v7

    .line 533
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 536
    :cond_1
    const-string v0, "getPresence"

    invoke-static {v0}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static final insertGroupMember(Landroid/content/ContentResolver;JLjava/lang/String;)Z
    .locals 6
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "groupId"    # J
    .param p3, "nickname"    # Ljava/lang/String;

    .prologue
    .line 617
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "nickname"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 618
    .local v0, "whereClause":Ljava/lang/StringBuilder;
    const-string v1, "=?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    .line 621
    .local v4, "selectionArgs":[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p3, v4, v1

    .line 623
    sget-object v1, Landroid/provider/Im$GroupMembers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 625
    .local v1, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/google/android/gtalkservice/DatabaseHelper;->GROUP_MEMBERS_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .end local v0    # "whereClause":Ljava/lang/StringBuilder;
    move-result-object p1

    .line 631
    .local p1, "c":Landroid/database/Cursor;
    const/4 p2, 0x0

    .line 633
    .local p2, "doAdd":Z
    if-eqz p1, :cond_2

    .line 635
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 636
    const/4 p2, 0x1

    .line 639
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    move p1, p2

    .line 645
    .end local p2    # "doAdd":Z
    .local p1, "doAdd":Z
    :goto_0
    if-eqz p1, :cond_1

    .line 647
    new-instance p2, Landroid/content/ContentValues;

    const/4 v0, 0x2

    invoke-direct {p2, v0}, Landroid/content/ContentValues;-><init>(I)V

    .line 648
    .local p2, "values1":Landroid/content/ContentValues;
    const-string v0, "nickname"

    invoke-virtual {p2, v0, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 649
    move-object p2, p2

    .line 652
    .local p2, "values":Landroid/content/ContentValues;
    :try_start_1
    invoke-virtual {p0, v1, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    .line 658
    .end local p0    # "resolver":Landroid/content/ContentResolver;
    .end local p2    # "values":Landroid/content/ContentValues;
    .end local p3    # "nickname":Ljava/lang/String;
    :cond_1
    :goto_1
    return p1

    .line 639
    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    .local p1, "c":Landroid/database/Cursor;
    .local p2, "doAdd":Z
    .restart local p3    # "nickname":Ljava/lang/String;
    :catchall_0
    move-exception p0

    .end local p0    # "resolver":Landroid/content/ContentResolver;
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p0

    .line 642
    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    :cond_2
    const-string p1, "insertGroupMember"

    .end local p1    # "c":Landroid/database/Cursor;
    invoke-static {p1}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    move p1, p2

    .end local p2    # "doAdd":Z
    .local p1, "doAdd":Z
    goto :goto_0

    .line 653
    .local p2, "values":Landroid/content/ContentValues;
    :catch_0
    move-exception p0

    .line 654
    .local p0, "e":Landroid/database/SQLException;
    const-string p2, "GTalkService"

    .end local p2    # "values":Landroid/content/ContentValues;
    const-string p3, "insertGroupMember caught "

    .end local p3    # "nickname":Ljava/lang/String;
    invoke-static {p2, p3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method static isAccountLastOnline(Landroid/content/ContentResolver;J)Z
    .locals 10
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    const/4 v4, 0x0

    .line 747
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 748
    .local v9, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "_id"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 750
    sget-object v1, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/DatabaseHelper;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 756
    .local v6, "c":Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 758
    .local v8, "lastOnline":Z
    if-eqz v6, :cond_2

    .line 760
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 761
    const-string v0, "last_login_state"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 763
    .local v7, "lastLoginState":I
    if-lez v7, :cond_1

    const/4 v0, 0x1

    move v8, v0

    .line 767
    .end local v7    # "lastLoginState":I
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 773
    :goto_1
    return v8

    .line 763
    .restart local v7    # "lastLoginState":I
    :cond_1
    const/4 v0, 0x0

    move v8, v0

    goto :goto_0

    .line 767
    .end local v7    # "lastLoginState":I
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 770
    :cond_2
    const-string v0, "isAccountLastOnline"

    invoke-static {v0}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method static isOffTheRecordWithContact(Landroid/content/ContentResolver;JLjava/lang/String;)Z
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 803
    const/4 v2, 0x0

    .line 804
    .local v2, "retVal":Z
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/DatabaseHelper;->getOffTheRecordCursor(Landroid/content/ContentResolver;JLjava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 806
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 807
    .local v1, "otr":I
    if-nez v1, :cond_0

    const/4 v3, 0x0

    move v2, v3

    .line 809
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 812
    return v2

    :cond_0
    move v2, v4

    .line 807
    goto :goto_0

    .line 809
    .end local v1    # "otr":I
    :catchall_0
    move-exception v3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v3
.end method

.method private static final log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 925
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DbHelper] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    return-void
.end method

.method private static final logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p0, "function"    # Ljava/lang/String;

    .prologue
    .line 929
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DbHelper] "

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

    .line 930
    return-void
.end method

.method public static presenceHasUser(Landroid/content/ContentResolver;J)Z
    .locals 9
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "contactId"    # J

    .prologue
    const/4 v2, 0x0

    .line 495
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 496
    .local v8, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "contact_id"

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 497
    sget-object v1, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 503
    .local v6, "c":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 505
    .local v7, "exists":Z
    if-eqz v6, :cond_0

    .line 507
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 509
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 514
    :goto_0
    return v7

    .line 509
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 512
    :cond_0
    const-string v0, "presenceHasUser"

    invoke-static {v0}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static final pruneChats(Landroid/content/ContentResolver;JJ)V
    .locals 6
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .param p3, "time"    # J

    .prologue
    .line 872
    sget-object v0, Landroid/provider/Im$Chats;->CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 876
    .local v1, "uriChatsByAccount":Landroid/net/Uri;
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 877
    .end local p1    # "accountId":J
    .local p2, "groupchatIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 878
    .local p1, "selection":Ljava/lang/StringBuilder;
    const-string v0, "groupchat"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "=1"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 879
    const-string v0, " AND "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 880
    const-string v0, "last_message_date"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "<"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 881
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "contact_id"

    aput-object v3, v2, v0

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 887
    .local p1, "cursor":Landroid/database/Cursor;
    if-eqz p1, :cond_3

    .line 889
    :goto_0
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 890
    const-string v0, "contact_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 894
    :catchall_0
    move-exception p0

    .end local p0    # "resolver":Landroid/content/ContentResolver;
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p0

    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 902
    .end local p1    # "cursor":Landroid/database/Cursor;
    :goto_1
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 903
    .local v0, "where":Ljava/lang/StringBuilder;
    const-string p1, "last_message_date"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "<"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 904
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p0, v1, p1, p3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 907
    .end local p3    # "time":J
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_2

    .line 908
    const/4 p1, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p3

    invoke-virtual {v0, p1, p3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 909
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    .local p2, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    .line 910
    .local p1, "contactId":Ljava/lang/Long;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p3

    if-lez p3, :cond_1

    .line 911
    const-string p3, " OR "

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 913
    :cond_1
    const-string p3, "_id"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, "="

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 919
    .end local v0    # "where":Ljava/lang/StringBuilder;
    .end local p1    # "contactId":Ljava/lang/Long;
    .end local p2    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception p0

    .line 920
    .local p0, "e":Landroid/database/SQLException;
    const-string p1, "GTalkService"

    const-string p2, "pruneChats caught "

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 922
    .end local p0    # "e":Landroid/database/SQLException;
    :cond_2
    :goto_3
    return-void

    .line 897
    .local p0, "resolver":Landroid/content/ContentResolver;
    .local p1, "cursor":Landroid/database/Cursor;
    .local p2, "groupchatIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local p3    # "time":J
    :cond_3
    const-string p1, "pruneChats"

    .end local p1    # "cursor":Landroid/database/Cursor;
    invoke-static {p1}, Lcom/google/android/gtalkservice/DatabaseHelper;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1

    .line 915
    .end local p3    # "time":J
    .restart local v0    # "where":Ljava/lang/StringBuilder;
    .local p2, "i$":Ljava/util/Iterator;
    :cond_4
    :try_start_2
    sget-object p1, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .end local p2    # "i$":Ljava/util/Iterator;
    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, p3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3
.end method

.method public static final rosterHasContact(Landroid/content/ContentResolver;Ljava/lang/String;J)Z
    .locals 4
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 281
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setAccountStatus(Landroid/content/ContentResolver;JII)V
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .param p3, "presenceStatus"    # I
    .param p4, "connectionStatus"    # I

    .prologue
    .line 560
    sget-object v1, Landroid/provider/Im$AccountStatus;->CONTENT_URI:Landroid/net/Uri;

    .line 561
    .local v1, "uri":Landroid/net/Uri;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 563
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "account"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 564
    const-string v3, "presenceStatus"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 565
    const-string v3, "connStatus"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 568
    :try_start_0
    invoke-virtual {p0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    :goto_0
    return-void

    .line 569
    :catch_0
    move-exception v0

    .line 570
    .local v0, "e":Landroid/database/SQLException;
    const-string v3, "GTalkService"

    const-string v4, "setAccountStatus caught "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static setEtag(Landroid/content/ContentResolver;Ljava/lang/String;JLjava/lang/String;)V
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "accountId"    # J
    .param p4, "etag"    # Ljava/lang/String;

    .prologue
    .line 840
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "update or insert "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' to db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 841
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    .line 842
    .local v1, "values":Landroid/content/ContentValues;
    invoke-virtual {v1, p1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 843
    const-string v2, "account"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 845
    :try_start_0
    sget-object v2, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "account="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v1, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_1

    .line 849
    sget-object v2, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 854
    :cond_1
    :goto_0
    return-void

    .line 851
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 852
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "setEtag caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static setOtrEtag(Landroid/content/ContentResolver;JLjava/lang/String;)V
    .locals 1
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .param p3, "etag"    # Ljava/lang/String;

    .prologue
    .line 835
    const-string v0, "otr_etag"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/google/android/gtalkservice/DatabaseHelper;->setEtag(Landroid/content/ContentResolver;Ljava/lang/String;JLjava/lang/String;)V

    .line 836
    return-void
.end method

.method public static setPresence(Landroid/content/ContentResolver;Landroid/net/Uri;JI)V
    .locals 4
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "contactId"    # J
    .param p4, "mode"    # I

    .prologue
    .line 542
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 544
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "contact_id"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 545
    const-string v2, "mode"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 549
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "contact_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v1, v2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_0

    .line 550
    invoke-virtual {p0, p1, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 555
    :cond_0
    :goto_0
    return-void

    .line 552
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 553
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "setPresence caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static setRosterEtag(Landroid/content/ContentResolver;JLjava/lang/String;)V
    .locals 1
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .param p3, "etag"    # Ljava/lang/String;

    .prologue
    .line 465
    const-string v0, "etag"

    invoke-static {p0, v0, p1, p2, p3}, Lcom/google/android/gtalkservice/DatabaseHelper;->setEtag(Landroid/content/ContentResolver;Ljava/lang/String;JLjava/lang/String;)V

    .line 466
    return-void
.end method

.method private static final updateAccount(Landroid/content/ContentResolver;Ljava/lang/String;ZLjava/lang/String;[Ljava/lang/String;)V
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "password"    # Ljava/lang/String;
    .param p2, "locked"    # Z
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 183
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 184
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "active"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 186
    if-eqz p1, :cond_0

    .line 187
    const-string v2, "pw"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    :cond_0
    const-string v2, "locked"

    if-eqz p2, :cond_1

    move v3, v4

    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 193
    :try_start_0
    sget-object v2, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v2, v1, p3, p4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    :goto_1
    return-void

    .line 190
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 194
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 195
    .local v0, "e":Landroid/database/SQLException;
    const-string v2, "GTalkService"

    const-string v3, "updateAccount caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public static updateBulkContacts(Landroid/content/ContentResolver;Landroid/net/Uri;JJJLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 5
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J
    .param p6, "contactList"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Landroid/net/Uri;",
            "JJJ",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 379
    .local p8, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p9, "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p10, "typeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p11, "subscriptionStatusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p12, "subscriptionTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p13, "quickContactAttrArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p14, "rejectedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 381
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "username"

    invoke-virtual {v3, v4, p8}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 382
    const-string p8, "nickname"

    .end local p8    # "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3, p8, p9}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 383
    const-string p8, "provider"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p9

    .end local p9    # "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3, p8, p9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 384
    const-string p8, "account"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p9

    invoke-virtual {v3, p8, p9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 385
    const-string p8, "contactList"

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p6

    .end local p6    # "contactList":J
    invoke-virtual {v3, p8, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 386
    const-string p6, "type"

    invoke-virtual {v3, p6, p10}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 387
    const-string p6, "subscriptionStatus"

    move-object v0, v3

    move-object v1, p6

    move-object/from16 v2, p11

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 388
    const-string p6, "subscriptionType"

    move-object v0, v3

    move-object v1, p6

    move-object/from16 v2, p12

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 389
    const-string p6, "qc"

    move-object v0, v3

    move-object v1, p6

    move-object/from16 v2, p13

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 390
    const-string p6, "rejected"

    move-object v0, v3

    move-object v1, p6

    move-object/from16 v2, p14

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 392
    const/4 p6, 0x0

    invoke-static {p6, p2, p3, p4, p5}, Lcom/google/android/gtalkservice/DatabaseHelper;->constructWhereClause(Ljava/lang/String;JJ)Ljava/lang/String;

    move-result-object p2

    .line 398
    .local p2, "whereClause":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p2

    .end local p2    # "whereClause":Ljava/lang/String;
    const/4 p3, 0x0

    invoke-virtual {p0, p1, v3, p2, p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 402
    .end local p0    # "resolver":Landroid/content/ContentResolver;
    .end local p1    # "uri":Landroid/net/Uri;
    :goto_0
    return-void

    .line 399
    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception p0

    .line 400
    .local p0, "e":Landroid/database/SQLException;
    const-string p1, "GTalkService"

    .end local p1    # "uri":Landroid/net/Uri;
    const-string p2, "updateBulkContacts caught "

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static updateContact(Landroid/content/ContentResolver;JJJLjava/lang/String;Ljava/lang/String;III)I
    .locals 2
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "contactList"    # J
    .param p7, "username"    # Ljava/lang/String;
    .param p8, "nickname"    # Ljava/lang/String;
    .param p9, "type"    # I
    .param p10, "subscriptionStatus"    # I
    .param p11, "subscriptionType"    # I

    .prologue
    .line 348
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 350
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "nickname"

    invoke-virtual {v0, v1, p8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    const-string p8, "contactList"

    .end local p8    # "nickname":Ljava/lang/String;
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    .end local p5    # "contactList":J
    invoke-virtual {v0, p8, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 352
    const-string p5, "type"

    invoke-static {p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-virtual {v0, p5, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 353
    const-string p5, "subscriptionStatus"

    invoke-static {p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-virtual {v0, p5, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 354
    const-string p5, "subscriptionType"

    invoke-static {p11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-virtual {v0, p5, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 356
    invoke-static {p7, p1, p2, p3, p4}, Lcom/google/android/gtalkservice/DatabaseHelper;->constructWhereClause(Ljava/lang/String;JJ)Ljava/lang/String;

    move-result-object p1

    .line 361
    .local p1, "whereClause":Ljava/lang/String;
    :try_start_0
    sget-object p2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    .end local p1    # "whereClause":Ljava/lang/String;
    const/4 p3, 0x0

    invoke-virtual {p0, p2, v0, p1, p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .end local p3    # "accountId":J
    move-result p0

    .line 364
    .end local p0    # "resolver":Landroid/content/ContentResolver;
    :goto_0
    return p0

    .line 362
    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    :catch_0
    move-exception p0

    .line 363
    .local p0, "e":Landroid/database/SQLException;
    const-string p1, "GTalkService"

    const-string p2, "updateContact caught "

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 364
    const/4 p0, 0x0

    goto :goto_0
.end method

.method static updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V
    .locals 9
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "value"    # I
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 778
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v7, :cond_0

    .line 779
    const-string v7, "updateOtrForContacts:"

    invoke-static {v7}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 781
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    selection="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 782
    const-string v7, "    selectionArgs:"

    invoke-static {v7}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 783
    move-object v0, p3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v0, v2

    .line 784
    .local v5, "s":Ljava/lang/String;
    invoke-static {v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V

    .line 783
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 788
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "s":Ljava/lang/String;
    :cond_0
    new-instance v6, Landroid/content/ContentValues;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Landroid/content/ContentValues;-><init>(I)V

    .line 789
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "otr"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 792
    :try_start_0
    sget-object v7, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v7, v6, p2, p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    .line 793
    .local v4, "result":I
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v7, :cond_1

    .line 794
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updateOtrForContacts for value="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " updated"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gtalkservice/DatabaseHelper;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 799
    .end local v4    # "result":I
    :cond_1
    :goto_1
    return-void

    .line 796
    :catch_0
    move-exception v7

    move-object v1, v7

    .line 797
    .local v1, "e":Landroid/database/SQLException;
    const-string v7, "GTalkService"

    const-string v8, "updateOtrForContacts caught "

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
