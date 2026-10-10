.class public Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;
.super Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
.source "PushMessagingRegistrar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/PushMessagingRegistrar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RegisterRequest"
.end annotation


# instance fields
.field mDeveloperId:Ljava/lang/String;

.field mExtraParams:Ljava/util/Map;

.field mPermission:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "subscription"    # Ljava/lang/String;
    .param p4, "developerId"    # Ljava/lang/String;
    .param p5, "permission"    # Ljava/lang/String;
    .param p6, "extraParams"    # Ljava/util/Map;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    .line 170
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    iput-object p4, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mDeveloperId:Ljava/lang/String;

    .line 172
    iput-object p5, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mPermission:Ljava/lang/String;

    .line 173
    iput-object p6, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mExtraParams:Ljava/util/Map;

    .line 174
    return-void
.end method
