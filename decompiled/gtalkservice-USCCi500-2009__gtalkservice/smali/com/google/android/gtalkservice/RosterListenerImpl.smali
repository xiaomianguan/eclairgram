.class public Lcom/google/android/gtalkservice/RosterListenerImpl;
.super Ljava/lang/Object;
.source "RosterListenerImpl.java"

# interfaces
.implements Lorg/jivesoftware/smack/RosterListener;


# static fields
.field private static final PRESENCE_UPDATE_DELAY:I = 0xbb8

.field private static final TRACK_PERF:Z


# instance fields
.field private mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mHandler:Landroid/os/Handler;

.field private mPresenceListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

.field private mPresenceUpdateScheduled:Z

.field private mRemoteRosterListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/IRosterListener;",
            ">;"
        }
    .end annotation
.end field

.field private mResolver:Landroid/content/ContentResolver;

.field private mRosterFetched:Z

.field private mRosterListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

.field private mRosterListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gtalkservice/RemoteListenerCallback",
            "<",
            "Lcom/google/android/gtalkservice/IRosterListener;",
            ">;"
        }
    .end annotation
.end field

.field private mSelfPresenceListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Lcom/google/android/gtalkservice/RemoteListenerCallback;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/RemoteListenerCallback;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    .line 55
    new-instance v0, Lcom/google/android/gtalkservice/RosterListenerImpl$1;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/RosterListenerImpl$1;-><init>(Lcom/google/android/gtalkservice/RosterListenerImpl;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    .line 62
    new-instance v0, Lcom/google/android/gtalkservice/RosterListenerImpl$2;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/RosterListenerImpl$2;-><init>(Lcom/google/android/gtalkservice/RosterListenerImpl;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mPresenceListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    .line 70
    new-instance v0, Lcom/google/android/gtalkservice/RosterListenerImpl$3;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/RosterListenerImpl$3;-><init>(Lcom/google/android/gtalkservice/RosterListenerImpl;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mSelfPresenceListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    .line 81
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/RosterListenerImpl;Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterListenerImpl;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged(Lcom/google/android/gtalkservice/IRosterListener;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/RosterListenerImpl;Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterListenerImpl;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyPresenceChanged(Lcom/google/android/gtalkservice/IRosterListener;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/RosterListenerImpl;Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterListenerImpl;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifySelfPresenceChanged(Lcom/google/android/gtalkservice/IRosterListener;)V

    return-void
.end method

.method static synthetic access$302(Lcom/google/android/gtalkservice/RosterListenerImpl;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterListenerImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mPresenceUpdateScheduled:Z

    return p1
.end method

.method private bulkUpdatePresenceInDb(JLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 5
    .param p1, "accountId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "fromList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, "priorityList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p5, "resourceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p6, "modeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p7, "statusList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p8, "clientTypeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 629
    const-string v2, "content://com.google.android.providers.talk/bulk_presence"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 631
    .local v0, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 633
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "account"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 634
    const-string v2, "username"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 636
    const-string v2, "priority"

    invoke-virtual {v1, v2, p4}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 637
    const-string v2, "jid_resource"

    invoke-virtual {v1, v2, p5}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 638
    const-string v2, "mode"

    invoke-virtual {v1, v2, p6}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 639
    const-string v2, "status"

    invoke-virtual {v1, v2, p7}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 640
    const-string v2, "client_type"

    invoke-virtual {v1, v2, p8}, Landroid/content/ContentValues;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 642
    iget-object v2, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v2, v0, v1, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 643
    return-void
.end method

.method public static clearStoredPresence(Landroid/content/ContentResolver;JLjava/lang/String;)V
    .locals 3
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "accountId"    # J
    .param p3, "username"    # Ljava/lang/String;

    .prologue
    .line 647
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugPresence:Z

    if-eqz v1, :cond_0

    .line 648
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "clearStoredPresence for account="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", username="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 653
    :cond_0
    sget-object v1, Landroid/provider/Im$Presence;->SEED_PRESENCE_BY_ACCOUNT_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 655
    .local v0, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 660
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/ContactPresence;->removeAllContactsPresence(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 661
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 665
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterListenerImpl] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    return-void
.end method

.method private static logp(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 669
    const-string v0, "GTalkService/p"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterListenerImpl] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    return-void
.end method

.method private notifyPresenceChanged(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 153
    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p1, v1}, Lcom/google/android/gtalkservice/IRosterListener;->presenceChanged(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 157
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyPresenceChanged caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->removeRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    goto :goto_0
.end method

.method private notifyRosterChanged(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 138
    :try_start_0
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IRosterListener;->rosterChanged()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[RosterListenerImpl] notifyRosterChanged caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->removeRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    goto :goto_0
.end method

.method private notifySelfPresenceChanged(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 171
    :try_start_0
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "notifySelfPresenceChanged"

    invoke-static {v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 172
    :cond_0
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IRosterListener;->selfPresenceChanged()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    :goto_0
    return-void

    .line 173
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 176
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifySelfPresenceChanged caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->removeRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    goto :goto_0
.end method

.method private removeRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 185
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 186
    monitor-exit v0

    .line 187
    return-void

    .line 186
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private schedulePresenceNotify()V
    .locals 4

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mPresenceUpdateScheduled:Z

    if-eqz v0, :cond_0

    .line 204
    :goto_0
    return-void

    .line 195
    :cond_0
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_1

    const-string v0, "schedulePresenceNotify: in 3000 ms"

    invoke-static {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gtalkservice/RosterListenerImpl$4;

    invoke-direct {v1, p0}, Lcom/google/android/gtalkservice/RosterListenerImpl$4;-><init>(Lcom/google/android/gtalkservice/RosterListenerImpl;)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 203
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mPresenceUpdateScheduled:Z

    goto :goto_0
.end method

.method private translateClientType(Lorg/jivesoftware/smack/packet/Presence$ClientType;)I
    .locals 1
    .param p1, "clientType"    # Lorg/jivesoftware/smack/packet/Presence$ClientType;

    .prologue
    .line 426
    if-eqz p1, :cond_1

    .line 427
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->ANDROID:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    if-ne p1, v0, :cond_0

    .line 428
    const/4 v0, 0x2

    .line 434
    :goto_0
    return v0

    .line 429
    :cond_0
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->MOBILE:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    if-ne p1, v0, :cond_1

    .line 430
    const/4 v0, 0x1

    goto :goto_0

    .line 434
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private translatePresenceStatus(Lorg/jivesoftware/smack/packet/Presence;)I
    .locals 4
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    const/4 v3, 0x3

    .line 405
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Presence;->getMode()Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v0

    .line 406
    .local v0, "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v1

    .line 408
    .local v1, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v1, v2, :cond_0

    .line 409
    const/4 v2, 0x0

    .line 422
    :goto_0
    return v2

    .line 411
    :cond_0
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-eq v0, v2, :cond_1

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->CHAT:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-ne v0, v2, :cond_2

    .line 412
    :cond_1
    const/4 v2, 0x5

    goto :goto_0

    .line 413
    :cond_2
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-ne v0, v2, :cond_3

    move v2, v3

    .line 414
    goto :goto_0

    .line 415
    :cond_3
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->EXTENDED_AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-ne v0, v2, :cond_4

    .line 416
    const/4 v2, 0x2

    goto :goto_0

    .line 417
    :cond_4
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->DO_NOT_DISTURB:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-ne v0, v2, :cond_5

    .line 418
    const/4 v2, 0x4

    goto :goto_0

    :cond_5
    move v2, v3

    .line 422
    goto :goto_0
.end method

.method private updatePresenceInDb(JLjava/lang/String;ILjava/lang/String;ILjava/lang/String;I)Z
    .locals 6
    .param p1, "accountId"    # J
    .param p3, "contact"    # Ljava/lang/String;
    .param p4, "priority"    # I
    .param p5, "resource"    # Ljava/lang/String;
    .param p6, "mode"    # I
    .param p7, "status"    # Ljava/lang/String;
    .param p8, "clientType"    # I

    .prologue
    .line 560
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 562
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v4, "contact_id"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    const-string v4, " in (select "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    const-string v4, "_id"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    const-string v4, " from contacts where "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    const-string v4, "account"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    const-string v4, "=? AND "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    const-string v4, "username"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 580
    const-string v4, " LIKE ?) AND (("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 582
    const-string v4, "priority"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 583
    const-string v4, "<=? AND ("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    const-string v4, "mode"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    const-string v4, "!=? OR "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 586
    const-string v4, "status"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    const-string v4, "!=?)) OR "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    const-string v4, "priority"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 589
    const-string v4, " is NULL OR "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    const-string v4, "jid_resource"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 591
    const-string v4, "=?)"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 596
    .local v1, "selection":Ljava/lang/String;
    if-nez p7, :cond_0

    .line 597
    const-string p7, ""

    .line 600
    :cond_0
    const/4 v4, 0x6

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x1

    aput-object p3, v2, v4

    const/4 v4, 0x2

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x3

    invoke-static {p6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x4

    aput-object p7, v2, v4

    const/4 v4, 0x5

    aput-object p5, v2, v4

    .line 608
    .local v2, "selectionArgs":[Ljava/lang/String;
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v4, :cond_1

    .line 609
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updatePresenceInDb: selection => "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/RosterListenerImpl;->logp(Ljava/lang/String;)V

    .line 610
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "    selectionArgs ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, v2, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v5, v2, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    aget-object v5, v2, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x3

    aget-object v5, v2, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x4

    aget-object v5, v2, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x5

    aget-object v5, v2, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/RosterListenerImpl;->logp(Ljava/lang/String;)V

    .line 615
    :cond_1
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 616
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "jid_resource"

    invoke-virtual {v3, v4, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    const-string v4, "mode"

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 618
    const-string v4, "priority"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 619
    const-string v4, "status"

    invoke-virtual {v3, v4, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    const-string v4, "client_type"

    invoke-static {p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 622
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    sget-object v5, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3, v1, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_2

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 101
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IRosterListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 103
    .local v0, "binder":Landroid/os/IBinder;
    iget-object v3, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 104
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gtalkservice/IRosterListener;

    .line 105
    .local v2, "rl":Lcom/google/android/gtalkservice/IRosterListener;
    invoke-interface {v2}, Lcom/google/android/gtalkservice/IRosterListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v0, :cond_0

    .line 106
    monitor-exit v3

    .line 117
    .end local v2    # "rl":Lcom/google/android/gtalkservice/IRosterListener;
    :cond_1
    :goto_0
    return-void

    .line 109
    :cond_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->isRosterFetched()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 115
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged(Lcom/google/android/gtalkservice/IRosterListener;)V

    goto :goto_0

    .line 110
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method public entriesAdded(JJLjava/util/Collection;)V
    .locals 32
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p5, "rosterEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/Collection;->size()I

    move-result v18

    .line 209
    .local v18, "count":I
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "add roster for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " contacts, providerId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", accountId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-wide/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 212
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v28

    .line 214
    .local v28, "ts":J
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .local v11, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v12, "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .local v13, "contactTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v14, "subscriptionStatusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .local v15, "subscriptionTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .local v16, "quickContactAttrArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .local v17, "rejectedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/jivesoftware/smack/RosterEntry;

    .line 227
    .local v19, "entry":Lorg/jivesoftware/smack/RosterEntry;
    const/16 v21, 0x0

    .line 229
    .local v21, "isQuickContact":I
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v31

    .line 230
    .local v31, "username":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getName()Ljava/lang/String;

    move-result-object v22

    .line 233
    .local v22, "nickname":Ljava/lang/String;
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 234
    invoke-static/range {v31 .. v31}, Lorg/jivesoftware/smack/util/StringUtils;->parseAbbrevAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 237
    :cond_1
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isBlocked()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 238
    const/16 v30, 0x3

    .line 247
    .local v30, "type":I
    :goto_1
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v24

    .line 248
    .local v24, "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->SUBSCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-object/from16 v0, v24

    move-object v1, v3

    if-ne v0, v1, :cond_5

    .line 249
    const/16 v26, 0x1

    .line 256
    .local v26, "subscriptionStatus":I
    :goto_2
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v25

    .line 257
    .local v25, "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->TO:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_7

    .line 258
    const/16 v27, 0x2

    .line 269
    .local v27, "subscriptionType":I
    :goto_3
    move-object v0, v11

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    move-object v0, v12

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 271
    invoke-static/range {v30 .. v30}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 273
    invoke-static/range {v27 .. v27}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 276
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isQuickContact()Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x1

    move/from16 v21, v3

    .line 277
    :goto_4
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->googleGetRejected()Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v3, 0x1

    move/from16 v23, v3

    .line 281
    .local v23, "rejected":I
    :goto_5
    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v16

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 239
    .end local v23    # "rejected":I
    .end local v24    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v25    # "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .end local v26    # "subscriptionStatus":I
    .end local v27    # "subscriptionType":I
    .end local v30    # "type":I
    :cond_2
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isHidden()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 240
    const/16 v30, 0x4

    .restart local v30    # "type":I
    goto :goto_1

    .line 241
    .end local v30    # "type":I
    :cond_3
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isPinned()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 242
    const/16 v30, 0x5

    .restart local v30    # "type":I
    goto :goto_1

    .line 244
    .end local v30    # "type":I
    :cond_4
    const/16 v30, 0x0

    .restart local v30    # "type":I
    goto :goto_1

    .line 250
    .restart local v24    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    :cond_5
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->UNSUBCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-object/from16 v0, v24

    move-object v1, v3

    if-ne v0, v1, :cond_6

    .line 251
    const/16 v26, 0x2

    .restart local v26    # "subscriptionStatus":I
    goto :goto_2

    .line 253
    .end local v26    # "subscriptionStatus":I
    :cond_6
    const/16 v26, 0x0

    .restart local v26    # "subscriptionStatus":I
    goto :goto_2

    .line 259
    .restart local v25    # "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_7
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->FROM:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_8

    .line 260
    const/16 v27, 0x3

    .restart local v27    # "subscriptionType":I
    goto :goto_3

    .line 261
    .end local v27    # "subscriptionType":I
    :cond_8
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->BOTH:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_9

    .line 262
    const/16 v27, 0x4

    .restart local v27    # "subscriptionType":I
    goto :goto_3

    .line 263
    .end local v27    # "subscriptionType":I
    :cond_9
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_a

    .line 264
    const/16 v27, 0x1

    .restart local v27    # "subscriptionType":I
    goto/16 :goto_3

    .line 266
    .end local v27    # "subscriptionType":I
    :cond_a
    const/16 v27, 0x0

    .restart local v27    # "subscriptionType":I
    goto/16 :goto_3

    .line 276
    :cond_b
    const/4 v3, 0x0

    move/from16 v21, v3

    goto :goto_4

    .line 277
    :cond_c
    const/4 v3, 0x0

    move/from16 v23, v3

    goto :goto_5

    .line 288
    .end local v19    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v21    # "isQuickContact":I
    .end local v22    # "nickname":Ljava/lang/String;
    .end local v24    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v25    # "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .end local v26    # "subscriptionStatus":I
    .end local v27    # "subscriptionType":I
    .end local v30    # "type":I
    .end local v31    # "username":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    move-object v3, v0

    sget-object v4, Landroid/provider/Im$Contacts;->BULK_CONTENT_URI:Landroid/net/Uri;

    const-wide/16 v9, 0x0

    move-wide/from16 v5, p1

    move-wide/from16 v7, p3

    invoke-static/range {v3 .. v17}, Lcom/google/android/gtalkservice/DatabaseHelper;->addBulkContacts(Landroid/content/ContentResolver;Landroid/net/Uri;JJJLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Landroid/net/Uri;

    .line 294
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 301
    return-void
.end method

.method public entriesDeleted(JJLjava/util/Collection;)V
    .locals 1
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 399
    .local p5, "rosterEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v0, p3, p4, p5}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteContacts(Landroid/content/ContentResolver;JLjava/util/Collection;)I

    .line 400
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 401
    return-void
.end method

.method public entriesUpdated(JJLjava/util/Collection;)V
    .locals 32
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 305
    .local p5, "rosterEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/Collection;->size()I

    move-result v18

    .line 306
    .local v18, "count":I
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "update roster: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", providerId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", accountId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-wide/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 309
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v28

    .line 311
    .local v28, "ts":J
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 312
    .local v11, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 313
    .local v12, "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 314
    .local v13, "contactTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 315
    .local v14, "subscriptionStatusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .local v15, "subscriptionTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .local v16, "quickContactAttrArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 319
    .local v17, "rejectedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/jivesoftware/smack/RosterEntry;

    .line 324
    .local v19, "entry":Lorg/jivesoftware/smack/RosterEntry;
    const/16 v21, 0x0

    .line 326
    .local v21, "isQuickContact":I
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v31

    .line 327
    .local v31, "username":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getName()Ljava/lang/String;

    move-result-object v22

    .line 330
    .local v22, "nickname":Ljava/lang/String;
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 331
    invoke-static/range {v31 .. v31}, Lorg/jivesoftware/smack/util/StringUtils;->parseAbbrevAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 334
    :cond_1
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isBlocked()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 335
    const/16 v30, 0x3

    .line 345
    .local v30, "type":I
    :goto_1
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v24

    .line 346
    .local v24, "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->SUBSCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-object/from16 v0, v24

    move-object v1, v3

    if-ne v0, v1, :cond_5

    .line 347
    const/16 v26, 0x1

    .line 354
    .local v26, "subscriptionStatus":I
    :goto_2
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->getType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v25

    .line 355
    .local v25, "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->TO:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_7

    .line 356
    const/16 v27, 0x2

    .line 369
    .local v27, "subscriptionType":I
    :goto_3
    move-object v0, v11

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 370
    move-object v0, v12

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    invoke-static/range {v30 .. v30}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 373
    invoke-static/range {v27 .. v27}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 376
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isQuickContact()Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, 0x1

    move/from16 v21, v3

    .line 377
    :goto_4
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->googleGetRejected()Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v3, 0x1

    move/from16 v23, v3

    .line 379
    .local v23, "rejected":I
    :goto_5
    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v16

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 336
    .end local v23    # "rejected":I
    .end local v24    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v25    # "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .end local v26    # "subscriptionStatus":I
    .end local v27    # "subscriptionType":I
    .end local v30    # "type":I
    :cond_2
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isHidden()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 337
    const/16 v30, 0x4

    .restart local v30    # "type":I
    goto :goto_1

    .line 338
    .end local v30    # "type":I
    :cond_3
    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/RosterEntry;->isPinned()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 339
    const/16 v30, 0x5

    .restart local v30    # "type":I
    goto :goto_1

    .line 341
    .end local v30    # "type":I
    :cond_4
    const/16 v30, 0x0

    .restart local v30    # "type":I
    goto :goto_1

    .line 348
    .restart local v24    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    :cond_5
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->UNSUBCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-object/from16 v0, v24

    move-object v1, v3

    if-ne v0, v1, :cond_6

    .line 349
    const/16 v26, 0x2

    .restart local v26    # "subscriptionStatus":I
    goto :goto_2

    .line 351
    .end local v26    # "subscriptionStatus":I
    :cond_6
    const/16 v26, 0x0

    .restart local v26    # "subscriptionStatus":I
    goto :goto_2

    .line 357
    .restart local v25    # "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_7
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->FROM:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_8

    .line 358
    const/16 v27, 0x3

    .restart local v27    # "subscriptionType":I
    goto :goto_3

    .line 359
    .end local v27    # "subscriptionType":I
    :cond_8
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->BOTH:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_9

    .line 360
    const/16 v27, 0x4

    .restart local v27    # "subscriptionType":I
    goto :goto_3

    .line 361
    .end local v27    # "subscriptionType":I
    :cond_9
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-object/from16 v0, v25

    move-object v1, v3

    if-ne v0, v1, :cond_a

    .line 362
    const/16 v27, 0x1

    .restart local v27    # "subscriptionType":I
    goto/16 :goto_3

    .line 364
    .end local v27    # "subscriptionType":I
    :cond_a
    const/16 v27, 0x0

    .restart local v27    # "subscriptionType":I
    goto/16 :goto_3

    .line 376
    :cond_b
    const/4 v3, 0x0

    move/from16 v21, v3

    goto :goto_4

    .line 377
    :cond_c
    const/4 v3, 0x0

    move/from16 v23, v3

    goto :goto_5

    .line 383
    .end local v19    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v21    # "isQuickContact":I
    .end local v22    # "nickname":Ljava/lang/String;
    .end local v24    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v25    # "subsType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .end local v26    # "subscriptionStatus":I
    .end local v27    # "subscriptionType":I
    .end local v30    # "type":I
    .end local v31    # "username":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    move-object v3, v0

    sget-object v4, Landroid/provider/Im$Contacts;->BULK_CONTENT_URI:Landroid/net/Uri;

    const-wide/16 v9, 0x0

    move-wide/from16 v5, p1

    move-wide/from16 v7, p3

    invoke-static/range {v3 .. v17}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateBulkContacts(Landroid/content/ContentResolver;Landroid/net/Uri;JJJLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 389
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 395
    return-void
.end method

.method public init(Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V
    .locals 1
    .param p1, "resolver"    # Landroid/content/ContentResolver;
    .param p2, "mc"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    .line 85
    iput-object p2, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 86
    iput-object p3, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mHandler:Landroid/os/Handler;

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    .line 88
    return-void
.end method

.method public isRosterFetched()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterFetched:Z

    return v0
.end method

.method public notifyPresenceChanged()Z
    .locals 3

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mPresenceListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v0

    return v0
.end method

.method public notifyRosterChanged()Z
    .locals 3

    .prologue
    .line 133
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v0

    return v0
.end method

.method public notifySelfPresenceChanged()Z
    .locals 3

    .prologue
    .line 165
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mSelfPresenceListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v0

    return v0
.end method

.method public presenceChanged(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 18
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 438
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 439
    .local v5, "bareJid":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 441
    .local v7, "resource":Ljava/lang/String;
    const/4 v9, 0x0

    .line 442
    .local v9, "status":Ljava/lang/String;
    const/4 v6, 0x0

    .line 444
    .local v6, "priority":I
    const/4 v10, 0x0

    .line 450
    .local v10, "clientType":I
    if-nez p2, :cond_2

    .line 451
    const/4 v8, 0x0

    .line 459
    .local v8, "mode":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v17

    .line 464
    .local v17, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    invoke-static {v5}, Lcom/google/android/gtalkservice/XmppUtils;->isGroupChat(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-wide v3, v0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v10}, Lcom/google/android/gtalkservice/RosterListenerImpl;->updatePresenceInDb(JLjava/lang/String;ILjava/lang/String;ILjava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 467
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugPresence:Z

    if-eqz v2, :cond_0

    .line 468
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "presence update ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object v0, v2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", priority="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", clientType="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/RosterListenerImpl;->logp(Ljava/lang/String;)V

    .line 472
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    move-object v11, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-wide v12, v0

    move-object v14, v5

    move v15, v8

    move-object/from16 v16, v9

    invoke-static/range {v11 .. v16}, Lcom/google/android/gtalkservice/ContactPresence;->updateContactPresence(Landroid/content/ContentResolver;JLjava/lang/String;ILjava/lang/String;)V

    .line 474
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->schedulePresenceNotify()V

    .line 484
    :cond_1
    :goto_1
    return-void

    .line 453
    .end local v8    # "mode":I
    .end local v17    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->translatePresenceStatus(Lorg/jivesoftware/smack/packet/Presence;)I

    move-result v8

    .line 454
    .restart local v8    # "mode":I
    invoke-virtual/range {p2 .. p2}, Lorg/jivesoftware/smack/packet/Presence;->getClientType()Lorg/jivesoftware/smack/packet/Presence$ClientType;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->translateClientType(Lorg/jivesoftware/smack/packet/Presence$ClientType;)I

    move-result v10

    .line 455
    invoke-virtual/range {p2 .. p2}, Lorg/jivesoftware/smack/packet/Presence;->getStatus()Ljava/lang/String;

    move-result-object v9

    .line 456
    invoke-virtual/range {p2 .. p2}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v6

    goto/16 :goto_0

    .line 475
    .restart local v17    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    :cond_3
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugPresence:Z

    if-eqz v2, :cond_1

    .line 476
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "---IGNORE--- presence update ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object v0, v2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", priority="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", status="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/RosterListenerImpl;->logp(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public presenceChanged(Ljava/util/Collection;)V
    .locals 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 487
    .local p1, "presenceEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/packet/Presence;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v19

    .line 488
    .local v19, "count":I
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "presenceChanged(batch): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 490
    :cond_0
    if-nez v19, :cond_1

    .line 552
    :goto_0
    return-void

    .line 494
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v28

    .line 496
    .local v28, "ts":J
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .local v8, "fromList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 498
    .local v9, "priorityList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 499
    .local v10, "resourceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 500
    .local v11, "modeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 501
    .local v12, "statusList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 503
    .local v13, "clientTypeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move/from16 v0, v19

    new-array v0, v0, [Landroid/content/ContentValues;

    move-object/from16 v18, v0

    .line 505
    .local v18, "contactsPresenceValues":[Landroid/content/ContentValues;
    const/4 v14, 0x0

    .line 506
    .local v14, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    const-wide/16 v6, 0x0

    .line 507
    .local v6, "accountId":J
    const/16 v21, 0x0

    .line 509
    .local v21, "i":I
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .local v23, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/jivesoftware/smack/packet/Presence;

    .line 510
    .local v25, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual/range {v25 .. v25}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v20

    .line 511
    .local v20, "from":Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 512
    .local v15, "bareJid":Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 513
    .local v26, "resource":Ljava/lang/String;
    invoke-virtual/range {v25 .. v25}, Lorg/jivesoftware/smack/packet/Presence;->getStatus()Ljava/lang/String;

    move-result-object v27

    .line 514
    .local v27, "status":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->translatePresenceStatus(Lorg/jivesoftware/smack/packet/Presence;)I

    move-result v24

    .line 515
    .local v24, "mode":I
    invoke-virtual/range {v25 .. v25}, Lorg/jivesoftware/smack/packet/Presence;->getClientType()Lorg/jivesoftware/smack/packet/Presence$ClientType;

    move-result-object v5

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->translateClientType(Lorg/jivesoftware/smack/packet/Presence$ClientType;)I

    move-result v16

    .line 517
    .local v16, "clientType":I
    if-nez v14, :cond_2

    .line 520
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v14

    .line 522
    iget-wide v6, v14, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    .line 526
    :cond_2
    invoke-virtual {v8, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 527
    invoke-virtual/range {v25 .. v25}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 528
    move-object v0, v10

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 529
    invoke-static/range {v24 .. v24}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 530
    move-object v0, v12

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 531
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    move-wide v0, v6

    move-object v2, v15

    move/from16 v3, v24

    move-object/from16 v4, v27

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/ContactPresence;->buildContactPresenceValues(JLjava/lang/String;ILjava/lang/String;)Landroid/content/ContentValues;

    move-result-object v17

    .line 536
    .local v17, "contactPresenceValue":Landroid/content/ContentValues;
    add-int/lit8 v22, v21, 0x1

    .end local v21    # "i":I
    .local v22, "i":I
    aput-object v17, v18, v21

    move/from16 v21, v22

    .line 537
    .end local v22    # "i":I
    .restart local v21    # "i":I
    goto :goto_1

    .end local v15    # "bareJid":Ljava/lang/String;
    .end local v16    # "clientType":I
    .end local v17    # "contactPresenceValue":Landroid/content/ContentValues;
    .end local v20    # "from":Ljava/lang/String;
    .end local v24    # "mode":I
    .end local v25    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v26    # "resource":Ljava/lang/String;
    .end local v27    # "status":Ljava/lang/String;
    :cond_3
    move-object/from16 v5, p0

    .line 540
    invoke-direct/range {v5 .. v13}, Lcom/google/android/gtalkservice/RosterListenerImpl;->bulkUpdatePresenceInDb(JLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 543
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyPresenceChanged()Z

    .line 546
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mResolver:Landroid/content/ContentResolver;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/ContactPresence;->bulkUpdateContactPresences(Landroid/content/ContentResolver;[Landroid/content/ContentValues;)V

    goto/16 :goto_0
.end method

.method public removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 120
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IRosterListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 122
    .local v0, "binder":Landroid/os/IBinder;
    iget-object v3, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 123
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gtalkservice/IRosterListener;

    .line 124
    .local v2, "rl":Lcom/google/android/gtalkservice/IRosterListener;
    invoke-interface {v2}, Lcom/google/android/gtalkservice/IRosterListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v0, :cond_0

    .line 125
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRemoteRosterListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 126
    monitor-exit v3

    .line 130
    .end local v2    # "rl":Lcom/google/android/gtalkservice/IRosterListener;
    :goto_0
    return-void

    .line 129
    :cond_1
    monitor-exit v3

    goto :goto_0

    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public setRosterFetched(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 96
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setRosterFetched: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->log(Ljava/lang/String;)V

    .line 97
    :cond_0
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl;->mRosterFetched:Z

    .line 98
    return-void
.end method
