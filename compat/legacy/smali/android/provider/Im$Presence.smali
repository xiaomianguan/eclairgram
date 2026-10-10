.class public final Landroid/provider/Im$Presence;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/BaseColumns;
.implements Landroid/provider/Im$PresenceColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Presence"
.end annotation


# static fields
.field public static final BULK_CONTENT_URI:Landroid/net/Uri;

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/gtalk-presence"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "mode DESC"

.field public static final SEED_PRESENCE_BY_ACCOUNT_CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1410
    const-string v0, "content://com.google.android.providers.talk/presence"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;

    .line 1416
    const-string v0, "content://com.google.android.providers.talk/presence/account"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Presence;->CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    .line 1422
    const-string v0, "content://com.google.android.providers.talk/bulk_presence"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Presence;->BULK_CONTENT_URI:Landroid/net/Uri;

    .line 1428
    const-string v0, "content://com.google.android.providers.talk/seed_presence/account"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Presence;->SEED_PRESENCE_BY_ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1406
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
