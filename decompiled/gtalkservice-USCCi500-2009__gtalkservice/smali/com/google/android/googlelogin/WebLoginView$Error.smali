.class public final enum Lcom/google/android/googlelogin/WebLoginView$Error;
.super Ljava/lang/Enum;
.source "WebLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/googlelogin/WebLoginView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Error"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/googlelogin/WebLoginView$Error;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/android/googlelogin/WebLoginView$Error;

.field public static final enum HttpError:Lcom/google/android/googlelogin/WebLoginView$Error;

.field public static final enum TooManyRedirects:Lcom/google/android/googlelogin/WebLoginView$Error;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 56
    new-instance v0, Lcom/google/android/googlelogin/WebLoginView$Error;

    const-string v1, "HttpError"

    invoke-direct {v0, v1, v2}, Lcom/google/android/googlelogin/WebLoginView$Error;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/googlelogin/WebLoginView$Error;->HttpError:Lcom/google/android/googlelogin/WebLoginView$Error;

    .line 57
    new-instance v0, Lcom/google/android/googlelogin/WebLoginView$Error;

    const-string v1, "TooManyRedirects"

    invoke-direct {v0, v1, v3}, Lcom/google/android/googlelogin/WebLoginView$Error;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/googlelogin/WebLoginView$Error;->TooManyRedirects:Lcom/google/android/googlelogin/WebLoginView$Error;

    .line 55
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/googlelogin/WebLoginView$Error;

    sget-object v1, Lcom/google/android/googlelogin/WebLoginView$Error;->HttpError:Lcom/google/android/googlelogin/WebLoginView$Error;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/googlelogin/WebLoginView$Error;->TooManyRedirects:Lcom/google/android/googlelogin/WebLoginView$Error;

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/android/googlelogin/WebLoginView$Error;->$VALUES:[Lcom/google/android/googlelogin/WebLoginView$Error;

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
    .line 55
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/googlelogin/WebLoginView$Error;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 55
    const-class v0, Lcom/google/android/googlelogin/WebLoginView$Error;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Lcom/google/android/googlelogin/WebLoginView$Error;

    return-object p0
.end method

.method public static final values()[Lcom/google/android/googlelogin/WebLoginView$Error;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lcom/google/android/googlelogin/WebLoginView$Error;->$VALUES:[Lcom/google/android/googlelogin/WebLoginView$Error;

    invoke-virtual {v0}, [Lcom/google/android/googlelogin/WebLoginView$Error;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/googlelogin/WebLoginView$Error;

    return-object v0
.end method
