.class public Landroid/provider/Gmail$Settings;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Settings"
.end annotation


# instance fields
.field public conversationAgeDays:J

.field public labelsIncluded:[Ljava/lang/String;

.field public labelsPartial:[Ljava/lang/String;

.field public maxAttachmentSizeMb:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 739
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
