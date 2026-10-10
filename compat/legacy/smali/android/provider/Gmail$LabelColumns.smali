.class public final Landroid/provider/Gmail$LabelColumns;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LabelColumns"
.end annotation


# static fields
.field public static final CANONICAL_NAME:Ljava/lang/String; = "canonicalName"

.field public static final NAME:Ljava/lang/String; = "name"

.field public static final NUM_CONVERSATIONS:Ljava/lang/String; = "numConversations"

.field public static final NUM_UNREAD_CONVERSATIONS:Ljava/lang/String; = "numUnreadConversations"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
