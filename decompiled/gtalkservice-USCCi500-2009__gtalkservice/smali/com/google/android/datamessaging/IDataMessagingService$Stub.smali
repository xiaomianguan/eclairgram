.class public abstract Lcom/google/android/datamessaging/IDataMessagingService$Stub;
.super Landroid/os/Binder;
.source "IDataMessagingService.java"

# interfaces
.implements Lcom/google/android/datamessaging/IDataMessagingService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/datamessaging/IDataMessagingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/datamessaging/IDataMessagingService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.google.android.datamessaging.IDataMessagingService"

.field static final TRANSACTION_registerForPushMessaging:I = 0x1

.field static final TRANSACTION_unregisterForPushMessaging:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 28
    const-string v0, "com.google.android.datamessaging.IDataMessagingService"

    invoke-virtual {p0, p0, v0}, Lcom/google/android/datamessaging/IDataMessagingService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/android/datamessaging/IDataMessagingService;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 36
    if-nez p0, :cond_0

    .line 37
    const/4 v1, 0x0

    .line 43
    :goto_0
    return-object v1

    .line 39
    :cond_0
    const-string v1, "com.google.android.datamessaging.IDataMessagingService"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 40
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/google/android/datamessaging/IDataMessagingService;

    if-eqz v1, :cond_1

    .line 41
    check-cast v0, Lcom/google/android/datamessaging/IDataMessagingService;

    .end local v0    # "iin":Landroid/os/IInterface;
    move-object v1, v0

    goto :goto_0

    .line 43
    .restart local v0    # "iin":Landroid/os/IInterface;
    :cond_1
    new-instance v1, Lcom/google/android/datamessaging/IDataMessagingService$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/google/android/datamessaging/IDataMessagingService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 47
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 7
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const-string v6, "com.google.android.datamessaging.IDataMessagingService"

    .line 51
    sparse-switch p1, :sswitch_data_0

    .line 92
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    :goto_0
    return v4

    .line 55
    :sswitch_0
    const-string v4, "com.google.android.datamessaging.IDataMessagingService"

    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    move v4, v5

    .line 56
    goto :goto_0

    .line 60
    :sswitch_1
    const-string v4, "com.google.android.datamessaging.IDataMessagingService"

    invoke-virtual {p2, v6}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    sget-object v4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    .line 69
    .local v0, "_arg0":Landroid/app/PendingIntent;
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "_arg1":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 72
    .local v3, "cl":Ljava/lang/ClassLoader;
    invoke-virtual {p2, v3}, Landroid/os/Parcel;->readHashMap(Ljava/lang/ClassLoader;)Ljava/util/HashMap;

    move-result-object v2

    .line 73
    .local v2, "_arg2":Ljava/util/Map;
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/datamessaging/IDataMessagingService$Stub;->registerForPushMessaging(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/Map;)V

    .line 74
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v4, v5

    .line 75
    goto :goto_0

    .line 66
    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    .end local v1    # "_arg1":Ljava/lang/String;
    .end local v2    # "_arg2":Ljava/util/Map;
    .end local v3    # "cl":Ljava/lang/ClassLoader;
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/app/PendingIntent;
    goto :goto_1

    .line 79
    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    :sswitch_2
    const-string v4, "com.google.android.datamessaging.IDataMessagingService"

    invoke-virtual {p2, v6}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 81
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_1

    .line 82
    sget-object v4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    .line 87
    .restart local v0    # "_arg0":Landroid/app/PendingIntent;
    :goto_2
    invoke-virtual {p0, v0}, Lcom/google/android/datamessaging/IDataMessagingService$Stub;->unregisterForPushMessaging(Landroid/app/PendingIntent;)V

    .line 88
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    move v4, v5

    .line 89
    goto :goto_0

    .line 85
    .end local v0    # "_arg0":Landroid/app/PendingIntent;
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/app/PendingIntent;
    goto :goto_2

    .line 51
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
