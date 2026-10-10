.class public abstract Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
.super Ljava/lang/Object;
.source "PushMessagingRegistrar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/PushMessagingRegistrar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "Request"
.end annotation


# instance fields
.field mSubscription:Ljava/lang/String;

.field mUrl:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "subscription"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    iput-object p2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->mUrl:Ljava/lang/String;

    .line 159
    iput-object p3, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->mSubscription:Ljava/lang/String;

    .line 160
    return-void
.end method
