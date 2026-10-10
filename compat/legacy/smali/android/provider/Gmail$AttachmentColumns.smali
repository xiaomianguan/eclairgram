.class public final Landroid/provider/Gmail$AttachmentColumns;
.super Ljava/lang/Object;
.source "Gmail.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AttachmentColumns"
.end annotation


# static fields
.field public static final FILENAME:Ljava/lang/String; = "filename"

.field public static final STATUS:Ljava/lang/String; = "status"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1669
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
