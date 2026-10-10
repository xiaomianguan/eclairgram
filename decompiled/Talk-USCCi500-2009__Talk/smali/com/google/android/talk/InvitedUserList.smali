.class public Lcom/google/android/talk/InvitedUserList;
.super Landroid/app/ListActivity;
.source "InvitedUserList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/InvitedUserList$InvitedUserAdapter;
    }
.end annotation


# instance fields
.field private mAccountId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 79
    return-void
.end method

.method private query()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 60
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const-string v3, "account=%d AND %s=%d AND %s=%d"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v5, p0, Lcom/google/android/talk/InvitedUserList;->mAccountId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    const-string v5, "subscriptionStatus"

    aput-object v5, v4, v8

    const/4 v5, 0x2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "subscriptionType"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "nickname COLLATE UNICODE ASC"

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/google/android/talk/InvitedUserList;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 70
    .local v0, "cursor":Landroid/database/Cursor;
    new-instance v1, Lcom/google/android/talk/InvitedUserList$InvitedUserAdapter;

    invoke-direct {v1, p0, p0, v0}, Lcom/google/android/talk/InvitedUserList$InvitedUserAdapter;-><init>(Lcom/google/android/talk/InvitedUserList;Landroid/content/Context;Landroid/database/Cursor;)V

    invoke-virtual {p0, v1}, Lcom/google/android/talk/InvitedUserList;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 71
    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const v1, 0x7f060070

    invoke-virtual {p0, v1}, Lcom/google/android/talk/InvitedUserList;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/talk/InvitedUserList;->setTitle(Ljava/lang/CharSequence;)V

    .line 52
    invoke-virtual {p0}, Lcom/google/android/talk/InvitedUserList;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 54
    .local v0, "extras":Landroid/os/Bundle;
    const-string v1, "accountId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/InvitedUserList;->mAccountId:J

    .line 56
    invoke-direct {p0}, Lcom/google/android/talk/InvitedUserList;->query()V

    .line 57
    return-void
.end method

.method public final onResume()V
    .locals 0

    .prologue
    .line 75
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 76
    invoke-direct {p0}, Lcom/google/android/talk/InvitedUserList;->query()V

    .line 77
    return-void
.end method
