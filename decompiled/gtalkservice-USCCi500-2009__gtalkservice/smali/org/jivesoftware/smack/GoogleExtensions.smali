.class public Lorg/jivesoftware/smack/GoogleExtensions;
.super Ljava/lang/Object;
.source "GoogleExtensions.java"


# static fields
.field public static final ANDROID_CAPABILITY_EXT_MUC:Ljava/lang/String; = "pmuc-v1"

.field public static final ANDROID_CAPABILITY_NODE_DEFAULT:Ljava/lang/String; = "http://www.android.com/gtalk/client/caps"

.field public static final ANDROID_CAPABILITY_NODE_NO_MOBILE_INDICATOR:Ljava/lang/String; = "http://www.android.com/gtalk/client/caps2"

.field public static final ANDROID_CAPABILITY_VERSION:Ljava/lang/String; = "1.1"

.field public static final EXTENDED_CONTACT_ATTR_FEATURE:Ljava/lang/String; = "google:roster"

.field public static final ROSTER_NAMESPACE:Ljava/lang/String; = "google:roster"

.field private static supportsExtendedContactAttr:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x1

    sput-boolean v0, Lorg/jivesoftware/smack/GoogleExtensions;->supportsExtendedContactAttr:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSupportExtendedContactAttribute()Z
    .locals 1

    .prologue
    .line 41
    sget-boolean v0, Lorg/jivesoftware/smack/GoogleExtensions;->supportsExtendedContactAttr:Z

    return v0
.end method

.method public static setSupportExtendedContactAttribute(Z)V
    .locals 0
    .param p0, "flag"    # Z

    .prologue
    .line 36
    sput-boolean p0, Lorg/jivesoftware/smack/GoogleExtensions;->supportsExtendedContactAttr:Z

    .line 37
    return-void
.end method
