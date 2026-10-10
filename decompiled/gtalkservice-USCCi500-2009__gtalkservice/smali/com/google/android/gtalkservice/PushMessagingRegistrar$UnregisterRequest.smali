.class public Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;
.super Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
.source "PushMessagingRegistrar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/PushMessagingRegistrar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UnregisterRequest"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "subscription"    # Ljava/lang/String;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    .line 179
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    return-void
.end method
