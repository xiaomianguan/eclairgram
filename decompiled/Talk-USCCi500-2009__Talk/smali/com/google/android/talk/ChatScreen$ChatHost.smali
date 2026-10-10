.class public interface abstract Lcom/google/android/talk/ChatScreen$ChatHost;
.super Ljava/lang/Object;
.source "ChatScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ChatHost"
.end annotation


# virtual methods
.method public abstract cacheContactId(Ljava/lang/String;J)V
.end method

.method public abstract getCachedContactId(Ljava/lang/String;)J
.end method

.method public abstract getColorMaker()Lcom/google/android/talk/util/ChatColorMaker;
.end method

.method public abstract invalidateImSession()V
.end method

.method public abstract pickChat(Ljava/lang/String;J)V
.end method

.method public abstract update(Landroid/view/View;)V
.end method
