.class public final Landroid/provider/Im$BrandingResourceMapCache;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/BaseColumns;
.implements Landroid/provider/Im$BrandingResourceMapCacheColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BrandingResourceMapCache"
.end annotation


# static fields
.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2185
    const-string v0, "content://com.google.android.providers.talk/brandingResMapCache"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$BrandingResourceMapCache;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
