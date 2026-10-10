.class public final enum Landroid/net/NetworkConnectivityListener$State;
.super Ljava/lang/Enum;
.source "NetworkConnectivityListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/net/NetworkConnectivityListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/net/NetworkConnectivityListener$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/net/NetworkConnectivityListener$State;

.field public static final enum CONNECTED:Landroid/net/NetworkConnectivityListener$State;

.field public static final enum NOT_CONNECTED:Landroid/net/NetworkConnectivityListener$State;

.field public static final enum UNKNOWN:Landroid/net/NetworkConnectivityListener$State;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 104
    new-instance v0, Landroid/net/NetworkConnectivityListener$State;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v2}, Landroid/net/NetworkConnectivityListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/NetworkConnectivityListener$State;->UNKNOWN:Landroid/net/NetworkConnectivityListener$State;

    .line 107
    new-instance v0, Landroid/net/NetworkConnectivityListener$State;

    const-string v1, "CONNECTED"

    invoke-direct {v0, v1, v3}, Landroid/net/NetworkConnectivityListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/NetworkConnectivityListener$State;->CONNECTED:Landroid/net/NetworkConnectivityListener$State;

    .line 117
    new-instance v0, Landroid/net/NetworkConnectivityListener$State;

    const-string v1, "NOT_CONNECTED"

    invoke-direct {v0, v1, v4}, Landroid/net/NetworkConnectivityListener$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/net/NetworkConnectivityListener$State;->NOT_CONNECTED:Landroid/net/NetworkConnectivityListener$State;

    .line 103
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/net/NetworkConnectivityListener$State;

    sget-object v1, Landroid/net/NetworkConnectivityListener$State;->UNKNOWN:Landroid/net/NetworkConnectivityListener$State;

    aput-object v1, v0, v2

    sget-object v1, Landroid/net/NetworkConnectivityListener$State;->CONNECTED:Landroid/net/NetworkConnectivityListener$State;

    aput-object v1, v0, v3

    sget-object v1, Landroid/net/NetworkConnectivityListener$State;->NOT_CONNECTED:Landroid/net/NetworkConnectivityListener$State;

    aput-object v1, v0, v4

    sput-object v0, Landroid/net/NetworkConnectivityListener$State;->$VALUES:[Landroid/net/NetworkConnectivityListener$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/net/NetworkConnectivityListener$State;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 103
    const-class v0, Landroid/net/NetworkConnectivityListener$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Landroid/net/NetworkConnectivityListener$State;

    return-object p0
.end method

.method public static final values()[Landroid/net/NetworkConnectivityListener$State;
    .registers 1

    .prologue
    .line 103
    sget-object v0, Landroid/net/NetworkConnectivityListener$State;->$VALUES:[Landroid/net/NetworkConnectivityListener$State;

    invoke-virtual {v0}, [Landroid/net/NetworkConnectivityListener$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/NetworkConnectivityListener$State;

    return-object v0
.end method
