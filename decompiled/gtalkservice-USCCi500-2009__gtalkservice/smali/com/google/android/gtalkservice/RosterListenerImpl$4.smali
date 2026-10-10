.class Lcom/google/android/gtalkservice/RosterListenerImpl$4;
.super Ljava/lang/Object;
.source "RosterListenerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/RosterListenerImpl;->schedulePresenceNotify()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/RosterListenerImpl;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/RosterListenerImpl;)V
    .locals 0

    .prologue
    .line 197
    iput-object p1, p0, Lcom/google/android/gtalkservice/RosterListenerImpl$4;->this$0:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl$4;->this$0:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyPresenceChanged()Z

    .line 200
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterListenerImpl$4;->this$0:Lcom/google/android/gtalkservice/RosterListenerImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->access$302(Lcom/google/android/gtalkservice/RosterListenerImpl;Z)Z

    .line 201
    return-void
.end method
