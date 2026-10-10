.class public final enum Lcom/google/android/datamessaging/DataMessagingError$Code;
.super Ljava/lang/Enum;
.source "DataMessagingError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/datamessaging/DataMessagingError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Code"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/datamessaging/DataMessagingError$Code;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum INVALID_DEVICE_ID:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum NONE:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum SENDER_NOT_FOUND:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum TOO_MANY_REGISTRATIONS:Lcom/google/android/datamessaging/DataMessagingError$Code;

.field public static final enum UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError$Code;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 44
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v3}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->NONE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 45
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "SERVICE_NOT_RUNNING"

    invoke-direct {v0, v1, v4}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 46
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "ACCOUNT_MISSING"

    invoke-direct {v0, v1, v5}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 47
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "AUTHENTICATION_FAILED"

    invoke-direct {v0, v1, v6}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 48
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "REQUEST_TIMED_OUT"

    invoke-direct {v0, v1, v7}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 49
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "BAD_REQUEST"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 50
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "RETRY_LATER"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 53
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "SENDER_NOT_FOUND"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->SENDER_NOT_FOUND:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 54
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "TOO_MANY_REGISTRATIONS"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->TOO_MANY_REGISTRATIONS:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 55
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "INVALID_DEVICE_ID"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->INVALID_DEVICE_ID:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 56
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "INVALID_PARAMETERS"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 57
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "SERVER_ERROR"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 58
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "SERVICE_NOT_AVAILABLE"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 61
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "GENERIC_ERROR"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 62
    new-instance v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    const-string v1, "UNDEFINED"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/google/android/datamessaging/DataMessagingError$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    .line 42
    const/16 v0, 0xf

    new-array v0, v0, [Lcom/google/android/datamessaging/DataMessagingError$Code;

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->NONE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v1, v0, v5

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v1, v0, v6

    sget-object v1, Lcom/google/android/datamessaging/DataMessagingError$Code;->REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->SENDER_NOT_FOUND:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->TOO_MANY_REGISTRATIONS:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->INVALID_DEVICE_ID:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError$Code;->UNDEFINED:Lcom/google/android/datamessaging/DataMessagingError$Code;

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->$VALUES:[Lcom/google/android/datamessaging/DataMessagingError$Code;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/datamessaging/DataMessagingError$Code;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 42
    const-class v0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Lcom/google/android/datamessaging/DataMessagingError$Code;

    return-object p0
.end method

.method public static final values()[Lcom/google/android/datamessaging/DataMessagingError$Code;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/google/android/datamessaging/DataMessagingError$Code;->$VALUES:[Lcom/google/android/datamessaging/DataMessagingError$Code;

    invoke-virtual {v0}, [Lcom/google/android/datamessaging/DataMessagingError$Code;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/datamessaging/DataMessagingError$Code;

    return-object v0
.end method
