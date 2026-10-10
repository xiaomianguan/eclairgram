.class Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;
.super Ljava/lang/Object;
.source "OtrManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/OtrManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OtrQueryListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/OtrManager;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/OtrManager;)V
    .locals 0

    .prologue
    .line 130
    iput-object p1, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/OtrManager;Lcom/google/android/gtalkservice/OtrManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/OtrManager;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/OtrManager$1;

    .prologue
    .line 130
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;-><init>(Lcom/google/android/gtalkservice/OtrManager;)V

    return-void
.end method

.method private processOtrQueryResult(Lcom/google/android/gtalkservice/extensions/OtrQuery;)V
    .locals 15
    .param p1, "otrQuery"    # Lcom/google/android/gtalkservice/extensions/OtrQuery;

    .prologue
    .line 157
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->getDefaultValue()Lcom/google/android/gtalkservice/extensions/OtrQuery$DefaultValue;

    move-result-object v0

    .line 160
    .local v0, "def":Lcom/google/android/gtalkservice/extensions/OtrQuery$DefaultValue;
    sget-object v12, Lcom/google/android/gtalkservice/OtrManager$3;->$SwitchMap$com$google$android$gtalkservice$extensions$OtrQuery$DefaultValue:[I

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/extensions/OtrQuery$DefaultValue;->ordinal()I

    move-result v13

    aget v12, v12, v13

    packed-switch v12, :pswitch_data_0

    .line 166
    const/4 v1, 0x0

    .line 170
    .local v1, "defaultValue":Z
    :goto_0
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "processOtrQueryResult: defaultValue="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/google/android/gtalkservice/OtrManager;->access$200(Lcom/google/android/gtalkservice/OtrManager;Ljava/lang/String;)V

    .line 172
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->getItems()Ljava/util/ArrayList;

    move-result-object v7

    .line 173
    .local v7, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;>;"
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .local v9, "selection1":Ljava/lang/StringBuilder;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .local v10, "selection2":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 177
    .local v3, "i":I
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;

    .line 178
    .local v6, "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    invoke-virtual {v6}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->isEnabled()Z

    move-result v2

    .line 180
    .local v2, "enabled":Z
    if-eq v2, v1, :cond_0

    .line 181
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .local v4, "i":I
    if-lez v3, :cond_1

    .line 182
    const-string v12, " OR "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const-string v12, " AND "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    :cond_1
    const-string v12, "username"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "=?"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    const-string v12, "username"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "!=?"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_1

    .line 162
    .end local v1    # "defaultValue":Z
    .end local v2    # "enabled":Z
    .end local v3    # "i":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    .end local v7    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;>;"
    .end local v9    # "selection1":Ljava/lang/StringBuilder;
    .end local v10    # "selection2":Ljava/lang/StringBuilder;
    :pswitch_0
    const/4 v1, 0x1

    .line 163
    .restart local v1    # "defaultValue":Z
    goto :goto_0

    .line 192
    .restart local v3    # "i":I
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v7    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;>;"
    .restart local v9    # "selection1":Ljava/lang/StringBuilder;
    .restart local v10    # "selection2":Ljava/lang/StringBuilder;
    :cond_2
    new-array v11, v3, [Ljava/lang/String;

    .line 195
    .local v11, "selectionArgs":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 197
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;

    .line 198
    .restart local v6    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    invoke-virtual {v6}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->getJid()Ljava/lang/String;

    move-result-object v8

    .line 199
    .local v8, "jid":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->isEnabled()Z

    move-result v2

    .line 201
    .restart local v2    # "enabled":Z
    if-eq v2, v1, :cond_3

    .line 202
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .restart local v4    # "i":I
    aput-object v8, v11, v3

    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_2

    .line 206
    .end local v2    # "enabled":Z
    .end local v6    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    .end local v8    # "jid":Ljava/lang/String;
    :cond_4
    if-lez v3, :cond_5

    .line 207
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v12}, Lcom/google/android/gtalkservice/OtrManager;->access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;

    move-result-object v12

    if-eqz v1, :cond_6

    const/4 v13, 0x0

    :goto_3
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14, v11}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V

    .line 212
    :cond_5
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v12}, Lcom/google/android/gtalkservice/OtrManager;->access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;

    move-result-object v12

    if-eqz v1, :cond_7

    const/4 v13, 0x1

    :goto_4
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14, v11}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V

    .line 215
    return-void

    .line 207
    :cond_6
    const/4 v13, 0x1

    goto :goto_3

    .line 212
    :cond_7
    const/4 v13, 0x0

    goto :goto_4

    .line 160
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private processOtrQuerySet(Lcom/google/android/gtalkservice/extensions/OtrQuery;)V
    .locals 15
    .param p1, "otrQuery"    # Lcom/google/android/gtalkservice/extensions/OtrQuery;

    .prologue
    .line 218
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    const-string v13, "processOtrQuerySet"

    invoke-static {v12, v13}, Lcom/google/android/gtalkservice/OtrManager;->access$200(Lcom/google/android/gtalkservice/OtrManager;Ljava/lang/String;)V

    .line 220
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->getItems()Ljava/util/ArrayList;

    move-result-object v5

    .line 221
    .local v5, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;>;"
    const/4 v12, 0x3

    new-array v7, v12, [Ljava/lang/StringBuilder;

    .line 222
    .local v7, "selection":[Ljava/lang/StringBuilder;
    const/4 v12, 0x3

    new-array v11, v12, [I

    .line 224
    .local v11, "selectionArgsCount":[I
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;

    .line 225
    .local v4, "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->getJid()Ljava/lang/String;

    move-result-object v6

    .line 226
    .local v6, "jid":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->isEnabled()Z

    move-result v1

    .line 227
    .local v1, "enabled":Z
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->getChangedByBuddy()Z

    move-result v0

    .line 230
    .local v0, "changedByBuddy":Z
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "  jid="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", enabled="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", chgByBud="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/google/android/gtalkservice/OtrManager;->access$200(Lcom/google/android/gtalkservice/OtrManager;Ljava/lang/String;)V

    .line 235
    if-eqz v1, :cond_3

    .line 236
    if-eqz v0, :cond_2

    const/4 v12, 0x2

    move v3, v12

    .line 241
    .local v3, "index":I
    :goto_1
    aget-object v12, v7, v3

    if-nez v12, :cond_0

    .line 242
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    aput-object v12, v7, v3

    .line 245
    :cond_0
    aget v12, v11, v3

    add-int/lit8 v13, v12, 0x1

    aput v13, v11, v3

    if-lez v12, :cond_1

    .line 246
    aget-object v12, v7, v3

    const-string v13, " OR "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    :cond_1
    aget-object v12, v7, v3

    const-string v13, "username"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "=?"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 236
    .end local v3    # "index":I
    :cond_2
    const/4 v12, 0x1

    move v3, v12

    goto :goto_1

    .line 238
    :cond_3
    const/4 v3, 0x0

    .restart local v3    # "index":I
    goto :goto_1

    .line 251
    .end local v0    # "changedByBuddy":Z
    .end local v1    # "enabled":Z
    .end local v3    # "index":I
    .end local v4    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    .end local v6    # "jid":Ljava/lang/String;
    :cond_4
    const/4 v8, 0x0

    .line 252
    .local v8, "selectionArgs0":[Ljava/lang/String;
    const/4 v9, 0x0

    .line 253
    .local v9, "selectionArgs1":[Ljava/lang/String;
    const/4 v10, 0x0

    .line 255
    .local v10, "selectionArgs2":[Ljava/lang/String;
    const/4 v12, 0x0

    aget v12, v11, v12

    if-lez v12, :cond_5

    .line 256
    const/4 v12, 0x0

    aget v12, v11, v12

    new-array v8, v12, [Ljava/lang/String;

    .line 259
    :cond_5
    const/4 v12, 0x1

    aget v12, v11, v12

    if-lez v12, :cond_6

    .line 260
    const/4 v12, 0x1

    aget v12, v11, v12

    new-array v9, v12, [Ljava/lang/String;

    .line 263
    :cond_6
    const/4 v12, 0x2

    aget v12, v11, v12

    if-lez v12, :cond_7

    .line 264
    const/4 v12, 0x2

    aget v12, v11, v12

    new-array v10, v12, [Ljava/lang/String;

    .line 267
    :cond_7
    const/4 v12, 0x0

    const/4 v13, 0x0

    aput v13, v11, v12

    .line 268
    const/4 v12, 0x1

    const/4 v13, 0x0

    aput v13, v11, v12

    .line 269
    const/4 v12, 0x2

    const/4 v13, 0x0

    aput v13, v11, v12

    .line 271
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;

    .line 272
    .restart local v4    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->getJid()Ljava/lang/String;

    move-result-object v6

    .line 273
    .restart local v6    # "jid":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->isEnabled()Z

    move-result v1

    .line 275
    .restart local v1    # "enabled":Z
    if-eqz v1, :cond_9

    .line 276
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;->getChangedByBuddy()Z

    move-result v0

    .line 277
    .restart local v0    # "changedByBuddy":Z
    if-eqz v0, :cond_8

    .line 278
    const/4 v12, 0x2

    aget v13, v11, v12

    add-int/lit8 v14, v13, 0x1

    aput v14, v11, v12

    aput-object v6, v10, v13

    goto :goto_2

    .line 280
    :cond_8
    const/4 v12, 0x1

    aget v13, v11, v12

    add-int/lit8 v14, v13, 0x1

    aput v14, v11, v12

    aput-object v6, v9, v13

    goto :goto_2

    .line 283
    .end local v0    # "changedByBuddy":Z
    :cond_9
    const/4 v12, 0x0

    aget v13, v11, v12

    add-int/lit8 v14, v13, 0x1

    aput v14, v11, v12

    aput-object v6, v8, v13

    goto :goto_2

    .line 287
    .end local v1    # "enabled":Z
    .end local v4    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    .end local v6    # "jid":Ljava/lang/String;
    :cond_a
    const/4 v12, 0x0

    aget v12, v11, v12

    if-lez v12, :cond_b

    .line 288
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v12}, Lcom/google/android/gtalkservice/OtrManager;->access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    aget-object v14, v7, v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14, v8}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V

    .line 292
    :cond_b
    const/4 v12, 0x1

    aget v12, v11, v12

    if-lez v12, :cond_c

    .line 293
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v12}, Lcom/google/android/gtalkservice/OtrManager;->access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;

    move-result-object v12

    const/4 v13, 0x2

    const/4 v14, 0x1

    aget-object v14, v7, v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14, v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V

    .line 297
    :cond_c
    const/4 v12, 0x2

    aget v12, v11, v12

    if-lez v12, :cond_d

    .line 298
    iget-object v12, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v12}, Lcom/google/android/gtalkservice/OtrManager;->access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;

    move-result-object v12

    const/4 v13, 0x3

    const/4 v14, 0x2

    aget-object v14, v7, v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v13, v14, v10}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V

    .line 301
    :cond_d
    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 12
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 133
    move-object v0, p1

    check-cast v0, Lcom/google/android/gtalkservice/extensions/OtrQuery;

    move-object v7, v0

    .line 134
    .local v7, "otrQuery":Lcom/google/android/gtalkservice/extensions/OtrQuery;
    iget-object v8, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v8}, Lcom/google/android/gtalkservice/OtrManager;->access$100(Lcom/google/android/gtalkservice/OtrManager;)Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v1

    .line 136
    .local v1, "accountId":J
    invoke-virtual {v7}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->getEtag()Ljava/lang/String;

    move-result-object v3

    .line 137
    .local v3, "etag":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->getNotModified()Ljava/lang/Boolean;

    move-result-object v6

    .line 138
    .local v6, "notModifiedBoolean":Ljava/lang/Boolean;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_0

    move v5, v11

    .line 141
    .local v5, "notModified":Z
    :goto_0
    if-eqz v5, :cond_1

    .line 142
    iget-object v8, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    const-string v9, "OTR not modified"

    invoke-static {v8, v9}, Lcom/google/android/gtalkservice/OtrManager;->access$200(Lcom/google/android/gtalkservice/OtrManager;Ljava/lang/String;)V

    .line 154
    :goto_1
    return-void

    .end local v5    # "notModified":Z
    :cond_0
    move v5, v10

    .line 138
    goto :goto_0

    .line 146
    .restart local v5    # "notModified":Z
    :cond_1
    invoke-virtual {v7}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v8, v9, :cond_2

    move v4, v11

    .line 147
    .local v4, "isResult":Z
    :goto_2
    if-eqz v4, :cond_3

    .line 148
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->processOtrQueryResult(Lcom/google/android/gtalkservice/extensions/OtrQuery;)V

    .line 153
    :goto_3
    iget-object v8, p0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->this$0:Lcom/google/android/gtalkservice/OtrManager;

    invoke-static {v8}, Lcom/google/android/gtalkservice/OtrManager;->access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;

    move-result-object v8

    invoke-static {v8, v1, v2, v3}, Lcom/google/android/gtalkservice/DatabaseHelper;->setOtrEtag(Landroid/content/ContentResolver;JLjava/lang/String;)V

    goto :goto_1

    .end local v4    # "isResult":Z
    :cond_2
    move v4, v10

    .line 146
    goto :goto_2

    .line 150
    .restart local v4    # "isResult":Z
    :cond_3
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;->processOtrQuerySet(Lcom/google/android/gtalkservice/extensions/OtrQuery;)V

    goto :goto_3
.end method
