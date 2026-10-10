.class public Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;
.super Ljava/lang/Object;
.source "RmqServer2DeviceIdStoreImpl.java"

# interfaces
.implements Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStore;


# instance fields
.field private SETTING_PROJECTION:[Ljava/lang/String;

.field private SETTING_SELECTION:Ljava/lang/String;

.field private mProviderId:J

.field private mResolver:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;)V
    .locals 3
    .param p1, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "value"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->SETTING_PROJECTION:[Ljava/lang/String;

    .line 38
    const-string v0, "name = \'last_rmq_rec\'"

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->SETTING_SELECTION:Ljava/lang/String;

    .line 44
    iput-object p1, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mResolver:Landroid/content/ContentResolver;

    .line 45
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mResolver:Landroid/content/ContentResolver;

    const-string v1, "GTalk"

    invoke-static {v0, v1}, Landroid/provider/Im$Provider;->getProviderIdForName(Landroid/content/ContentResolver;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mProviderId:J

    .line 46
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 91
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RmqServer2DeviceIdStoreImpl] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-void
.end method


# virtual methods
.method public getLastReceivedRmqIdFromServer()J
    .locals 13

    .prologue
    const/4 v4, 0x0

    .line 49
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->SETTING_PROJECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->SETTING_SELECTION:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " AND "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "provider"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v11, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mProviderId:J

    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 56
    .local v6, "cursor":Landroid/database/Cursor;
    const-wide/16 v8, 0x0

    .line 58
    .local v8, "retVal":J
    if-eqz v6, :cond_1

    .line 60
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    const-string v0, "value"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 65
    .local v10, "strVal":Ljava/lang/String;
    :try_start_1
    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v8

    .line 71
    .end local v10    # "strVal":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 77
    :goto_1
    return-wide v8

    .line 66
    .restart local v10    # "strVal":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 67
    .local v7, "ex":Ljava/lang/NumberFormatException;
    :try_start_2
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getLastReceivedRmqIdFromServer caught "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 71
    .end local v7    # "ex":Ljava/lang/NumberFormatException;
    .end local v10    # "strVal":Ljava/lang/String;
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 74
    :cond_1
    const-string v0, "getLastReceivedRmqIdFromServer"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setLastReceivedRmqIdFromServer(J)V
    .locals 4
    .param p1, "id"    # J

    .prologue
    .line 81
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 82
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "name"

    const-string v2, "last_rmq_rec"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v1, "value"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string v1, "provider"

    iget-wide v2, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mProviderId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/RmqServer2DeviceIdStoreImpl;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 88
    return-void
.end method
