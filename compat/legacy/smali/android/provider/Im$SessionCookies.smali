.class public Landroid/provider/Im$SessionCookies;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/Im$SessionCookiesColumns;
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SessionCookies"
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android-dir/gtalk-sessionCookies"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final CONTENT_URI_SESSION_COOKIES_BY:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1551
    const-string v0, "content://com.google.android.providers.talk/sessionCookies"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$SessionCookies;->CONTENT_URI:Landroid/net/Uri;

    .line 1557
    const-string v0, "content://com.google.android.providers.talk/sessionCookiesBy"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$SessionCookies;->CONTENT_URI_SESSION_COOKIES_BY:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1545
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1546
    return-void
.end method
