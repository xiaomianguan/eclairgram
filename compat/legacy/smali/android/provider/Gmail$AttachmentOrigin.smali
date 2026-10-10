.class public final enum Landroid/provider/Gmail$AttachmentOrigin;
.super Ljava/lang/Enum;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AttachmentOrigin"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/provider/Gmail$AttachmentOrigin;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/provider/Gmail$AttachmentOrigin;

.field public static final enum LOCAL_FILE:Landroid/provider/Gmail$AttachmentOrigin;

.field public static final enum SERVER_ATTACHMENT:Landroid/provider/Gmail$AttachmentOrigin;

.field private static final SERVER_EXTRAS_SEPARATOR:Ljava/lang/String; = "_"


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1689
    new-instance v0, Landroid/provider/Gmail$AttachmentOrigin;

    const-string v1, "SERVER_ATTACHMENT"

    invoke-direct {v0, v1, v2}, Landroid/provider/Gmail$AttachmentOrigin;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/provider/Gmail$AttachmentOrigin;->SERVER_ATTACHMENT:Landroid/provider/Gmail$AttachmentOrigin;

    .line 1691
    new-instance v0, Landroid/provider/Gmail$AttachmentOrigin;

    const-string v1, "LOCAL_FILE"

    invoke-direct {v0, v1, v3}, Landroid/provider/Gmail$AttachmentOrigin;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/provider/Gmail$AttachmentOrigin;->LOCAL_FILE:Landroid/provider/Gmail$AttachmentOrigin;

    .line 1687
    const/4 v0, 0x2

    new-array v0, v0, [Landroid/provider/Gmail$AttachmentOrigin;

    sget-object v1, Landroid/provider/Gmail$AttachmentOrigin;->SERVER_ATTACHMENT:Landroid/provider/Gmail$AttachmentOrigin;

    aput-object v1, v0, v2

    sget-object v1, Landroid/provider/Gmail$AttachmentOrigin;->LOCAL_FILE:Landroid/provider/Gmail$AttachmentOrigin;

    aput-object v1, v0, v3

    sput-object v0, Landroid/provider/Gmail$AttachmentOrigin;->$VALUES:[Landroid/provider/Gmail$AttachmentOrigin;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1687
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static localFileExtras(Landroid/net/Uri;)Ljava/lang/String;
    .registers 2
    .param p0, "path"    # Landroid/net/Uri;

    .prologue
    .line 1710
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static serverExtras(JJLjava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "conversationId"    # J
    .param p2, "messageId"    # J
    .param p4, "partId"    # Ljava/lang/String;

    .prologue
    const-string v2, "_"

    .line 1697
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitServerExtras(Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "extras"    # Ljava/lang/String;

    .prologue
    .line 1706
    const-string v0, "_"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/provider/Gmail$AttachmentOrigin;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1687
    const-class v0, Landroid/provider/Gmail$AttachmentOrigin;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Landroid/provider/Gmail$AttachmentOrigin;

    return-object p0
.end method

.method public static final values()[Landroid/provider/Gmail$AttachmentOrigin;
    .registers 1

    .prologue
    .line 1687
    sget-object v0, Landroid/provider/Gmail$AttachmentOrigin;->$VALUES:[Landroid/provider/Gmail$AttachmentOrigin;

    invoke-virtual {v0}, [Landroid/provider/Gmail$AttachmentOrigin;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/provider/Gmail$AttachmentOrigin;

    return-object v0
.end method
