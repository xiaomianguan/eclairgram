.class public Landroid/provider/Gmail$MailCursor;
.super Landroid/database/ContentObserver;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MailCursor"
.end annotation


# instance fields
.field protected mAccount:Ljava/lang/String;

.field protected mCursor:Landroid/database/Cursor;

.field private mObservers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Landroid/provider/Gmail$MailCursorObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdateValues:Landroid/content/ContentValues;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Landroid/database/Cursor;)V
    .registers 4
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1036
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 1037
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroid/provider/Gmail$MailCursor;->mObservers:Ljava/util/Set;

    .line 1038
    iput-object p2, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    .line 1039
    iput-object p1, p0, Landroid/provider/Gmail$MailCursor;->mAccount:Ljava/lang/String;

    .line 1040
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p0}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 1041
    :cond_1c
    return-void
.end method


# virtual methods
.method protected checkCursor()V
    .registers 3

    .prologue
    .line 1209
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_c

    .line 1210
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cannot read from an insertion cursor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1213
    :cond_c
    return-void
.end method

.method protected checkThread()V
    .registers 1

    .prologue
    .line 1058
    return-void
.end method

.method public final count()I
    .registers 2

    .prologue
    .line 1093
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_b

    .line 1094
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 1096
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public final deliverSelfNotifications()Z
    .registers 2

    .prologue
    .line 1195
    const/4 v0, 0x0

    return v0
.end method

.method public getAccount()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1048
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mAccount:Ljava/lang/String;

    return-object v0
.end method

.method public getCursor()Landroid/database/Cursor;
    .registers 2

    .prologue
    .line 1026
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method protected getStringInColumn(I)Ljava/lang/String;
    .registers 3
    .param p1, "columnIndex"    # I

    .prologue
    .line 1219
    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->checkCursor()V

    .line 1220
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    # invokes: Landroid/provider/Gmail;->toNonnullString(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0}, Landroid/provider/Gmail;->access$100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getUpdateValues()Landroid/content/ContentValues;
    .registers 2

    .prologue
    .line 1068
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mUpdateValues:Landroid/content/ContentValues;

    if-nez v0, :cond_b

    .line 1069
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iput-object v0, p0, Landroid/provider/Gmail$MailCursor;->mUpdateValues:Landroid/content/ContentValues;

    .line 1071
    :cond_b
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mUpdateValues:Landroid/content/ContentValues;

    return-object v0
.end method

.method public final moveTo(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1123
    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->checkCursor()V

    .line 1124
    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->checkThread()V

    .line 1125
    iget-object v1, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    .line 1126
    .local v0, "moved":Z
    if-eqz v0, :cond_11

    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->onCursorPositionChanged()V

    .line 1127
    :cond_11
    return v0
.end method

.method public final next()Z
    .registers 3

    .prologue
    .line 1139
    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->checkCursor()V

    .line 1140
    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->checkThread()V

    .line 1141
    iget-object v1, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    .line 1142
    .local v0, "moved":Z
    if-eqz v0, :cond_11

    invoke-virtual {p0}, Landroid/provider/Gmail$MailCursor;->onCursorPositionChanged()V

    .line 1143
    :cond_11
    return v0
.end method

.method public onChange(Z)V
    .registers 5
    .param p1, "selfChange"    # Z

    .prologue
    .line 1203
    iget-object v2, p0, Landroid/provider/Gmail$MailCursor;->mObservers:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/provider/Gmail$MailCursorObserver;

    .line 1204
    .local v1, "o":Landroid/provider/Gmail$MailCursorObserver;
    invoke-interface {v1, p0}, Landroid/provider/Gmail$MailCursorObserver;->onCursorChanged(Landroid/provider/Gmail$MailCursor;)V

    goto :goto_6

    .line 1206
    .end local v1    # "o":Landroid/provider/Gmail$MailCursorObserver;
    :cond_16
    return-void
.end method

.method protected onCursorPositionChanged()V
    .registers 2

    .prologue
    .line 1082
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/provider/Gmail$MailCursor;->mUpdateValues:Landroid/content/ContentValues;

    .line 1083
    return-void
.end method

.method public final position()I
    .registers 2

    .prologue
    .line 1105
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_b

    .line 1106
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    .line 1108
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public final registerContentObserver(Landroid/database/ContentObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/ContentObserver;

    .prologue
    .line 1158
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 1159
    return-void
.end method

.method public final registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 1166
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 1167
    return-void
.end method

.method public final registerObserver(Landroid/provider/Gmail$MailCursorObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/provider/Gmail$MailCursorObserver;

    .prologue
    .line 1179
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mObservers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1180
    return-void
.end method

.method public final release()V
    .registers 2

    .prologue
    .line 1151
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_e

    .line 1152
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p0}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1153
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 1155
    :cond_e
    return-void
.end method

.method public final unregisterContentObserver(Landroid/database/ContentObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/ContentObserver;

    .prologue
    .line 1162
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1163
    return-void
.end method

.method public final unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 1170
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 1171
    return-void
.end method

.method public final unregisterObserver(Landroid/provider/Gmail$MailCursorObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/provider/Gmail$MailCursorObserver;

    .prologue
    .line 1188
    iget-object v0, p0, Landroid/provider/Gmail$MailCursor;->mObservers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1189
    return-void
.end method
