.class public final Landroid/provider/Im$Invitation;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/Im$InvitationColumns;
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Invitation"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/gtalk-invitations"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/gtalk-invitations"

.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1257
    const-string v0, "content://com.google.android.providers.talk/invitations"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Invitation;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1252
    return-void
.end method
