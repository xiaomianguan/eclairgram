.class public Lcom/google/android/datamessaging/DataMessagingError;
.super Ljava/lang/Object;
.source "DataMessagingError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/datamessaging/DataMessagingError$Code;
    }
.end annotation


# static fields
.field public static ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError;

.field public static AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError;

.field public static BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError;

.field public static GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError;

.field public static INVALID_DEVICE_ID:Lcom/google/android/datamessaging/DataMessagingError;

.field public static INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError;

.field public static NONE:Lcom/google/android/datamessaging/DataMessagingError;

.field public static REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError;

.field public static RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError;

.field public static SENDER_NOT_FOUND:Lcom/google/android/datamessaging/DataMessagingError;

.field public static SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError;

.field public static SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError;

.field public static SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError;

.field public static TOO_MANY_REGISTRATIONS:Lcom/google/android/datamessaging/DataMessagingError;

.field public static UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError;


# instance fields
.field private mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field private mStringError:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 65
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->NONE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->NONE:Lcom/google/android/datamessaging/DataMessagingError;

    .line 67
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError;

    .line 69
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError;

    .line 71
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError;

    .line 73
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError;

    .line 75
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError;

    .line 77
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError;

    .line 79
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->SENDER_NOT_FOUND:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->SENDER_NOT_FOUND:Lcom/google/android/datamessaging/DataMessagingError;

    .line 81
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->TOO_MANY_REGISTRATIONS:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->TOO_MANY_REGISTRATIONS:Lcom/google/android/datamessaging/DataMessagingError;

    .line 83
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->INVALID_DEVICE_ID:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->INVALID_DEVICE_ID:Lcom/google/android/datamessaging/DataMessagingError;

    .line 85
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError;

    .line 87
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError;

    .line 89
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError;

    .line 91
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError;

    .line 93
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-direct {v0, v1}, Lcom/google/android/datamessaging/DataMessagingError;-><init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError;->UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/datamessaging/DataMessagingError$Code;)V
    .locals 1
    .param p1, "code"    # Lcom/google/android/datamessaging/DataMessagingError$Code;

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    if-eqz p1, :cond_0

    .line 101
    iput-object p1, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 105
    :goto_0
    return-void

    .line 103
    :cond_0
    sget-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->NONE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    iput-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    .line 109
    invoke-direct {p0, p1}, Lcom/google/android/datamessaging/DataMessagingError;->parseError(Ljava/lang/String;)Lcom/google/android/datamessaging/DataMessagingError$Code;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 110
    return-void
.end method

.method private parseError(Ljava/lang/String;)Lcom/google/android/datamessaging/DataMessagingError$Code;
    .locals 2
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 125
    if-nez p1, :cond_0

    .line 126
    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->NONE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 132
    .end local p0    # "this":Lcom/google/android/datamessaging/DataMessagingError;
    :goto_0
    return-object v1

    .line 130
    .restart local p0    # "this":Lcom/google/android/datamessaging/DataMessagingError;
    :cond_0
    :try_start_0
    const-class v1, Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-static {v1, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/datamessaging/DataMessagingError;
    check-cast p0, Lcom/google/android/datamessaging/DataMessagingError$Code;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, p0

    goto :goto_0

    .line 131
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 132
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    goto :goto_0
.end method


# virtual methods
.method public equals(Lcom/google/android/datamessaging/DataMessagingError;)Z
    .locals 4
    .param p1, "other"    # Lcom/google/android/datamessaging/DataMessagingError;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 137
    if-ne p0, p1, :cond_0

    move v0, v2

    .line 157
    :goto_0
    return v0

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    iget-object v1, p1, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    if-ne v0, v1, :cond_4

    .line 142
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    if-ne v0, v1, :cond_3

    .line 143
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 144
    iget-object v0, p1, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v2

    .line 145
    goto :goto_0

    :cond_1
    move v0, v3

    .line 148
    goto :goto_0

    .line 151
    :cond_2
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v2

    .line 154
    goto :goto_0

    :cond_4
    move v0, v3

    .line 157
    goto :goto_0
.end method

.method public getErrorCode()Lcom/google/android/datamessaging/DataMessagingError$Code;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mStringError:Ljava/lang/String;

    .line 121
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingError;->mCode:Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-virtual {v0}, Lcom/google/android/datamessaging/DataMessagingError$Code;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
