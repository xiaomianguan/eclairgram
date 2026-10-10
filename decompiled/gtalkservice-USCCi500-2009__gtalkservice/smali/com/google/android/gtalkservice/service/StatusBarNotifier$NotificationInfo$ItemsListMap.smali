.class Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;
.super Ljava/lang/Object;
.source "StatusBarNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ItemsListMap"
.end annotation


# instance fields
.field mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;",
            ">;"
        }
    .end annotation
.end field

.field mMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;)V
    .locals 1

    .prologue
    .line 167
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->this$1:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mMap:Ljava/util/HashMap;

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mList:Ljava/util/ArrayList;

    .line 168
    return-void
.end method


# virtual methods
.method addItem(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;)Z
    .locals 3
    .param p1, "item"    # Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .prologue
    const/4 v2, 0x0

    .line 175
    iget-object v0, p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    .line 176
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    move v1, v2

    .line 182
    :goto_0
    return v1

    .line 180
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 182
    const/4 v1, 0x1

    goto :goto_0
.end method

.method containsSender(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getItem(I)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 171
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;
    check-cast p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    return-object p0
.end method

.method getList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mList:Ljava/util/ArrayList;

    return-object v0
.end method

.method removeItemBySender(Ljava/lang/String;)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 190
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .line 191
    .local v0, "item":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
    if-eqz v0, :cond_0

    .line 192
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-object v1, v0

    .line 196
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
