.class public interface abstract Lcom/google/android/datamessaging/IDataMessagingService;
.super Ljava/lang/Object;
.source "IDataMessagingService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/datamessaging/IDataMessagingService$Stub;
    }
.end annotation


# virtual methods
.method public abstract registerForPushMessaging(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract unregisterForPushMessaging(Landroid/app/PendingIntent;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
