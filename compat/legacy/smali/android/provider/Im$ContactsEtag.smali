.class public final Landroid/provider/Im$ContactsEtag;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/BaseColumns;
.implements Landroid/provider/Im$ContactsEtagColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ContactsEtag"
.end annotation


# static fields
.field private static COLUMN_ETAG:I = 0x0

.field private static COLUMN_OTR_ETAG:I = 0x0

.field private static final CONTACT_ETAG_PROJECTION:[Ljava/lang/String;

.field private static final CONTACT_OTR_ETAG_PROJECTION:[Ljava/lang/String;

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/gtalk-contactsEtag"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/gtalk-contactsEtag"

.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 809
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "etag"

    aput-object v1, v0, v2

    sput-object v0, Landroid/provider/Im$ContactsEtag;->CONTACT_ETAG_PROJECTION:[Ljava/lang/String;

    .line 813
    sput v2, Landroid/provider/Im$ContactsEtag;->COLUMN_ETAG:I

    .line 815
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "otr_etag"

    aput-object v1, v0, v2

    sput-object v0, Landroid/provider/Im$ContactsEtag;->CONTACT_OTR_ETAG_PROJECTION:[Ljava/lang/String;

    .line 819
    sput v2, Landroid/provider/Im$ContactsEtag;->COLUMN_OTR_ETAG:I

    .line 824
    const-string v0, "content://com.google.android.providers.talk/contactsEtag"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 756
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getOtrEtag(Landroid/content/ContentResolver;J)Ljava/lang/String;
    .registers 11
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    const/4 v4, 0x0

    .line 790
    const/4 v7, 0x0

    .line 792
    .local v7, "retVal":Ljava/lang/String;
    sget-object v1, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Landroid/provider/Im$ContactsEtag;->CONTACT_OTR_ETAG_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "account="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 799
    .local v6, "c":Landroid/database/Cursor;
    :try_start_1f
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 800
    sget v0, Landroid/provider/Im$ContactsEtag;->COLUMN_OTR_ETAG:I

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2a
    .catchall {:try_start_1f .. :try_end_2a} :catchall_2f

    move-result-object v7

    .line 803
    :cond_2b
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 806
    return-object v7

    .line 803
    :catchall_2f
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public static final getRosterEtag(Landroid/content/ContentResolver;J)Ljava/lang/String;
    .registers 11
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J

    .prologue
    const/4 v4, 0x0

    .line 770
    const/4 v7, 0x0

    .line 772
    .local v7, "retVal":Ljava/lang/String;
    sget-object v1, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Landroid/provider/Im$ContactsEtag;->CONTACT_ETAG_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "account="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 779
    .local v6, "c":Landroid/database/Cursor;
    :try_start_1f
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 780
    sget v0, Landroid/provider/Im$ContactsEtag;->COLUMN_ETAG:I

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2a
    .catchall {:try_start_1f .. :try_end_2a} :catchall_2f

    move-result-object v7

    .line 783
    :cond_2b
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 786
    return-object v7

    .line 783
    :catchall_2f
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public static final query(Landroid/content/ContentResolver;[Ljava/lang/String;)Landroid/database/Cursor;
    .registers 8
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "projection"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 760
    sget-object v1, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    move-object v0, p0

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public static final query(Landroid/content/ContentResolver;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 10
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "where"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 765
    sget-object v1, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    if-nez p3, :cond_e

    move-object v5, v4

    :goto_6
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0

    :cond_e
    move-object v5, p3

    goto :goto_6
.end method
