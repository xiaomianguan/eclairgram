.class public final Lcom/google/android/apps/gtalkservice/Manifest$permission;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gtalkservice/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "permission"
.end annotation


# static fields
.field public static final BROADCAST_DATA_MESSAGE:Ljava/lang/String; = "com.google.android.permission.BROADCAST_DATA_MESSAGE"

.field public static final GTALK_SERVICE:Ljava/lang/String; = "com.google.android.gtalkservice.permission.GTALK_SERVICE"

.field public static final INTENT_VENDING_ONLY:Ljava/lang/String; = "com.android.vending.INTENT_VENDING_ONLY"

.field public static final RECEIVE_DATA_MESSAGE:Ljava/lang/String; = "com.google.android.permission.RECEIVE_DATA_MESSAGE"

.field public static final SEND_DATA_MESSAGE:Ljava/lang/String; = "com.google.android.permission.SEND_DATA_MESSAGE"

.field public static final SEND_HEARTBEAT:Ljava/lang/String; = "com.google.android.gtalkservice.permission.SEND_HEARTBEAT"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
