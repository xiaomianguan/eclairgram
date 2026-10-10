.class public Lcom/google/android/gtalkservice/service/GTalkServiceContext;
.super Ljava/lang/Object;
.source "GTalkServiceContext.java"


# static fields
.field private static final COLUMN_CATEGORY:I = 0x1

.field private static final COLUMN_ID:I

.field private static final DBG:Z


# instance fields
.field private PROJECTION:[Ljava/lang/String;

.field private mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

.field private mGtalkProviderId:J


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 4
    .param p1, "gtalkservice"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_id"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "category"

    aput-object v3, v1, v2

    iput-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->PROJECTION:[Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 56
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 57
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->createImProviders(Landroid/content/ContentResolver;)V

    .line 58
    return-void
.end method

.method private createImProviders(Landroid/content/ContentResolver;)V
    .locals 14
    .param p1, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 63
    sget-object v1, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->PROJECTION:[Ljava/lang/String;

    const-string v3, "name=?"

    new-array v4, v13, [Ljava/lang/String;

    const-string v0, "GTalk"

    aput-object v0, v4, v12

    const/4 v5, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 68
    .local v6, "c":Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 69
    .local v9, "foundProvider":Z
    const/4 v8, 0x0

    .line 71
    .local v8, "foundCategory":Z
    if-eqz v6, :cond_2

    .line 73
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 75
    .local v10, "id":J
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 79
    .local v7, "category":Ljava/lang/String;
    iput-wide v10, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->mGtalkProviderId:J

    .line 80
    const/4 v9, 0x1

    .line 82
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 83
    const/4 v8, 0x1

    .line 87
    .end local v7    # "category":Ljava/lang/String;
    .end local v10    # "id":J
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 93
    :goto_0
    if-nez v9, :cond_3

    .line 94
    invoke-direct {p0, p1, v12}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->loadProviderSettings(Landroid/content/ContentResolver;Z)V

    .line 98
    :cond_1
    :goto_1
    return-void

    .line 87
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 90
    :cond_2
    const-string v0, "createImProviders"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_3
    if-nez v8, :cond_1

    .line 96
    invoke-direct {p0, p1, v13}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->loadProviderSettings(Landroid/content/ContentResolver;Z)V

    goto :goto_1
.end method

.method private loadProviderSettings(Landroid/content/ContentResolver;Z)V
    .locals 20
    .param p1, "resolver"    # Landroid/content/ContentResolver;
    .param p2, "insertCategoryOnly"    # Z

    .prologue
    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    const/high16 v17, 0x7f040000

    invoke-virtual/range {v16 .. v17}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v10

    .line 109
    .local v10, "parser":Landroid/content/res/XmlResourceParser;
    :try_start_0
    const-string v16, "im_providers"

    move-object v0, v10

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 112
    :goto_0
    invoke-static {v10}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 113
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v13

    .line 114
    .local v13, "tag":Ljava/lang/String;
    const-string v16, "provider"

    move-object/from16 v0, v16

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v16

    if-nez v16, :cond_0

    .line 155
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->close()V

    .line 157
    .end local v13    # "tag":Ljava/lang/String;
    :goto_1
    return-void

    .line 118
    .restart local v13    # "tag":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->getAttributeCount()I

    move-result v9

    .line 120
    .local v9, "numAttrs":I
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 121
    .local v11, "prefs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v9, :cond_1

    .line 122
    invoke-interface {v10, v7}, Landroid/content/res/XmlResourceParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    .line 123
    .local v5, "attrName":Ljava/lang/String;
    invoke-interface {v10, v7}, Landroid/content/res/XmlResourceParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v14

    .line 125
    .local v14, "value":Ljava/lang/String;
    invoke-virtual {v11, v5, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 128
    .end local v5    # "attrName":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    :cond_1
    const-string v16, "category"

    move-object v0, v11

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 129
    .local v6, "category":Ljava/lang/String;
    const-string v16, "name"

    move-object v0, v11

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 131
    .local v8, "name":Ljava/lang/String;
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 132
    .local v15, "values":Landroid/content/ContentValues;
    const-string v16, "category"

    move-object v0, v15

    move-object/from16 v1, v16

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    if-eqz p2, :cond_3

    .line 135
    sget-boolean v16, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v16, :cond_2

    .line 136
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "update provider table for "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ", category= "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->log(Ljava/lang/String;)V

    .line 140
    :cond_2
    sget-object v16, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    const-string v17, "name=?"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v8, v18, v19

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object v2, v15

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 152
    .end local v6    # "category":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "numAttrs":I
    .end local v11    # "prefs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v13    # "tag":Ljava/lang/String;
    .end local v15    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v16

    .line 155
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->close()V

    goto/16 :goto_1

    .line 143
    .restart local v6    # "category":Ljava/lang/String;
    .restart local v7    # "i":I
    .restart local v8    # "name":Ljava/lang/String;
    .restart local v9    # "numAttrs":I
    .restart local v11    # "prefs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v13    # "tag":Ljava/lang/String;
    .restart local v15    # "values":Landroid/content/ContentValues;
    :cond_3
    :try_start_2
    sget-boolean v16, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v16, :cond_4

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "insert "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " into provider table"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->log(Ljava/lang/String;)V

    .line 146
    :cond_4
    const-string v16, "name"

    move-object v0, v15

    move-object/from16 v1, v16

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    const-string v16, "fullname"

    const-string v17, "full_name"

    move-object v0, v11

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, v15

    move-object/from16 v1, v16

    move-object v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    sget-object v16, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object v2, v15

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v12

    .line 149
    .local v12, "result":Landroid/net/Uri;
    invoke-static {v12}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v16

    move-wide/from16 v0, v16

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->mGtalkProviderId:J
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 153
    .end local v6    # "category":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "numAttrs":I
    .end local v11    # "prefs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "result":Landroid/net/Uri;
    .end local v13    # "tag":Ljava/lang/String;
    .end local v15    # "values":Landroid/content/ContentValues;
    :catch_1
    move-exception v16

    .line 155
    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->close()V

    goto/16 :goto_1

    :catchall_0
    move-exception v16

    invoke-interface {v10}, Landroid/content/res/XmlResourceParser;->close()V

    throw v16
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 168
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ServiceContext] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 172
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ServiceContext] "

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

    .line 173
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    return-object v0
.end method

.method public getGtalkProviderId()J
    .locals 2

    .prologue
    .line 101
    iget-wide v0, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->mGtalkProviderId:J

    return-wide v0
.end method

.method public getService()Lcom/google/android/gtalkservice/service/GTalkService;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    return-object v0
.end method
