.class public Landroid/os/Base64Utils;
.super Ljava/lang/Object;
.source "Base64Utils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .registers 2
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {p0}, Landroid/os/Base64Utils;->decodeBase64Native(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method private static native decodeBase64Native(Ljava/lang/String;)[B
.end method
