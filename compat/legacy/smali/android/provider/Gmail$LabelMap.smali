.class public final Landroid/provider/Gmail$LabelMap;
.super Ljava/util/Observable;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LabelMap"
.end annotation


# static fields
.field private static final EMPTY_CONTENT_VALUES:Landroid/content/ContentValues;

.field private static final FORCED_INCLUDED_LABELS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final FORCED_INCLUDED_OR_PARTIAL_LABELS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final FORCED_UNSYNCED_LABELS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SORTED_USER_MEANINGFUL_SYSTEM_LABELS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final USER_MEANINGFUL_SYSTEM_LABELS_SET:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCanonicalNameToId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mLabelIdCached:J

.field private mLabelIdChat:J

.field private mLabelIdDraft:J

.field private mLabelIdIgnored:J

.field private mLabelIdInbox:J

.field private mLabelIdOutbox:J

.field private mLabelIdSent:J

.field private mLabelIdSpam:J

.field private mLabelIdStarred:J

.field private mLabelIdTrash:J

.field private mLabelIdUnread:J

.field private mLabelIdVoicemail:J

.field private mLabelIdVoicemailInbox:J

.field private mLabelsSynced:Z

.field private mQueryMap:Landroid/content/ContentQueryMap;

.field private mSortedUserLabels:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1289
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    sput-object v0, Landroid/provider/Gmail$LabelMap;->EMPTY_CONTENT_VALUES:Landroid/content/ContentValues;

    .line 1476
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "^i"

    aput-object v1, v0, v3

    const-string v1, "^t"

    aput-object v1, v0, v4

    const-string v1, "^b"

    aput-object v1, v0, v5

    const-string v1, "^f"

    aput-object v1, v0, v6

    const-string v1, "^^out"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "^r"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "^all"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "^s"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "^k"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/collect/Lists;->newArrayList([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail$LabelMap;->SORTED_USER_MEANINGFUL_SYSTEM_LABELS:Ljava/util/List;

    .line 1483
    sget-object v0, Landroid/provider/Gmail$LabelMap;->SORTED_USER_MEANINGFUL_SYSTEM_LABELS:Ljava/util/List;

    new-array v1, v3, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/collect/Sets;->newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail$LabelMap;->USER_MEANINGFUL_SYSTEM_LABELS_SET:Ljava/util/Set;

    .line 1501
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "^^out"

    aput-object v1, v0, v3

    const-string v1, "^r"

    aput-object v1, v0, v4

    invoke-static {v0}, Lcom/google/android/collect/Sets;->newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail$LabelMap;->FORCED_INCLUDED_LABELS:Ljava/util/Set;

    .line 1508
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "^i"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/google/android/collect/Sets;->newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail$LabelMap;->FORCED_INCLUDED_OR_PARTIAL_LABELS:Ljava/util/Set;

    .line 1515
    new-array v0, v7, [Ljava/lang/String;

    const-string v1, "^all"

    aput-object v1, v0, v3

    const-string v1, "^b"

    aput-object v1, v0, v4

    const-string v1, "^s"

    aput-object v1, v0, v5

    const-string v1, "^k"

    aput-object v1, v0, v6

    invoke-static {v0}, Lcom/google/android/collect/Sets;->newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail$LabelMap;->FORCED_UNSYNCED_LABELS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentResolver;Ljava/lang/String;Z)V
    .registers 11
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "account"    # Ljava/lang/String;
    .param p3, "keepUpdated"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1311
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 1309
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelsSynced:Z

    .line 1312
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1313
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "account is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1315
    :cond_15
    # getter for: Landroid/provider/Gmail;->LABELS_URI:Landroid/net/Uri;
    invoke-static {}, Landroid/provider/Gmail;->access$200()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    # getter for: Landroid/provider/Gmail;->LABEL_PROJECTION:[Ljava/lang/String;
    invoke-static {}, Landroid/provider/Gmail;->access$300()[Ljava/lang/String;

    move-result-object v2

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1317
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-direct {p0, v6, p3}, Landroid/provider/Gmail$LabelMap;->init(Landroid/database/Cursor;Z)V

    .line 1318
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;Z)V
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "keepUpdated"    # Z

    .prologue
    .line 1320
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 1309
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelsSynced:Z

    .line 1321
    invoke-direct {p0, p1, p2}, Landroid/provider/Gmail$LabelMap;->init(Landroid/database/Cursor;Z)V

    .line 1322
    return-void
.end method

.method static synthetic access$400(Landroid/provider/Gmail$LabelMap;)V
    .registers 1
    .param p0, "x0"    # Landroid/provider/Gmail$LabelMap;

    .prologue
    .line 1288
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->updateDataStructures()V

    return-void
.end method

.method static synthetic access$500(Landroid/provider/Gmail$LabelMap;)V
    .registers 1
    .param p0, "x0"    # Landroid/provider/Gmail$LabelMap;

    .prologue
    .line 1288
    invoke-virtual {p0}, Landroid/provider/Gmail$LabelMap;->setChanged()V

    return-void
.end method

.method private checkLabelsSynced()V
    .registers 3

    .prologue
    .line 1466
    invoke-virtual {p0}, Landroid/provider/Gmail$LabelMap;->labelsSynced()Z

    move-result v0

    if-nez v0, :cond_e

    .line 1467
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "LabelMap not initalized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1469
    :cond_e
    return-void
.end method

.method public static getForcedIncludedLabels()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1505
    sget-object v0, Landroid/provider/Gmail$LabelMap;->FORCED_INCLUDED_LABELS:Ljava/util/Set;

    return-object v0
.end method

.method public static getForcedIncludedOrPartialLabels()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1512
    sget-object v0, Landroid/provider/Gmail$LabelMap;->FORCED_INCLUDED_OR_PARTIAL_LABELS:Ljava/util/Set;

    return-object v0
.end method

.method public static getForcedUnsyncedLabels()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1519
    sget-object v0, Landroid/provider/Gmail$LabelMap;->FORCED_UNSYNCED_LABELS:Ljava/util/Set;

    return-object v0
.end method

.method private getLabelIdValues(J)Landroid/content/ContentValues;
    .registers 6
    .param p1, "labelId"    # J

    .prologue
    .line 1593
    iget-object v1, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ContentQueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v0

    .line 1594
    .local v0, "values":Landroid/content/ContentValues;
    if-eqz v0, :cond_e

    move-object v1, v0

    .line 1597
    :goto_d
    return-object v1

    :cond_e
    sget-object v1, Landroid/provider/Gmail$LabelMap;->EMPTY_CONTENT_VALUES:Landroid/content/ContentValues;

    goto :goto_d
.end method

.method public static getSortedUserMeaningfulSystemLabels()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1489
    sget-object v0, Landroid/provider/Gmail$LabelMap;->SORTED_USER_MEANINGFUL_SYSTEM_LABELS:Ljava/util/List;

    return-object v0
.end method

.method public static getUserMeaningfulSystemLabelsSet()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1493
    sget-object v0, Landroid/provider/Gmail$LabelMap;->USER_MEANINGFUL_SYSTEM_LABELS_SET:Ljava/util/Set;

    return-object v0
.end method

.method private init(Landroid/database/Cursor;Z)V
    .registers 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "keepUpdated"    # Z

    .prologue
    .line 1325
    new-instance v0, Landroid/content/ContentQueryMap;

    const-string v1, "_id"

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, p2, v2}, Landroid/content/ContentQueryMap;-><init>(Landroid/database/Cursor;Ljava/lang/String;ZLandroid/os/Handler;)V

    iput-object v0, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    .line 1326
    new-instance v0, Ljava/util/TreeSet;

    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Landroid/provider/Gmail$LabelMap;->mSortedUserLabels:Ljava/util/SortedSet;

    .line 1327
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Landroid/provider/Gmail$LabelMap;->mCanonicalNameToId:Ljava/util/Map;

    .line 1328
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->updateDataStructures()V

    .line 1329
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    new-instance v1, Landroid/provider/Gmail$LabelMap$1;

    invoke-direct {v1, p0}, Landroid/provider/Gmail$LabelMap$1;-><init>(Landroid/provider/Gmail$LabelMap;)V

    invoke-virtual {v0, v1}, Landroid/content/ContentQueryMap;->addObserver(Ljava/util/Observer;)V

    .line 1336
    return-void
.end method

.method private updateDataStructures()V
    .registers 10

    .prologue
    const-wide/16 v7, 0x0

    .line 1350
    iget-object v5, p0, Landroid/provider/Gmail$LabelMap;->mSortedUserLabels:Ljava/util/SortedSet;

    invoke-interface {v5}, Ljava/util/SortedSet;->clear()V

    .line 1351
    iget-object v5, p0, Landroid/provider/Gmail$LabelMap;->mCanonicalNameToId:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    .line 1352
    iget-object v5, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    invoke-virtual {v5}, Landroid/content/ContentQueryMap;->getRows()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_12d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 1353
    .local v4, "row":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ContentValues;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 1354
    .local v2, "labelId":J
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/ContentValues;

    const-string v6, "canonicalName"

    invoke-virtual {v5, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1355
    .local v0, "canonicalName":Ljava/lang/String;
    invoke-static {v0}, Landroid/provider/Gmail;->isLabelUserDefined(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4b

    .line 1356
    iget-object v5, p0, Landroid/provider/Gmail$LabelMap;->mSortedUserLabels:Ljava/util/SortedSet;

    invoke-interface {v5, v0}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 1358
    :cond_4b
    iget-object v5, p0, Landroid/provider/Gmail$LabelMap;->mCanonicalNameToId:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1360
    const-string v5, "^f"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9f

    .line 1361
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdSent:J

    .line 1387
    :cond_5e
    :goto_5e
    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdSent:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdInbox:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdDraft:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdUnread:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdTrash:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdSpam:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdStarred:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdChat:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdIgnored:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    iget-wide v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdVoicemail:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_12a

    const/4 v5, 0x1

    :goto_9b
    iput-boolean v5, p0, Landroid/provider/Gmail$LabelMap;->mLabelsSynced:Z

    goto/16 :goto_1a

    .line 1362
    :cond_9f
    const-string v5, "^i"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_aa

    .line 1363
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdInbox:J

    goto :goto_5e

    .line 1364
    :cond_aa
    const-string v5, "^r"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b5

    .line 1365
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdDraft:J

    goto :goto_5e

    .line 1366
    :cond_b5
    const-string v5, "^u"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c0

    .line 1367
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdUnread:J

    goto :goto_5e

    .line 1368
    :cond_c0
    const-string v5, "^k"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_cb

    .line 1369
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdTrash:J

    goto :goto_5e

    .line 1370
    :cond_cb
    const-string v5, "^s"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d6

    .line 1371
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdSpam:J

    goto :goto_5e

    .line 1372
    :cond_d6
    const-string v5, "^t"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e2

    .line 1373
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdStarred:J

    goto/16 :goto_5e

    .line 1374
    :cond_e2
    const-string v5, "^b"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_ee

    .line 1375
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdChat:J

    goto/16 :goto_5e

    .line 1376
    :cond_ee
    const-string v5, "^g"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_fa

    .line 1377
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdIgnored:J

    goto/16 :goto_5e

    .line 1378
    :cond_fa
    const-string v5, "^vm"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_106

    .line 1379
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdVoicemail:J

    goto/16 :goto_5e

    .line 1380
    :cond_106
    const-string v5, "^^vmi"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_112

    .line 1381
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdVoicemailInbox:J

    goto/16 :goto_5e

    .line 1382
    :cond_112
    const-string v5, "^^cached"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11e

    .line 1383
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdCached:J

    goto/16 :goto_5e

    .line 1384
    :cond_11e
    const-string v5, "^^out"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 1385
    iput-wide v2, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdOutbox:J

    goto/16 :goto_5e

    .line 1387
    :cond_12a
    const/4 v5, 0x0

    goto/16 :goto_9b

    .line 1398
    .end local v0    # "canonicalName":Ljava/lang/String;
    .end local v2    # "labelId":J
    .end local v4    # "row":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ContentValues;>;"
    :cond_12d
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 1607
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    invoke-virtual {v0}, Landroid/content/ContentQueryMap;->close()V

    .line 1608
    return-void
.end method

.method public getCanonicalName(J)Ljava/lang/String;
    .registers 5
    .param p1, "labelId"    # J

    .prologue
    .line 1563
    invoke-direct {p0, p1, p2}, Landroid/provider/Gmail$LabelMap;->getLabelIdValues(J)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "canonicalName"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLabelId(Ljava/lang/String;)J
    .registers 5
    .param p1, "canonicalName"    # Ljava/lang/String;

    .prologue
    .line 1585
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mCanonicalNameToId:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1586
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mCanonicalNameToId:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Landroid/provider/Gmail$LabelMap;
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 1588
    .restart local p0    # "this":Landroid/provider/Gmail$LabelMap;
    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown canonical name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLabelIdCached()J
    .registers 3

    .prologue
    .line 1456
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1457
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdCached:J

    return-wide v0
.end method

.method public getLabelIdChat()J
    .registers 3

    .prologue
    .line 1436
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1437
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdChat:J

    return-wide v0
.end method

.method public getLabelIdDraft()J
    .registers 3

    .prologue
    .line 1411
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1412
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdDraft:J

    return-wide v0
.end method

.method public getLabelIdIgnored()J
    .registers 3

    .prologue
    .line 1441
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1442
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdIgnored:J

    return-wide v0
.end method

.method public getLabelIdInbox()J
    .registers 3

    .prologue
    .line 1406
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1407
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdInbox:J

    return-wide v0
.end method

.method public getLabelIdOutbox()J
    .registers 3

    .prologue
    .line 1461
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1462
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdOutbox:J

    return-wide v0
.end method

.method public getLabelIdSent()J
    .registers 3

    .prologue
    .line 1401
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1402
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdSent:J

    return-wide v0
.end method

.method public getLabelIdSpam()J
    .registers 3

    .prologue
    .line 1426
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1427
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdSpam:J

    return-wide v0
.end method

.method public getLabelIdStarred()J
    .registers 3

    .prologue
    .line 1431
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1432
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdStarred:J

    return-wide v0
.end method

.method public getLabelIdTrash()J
    .registers 3

    .prologue
    .line 1421
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1422
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdTrash:J

    return-wide v0
.end method

.method public getLabelIdUnread()J
    .registers 3

    .prologue
    .line 1416
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1417
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdUnread:J

    return-wide v0
.end method

.method public getLabelIdVoicemail()J
    .registers 3

    .prologue
    .line 1446
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1447
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdVoicemail:J

    return-wide v0
.end method

.method public getLabelIdVoicemailInbox()J
    .registers 3

    .prologue
    .line 1451
    invoke-direct {p0}, Landroid/provider/Gmail$LabelMap;->checkLabelsSynced()V

    .line 1452
    iget-wide v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelIdVoicemailInbox:J

    return-wide v0
.end method

.method public getName(J)Ljava/lang/String;
    .registers 5
    .param p1, "labelId"    # J

    .prologue
    .line 1570
    invoke-direct {p0, p1, p2}, Landroid/provider/Gmail$LabelMap;->getLabelIdValues(J)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNumConversations(J)I
    .registers 5
    .param p1, "labelId"    # J

    .prologue
    .line 1533
    invoke-direct {p0, p1, p2}, Landroid/provider/Gmail$LabelMap;->getLabelIdValues(J)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "numConversations"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getNumConversations(Ljava/lang/String;)I
    .registers 4
    .param p1, "label"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1528
    invoke-virtual {p0, p1}, Landroid/provider/Gmail$LabelMap;->getLabelId(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/provider/Gmail$LabelMap;->getNumConversations(J)I

    move-result v0

    return v0
.end method

.method public getNumUnreadConversations(J)I
    .registers 7
    .param p1, "labelId"    # J

    .prologue
    .line 1547
    invoke-direct {p0, p1, p2}, Landroid/provider/Gmail$LabelMap;->getLabelIdValues(J)Landroid/content/ContentValues;

    move-result-object v2

    const-string v3, "numUnreadConversations"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    .line 1551
    .local v1, "unreadConversations":Ljava/lang/Integer;
    const/4 v0, 0x0

    .line 1552
    .local v0, "result":I
    if-eqz v1, :cond_15

    .line 1553
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-gez v2, :cond_16

    const/4 v2, 0x0

    move v0, v2

    .line 1556
    :cond_15
    :goto_15
    return v0

    .line 1553
    :cond_16
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move v0, v2

    goto :goto_15
.end method

.method public getNumUnreadConversations(Ljava/lang/String;)I
    .registers 4
    .param p1, "label"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1542
    invoke-virtual {p0, p1}, Landroid/provider/Gmail$LabelMap;->getLabelId(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Landroid/provider/Gmail$LabelMap;->getNumUnreadConversations(J)I

    move-result v0

    return v0
.end method

.method public getSortedUserLabels()Ljava/util/SortedSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1473
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mSortedUserLabels:Ljava/util/SortedSet;

    return-object v0
.end method

.method public hasLabel(J)Z
    .registers 5
    .param p1, "labelId"    # J

    .prologue
    .line 1577
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    invoke-virtual {v0}, Landroid/content/ContentQueryMap;->getRows()Ljava/util/Map;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public labelsSynced()Z
    .registers 2

    .prologue
    .line 1342
    iget-boolean v0, p0, Landroid/provider/Gmail$LabelMap;->mLabelsSynced:Z

    return v0
.end method

.method public requery()V
    .registers 2

    .prologue
    .line 1603
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap;->mQueryMap:Landroid/content/ContentQueryMap;

    invoke-virtual {v0}, Landroid/content/ContentQueryMap;->requery()V

    .line 1604
    return-void
.end method
