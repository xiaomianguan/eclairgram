.class public Lcom/google/android/datamessaging/DataMessagingException;
.super Ljava/lang/Exception;
.source "DataMessagingException.java"


# instance fields
.field private final error:Lcom/google/android/datamessaging/DataMessagingError;


# direct methods
.method public constructor <init>(Lcom/google/android/datamessaging/DataMessagingError;)V
    .locals 0
    .param p1, "error"    # Lcom/google/android/datamessaging/DataMessagingError;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/google/android/datamessaging/DataMessagingException;->error:Lcom/google/android/datamessaging/DataMessagingError;

    .line 27
    return-void
.end method


# virtual methods
.method public getError()Lcom/google/android/datamessaging/DataMessagingError;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingException;->error:Lcom/google/android/datamessaging/DataMessagingError;

    return-object v0
.end method
