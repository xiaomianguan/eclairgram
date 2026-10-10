.class final enum Lcom/google/android/talk/BuddyList$ViewMode;
.super Ljava/lang/Enum;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ViewMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/talk/BuddyList$ViewMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/android/talk/BuddyList$ViewMode;

.field public static final enum ALL:Lcom/google/android/talk/BuddyList$ViewMode;

.field public static final enum QUICK_CONTACTS:Lcom/google/android/talk/BuddyList$ViewMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 169
    new-instance v0, Lcom/google/android/talk/BuddyList$ViewMode;

    const-string v1, "QUICK_CONTACTS"

    invoke-direct {v0, v1, v2}, Lcom/google/android/talk/BuddyList$ViewMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/talk/BuddyList$ViewMode;->QUICK_CONTACTS:Lcom/google/android/talk/BuddyList$ViewMode;

    new-instance v0, Lcom/google/android/talk/BuddyList$ViewMode;

    const-string v1, "ALL"

    invoke-direct {v0, v1, v3}, Lcom/google/android/talk/BuddyList$ViewMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/talk/BuddyList$ViewMode;->ALL:Lcom/google/android/talk/BuddyList$ViewMode;

    .line 168
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/talk/BuddyList$ViewMode;

    sget-object v1, Lcom/google/android/talk/BuddyList$ViewMode;->QUICK_CONTACTS:Lcom/google/android/talk/BuddyList$ViewMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/talk/BuddyList$ViewMode;->ALL:Lcom/google/android/talk/BuddyList$ViewMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/android/talk/BuddyList$ViewMode;->$VALUES:[Lcom/google/android/talk/BuddyList$ViewMode;

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
    .line 168
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/talk/BuddyList$ViewMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 168
    const-class v0, Lcom/google/android/talk/BuddyList$ViewMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Lcom/google/android/talk/BuddyList$ViewMode;

    return-object p0
.end method

.method public static final values()[Lcom/google/android/talk/BuddyList$ViewMode;
    .locals 1

    .prologue
    .line 168
    sget-object v0, Lcom/google/android/talk/BuddyList$ViewMode;->$VALUES:[Lcom/google/android/talk/BuddyList$ViewMode;

    invoke-virtual {v0}, [Lcom/google/android/talk/BuddyList$ViewMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/talk/BuddyList$ViewMode;

    return-object v0
.end method
