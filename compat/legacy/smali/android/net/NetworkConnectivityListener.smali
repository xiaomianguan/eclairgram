.class public Landroid/net/NetworkConnectivityListener;
.super Ljava/lang/Object;
.source "NetworkConnectivityListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/net/NetworkConnectivityListener$1;,
        Landroid/net/NetworkConnectivityListener$State;,
        Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final DBG:Z = false

.field private static final TAG:Ljava/lang/String; = "NetworkConnectivityListener"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mHandlers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/os/Handler;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsFailover:Z

.field private mListening:Z

.field private mNetworkInfo:Landroid/net/NetworkInfo;

.field private mOtherNetworkInfo:Landroid/net/NetworkInfo;

.field private mReason:Ljava/lang/String;

.field private mReceiver:Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;

.field private mState:Landroid/net/NetworkConnectivityListener$State;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mHandlers:Ljava/util/HashMap;

    .line 124
    sget-object v0, Landroid/net/NetworkConnectivityListener$State;->UNKNOWN:Landroid/net/NetworkConnectivityListener$State;

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mState:Landroid/net/NetworkConnectivityListener$State;

    .line 125
    new-instance v0, Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;-><init>(Landroid/net/NetworkConnectivityListener;Landroid/net/NetworkConnectivityListener$1;)V

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mReceiver:Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;

    .line 126
    return-void
.end method

.method static synthetic access$000(Landroid/net/NetworkConnectivityListener;)Z
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;

    .prologue
    .line 35
    iget-boolean v0, p0, Landroid/net/NetworkConnectivityListener;->mListening:Z

    return v0
.end method

.method static synthetic access$100(Landroid/net/NetworkConnectivityListener;)Landroid/net/NetworkConnectivityListener$State;
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;

    .prologue
    .line 35
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mState:Landroid/net/NetworkConnectivityListener$State;

    return-object v0
.end method

.method static synthetic access$102(Landroid/net/NetworkConnectivityListener;Landroid/net/NetworkConnectivityListener$State;)Landroid/net/NetworkConnectivityListener$State;
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;
    .param p1, "x1"    # Landroid/net/NetworkConnectivityListener$State;

    .prologue
    .line 35
    iput-object p1, p0, Landroid/net/NetworkConnectivityListener;->mState:Landroid/net/NetworkConnectivityListener$State;

    return-object p1
.end method

.method static synthetic access$202(Landroid/net/NetworkConnectivityListener;Landroid/net/NetworkInfo;)Landroid/net/NetworkInfo;
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;
    .param p1, "x1"    # Landroid/net/NetworkInfo;

    .prologue
    .line 35
    iput-object p1, p0, Landroid/net/NetworkConnectivityListener;->mNetworkInfo:Landroid/net/NetworkInfo;

    return-object p1
.end method

.method static synthetic access$302(Landroid/net/NetworkConnectivityListener;Landroid/net/NetworkInfo;)Landroid/net/NetworkInfo;
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;
    .param p1, "x1"    # Landroid/net/NetworkInfo;

    .prologue
    .line 35
    iput-object p1, p0, Landroid/net/NetworkConnectivityListener;->mOtherNetworkInfo:Landroid/net/NetworkInfo;

    return-object p1
.end method

.method static synthetic access$402(Landroid/net/NetworkConnectivityListener;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Landroid/net/NetworkConnectivityListener;->mReason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$502(Landroid/net/NetworkConnectivityListener;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Landroid/net/NetworkConnectivityListener;->mIsFailover:Z

    return p1
.end method

.method static synthetic access$600(Landroid/net/NetworkConnectivityListener;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Landroid/net/NetworkConnectivityListener;

    .prologue
    .line 35
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mHandlers:Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method public getNetworkInfo()Landroid/net/NetworkInfo;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mNetworkInfo:Landroid/net/NetworkInfo;

    return-object v0
.end method

.method public getOtherNetworkInfo()Landroid/net/NetworkInfo;
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mOtherNetworkInfo:Landroid/net/NetworkInfo;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mReason:Ljava/lang/String;

    return-object v0
.end method

.method public getState()Landroid/net/NetworkConnectivityListener$State;
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mState:Landroid/net/NetworkConnectivityListener$State;

    return-object v0
.end method

.method public isFailover()Z
    .registers 2

    .prologue
    .line 208
    iget-boolean v0, p0, Landroid/net/NetworkConnectivityListener;->mIsFailover:Z

    return v0
.end method

.method public registerHandler(Landroid/os/Handler;I)V
    .registers 5
    .param p1, "target"    # Landroid/os/Handler;
    .param p2, "what"    # I

    .prologue
    .line 166
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mHandlers:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    return-void
.end method

.method public declared-synchronized startListening(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 133
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Landroid/net/NetworkConnectivityListener;->mListening:Z

    if-nez v1, :cond_19

    .line 134
    iput-object p1, p0, Landroid/net/NetworkConnectivityListener;->mContext:Landroid/content/Context;

    .line 136
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 137
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 138
    iget-object v1, p0, Landroid/net/NetworkConnectivityListener;->mReceiver:Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 139
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/net/NetworkConnectivityListener;->mListening:Z
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1b

    .line 141
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_19
    monitor-exit p0

    return-void

    .line 133
    :catchall_1b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized stopListening()V
    .registers 3

    .prologue
    .line 147
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/net/NetworkConnectivityListener;->mListening:Z

    if-eqz v0, :cond_1e

    .line 148
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mContext:Landroid/content/Context;

    iget-object v1, p0, Landroid/net/NetworkConnectivityListener;->mReceiver:Landroid/net/NetworkConnectivityListener$ConnectivityBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 149
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mContext:Landroid/content/Context;

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mNetworkInfo:Landroid/net/NetworkInfo;

    .line 151
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mOtherNetworkInfo:Landroid/net/NetworkInfo;

    .line 152
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/net/NetworkConnectivityListener;->mIsFailover:Z

    .line 153
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/NetworkConnectivityListener;->mReason:Ljava/lang/String;

    .line 154
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/net/NetworkConnectivityListener;->mListening:Z
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_20

    .line 156
    :cond_1e
    monitor-exit p0

    return-void

    .line 147
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterHandler(Landroid/os/Handler;)V
    .registers 3
    .param p1, "target"    # Landroid/os/Handler;

    .prologue
    .line 174
    iget-object v0, p0, Landroid/net/NetworkConnectivityListener;->mHandlers:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    return-void
.end method
