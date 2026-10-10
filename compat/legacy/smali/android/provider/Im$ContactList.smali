.class public final Landroid/provider/Im$ContactList;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/BaseColumns;
.implements Landroid/provider/Im$ContactListColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ContactList"
.end annotation


# static fields
.field public static final ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/gtalk-contactLists"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/gtalk-contactLists"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "name COLLATE UNICODE ASC"

.field public static final PROVIDER_NAME:Ljava/lang/String; = "provider_name"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 636
    const-string v0, "content://com.google.android.providers.talk/contactLists"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$ContactList;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 631
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
