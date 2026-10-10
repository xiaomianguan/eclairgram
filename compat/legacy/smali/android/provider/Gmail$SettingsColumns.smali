.class public final Landroid/provider/Gmail$SettingsColumns;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SettingsColumns"
.end annotation


# static fields
.field public static final CONVERSATION_AGE_DAYS:Ljava/lang/String; = "conversationAgeDays"

.field public static final LABELS_INCLUDED:Ljava/lang/String; = "labelsIncluded"

.field public static final LABELS_PARTIAL:Ljava/lang/String; = "labelsPartial"

.field public static final MAX_ATTACHMENET_SIZE_MB:Ljava/lang/String; = "maxAttachmentSize"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 366
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
