.class public interface abstract Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;
.super Ljava/lang/Object;
.source "AuthTokenFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/AuthTokenFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract authFailed(Ljava/lang/String;)V
.end method

.method public abstract authTokenFetched(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract fetchAuthTokenLater(Ljava/lang/String;)V
.end method
