.class final Lcom/google/android/talk/BuddyInfo$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "BuddyInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueryHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyInfo;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/BuddyInfo;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    .line 102
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 103
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 2
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0}, Lcom/google/android/talk/BuddyInfo;->access$100(Lcom/google/android/talk/BuddyInfo;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0}, Lcom/google/android/talk/BuddyInfo;->access$100(Lcom/google/android/talk/BuddyInfo;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0, p3}, Lcom/google/android/talk/BuddyInfo;->access$102(Lcom/google/android/talk/BuddyInfo;Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 113
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0}, Lcom/google/android/talk/BuddyInfo;->access$100(Lcom/google/android/talk/BuddyInfo;)Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_1

    .line 114
    const-string v0, "talk"

    const-string v1, "[BuddyInfo] QueryHandler: empty cursor, bail!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-virtual {v0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    .line 120
    :goto_0
    return-void

    .line 119
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$QueryHandler;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0}, Lcom/google/android/talk/BuddyInfo;->access$200(Lcom/google/android/talk/BuddyInfo;)V

    goto :goto_0
.end method
