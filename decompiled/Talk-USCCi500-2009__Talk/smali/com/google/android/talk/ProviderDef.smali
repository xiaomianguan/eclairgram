.class public Lcom/google/android/talk/ProviderDef;
.super Ljava/lang/Object;
.source "ProviderDef.java"


# instance fields
.field public mFullName:Ljava/lang/String;

.field public mId:J

.field public mName:Ljava/lang/String;

.field public mSignUpUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # J
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "fullName"    # Ljava/lang/String;
    .param p5, "signUpUrl"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-wide p1, p0, Lcom/google/android/talk/ProviderDef;->mId:J

    .line 27
    iput-object p3, p0, Lcom/google/android/talk/ProviderDef;->mName:Ljava/lang/String;

    .line 28
    if-eqz p4, :cond_0

    .line 29
    iput-object p4, p0, Lcom/google/android/talk/ProviderDef;->mFullName:Ljava/lang/String;

    .line 33
    :goto_0
    iput-object p5, p0, Lcom/google/android/talk/ProviderDef;->mSignUpUrl:Ljava/lang/String;

    .line 34
    return-void

    .line 31
    :cond_0
    iput-object p3, p0, Lcom/google/android/talk/ProviderDef;->mFullName:Ljava/lang/String;

    goto :goto_0
.end method
