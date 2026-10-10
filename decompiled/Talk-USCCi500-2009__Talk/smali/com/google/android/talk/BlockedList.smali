.class public Lcom/google/android/talk/BlockedList;
.super Landroid/app/ListActivity;
.source "BlockedList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/BlockedList$BlockedUserAdapter;
    }
.end annotation


# static fields
.field private static final SELECTED_NICKNAME_TAG:Ljava/lang/String; = "talk:selectedNickname"

.field private static final SELECTED_USERNAME_TAG:Ljava/lang/String; = "talk:selectedUsername"

.field private static final UNBLOCK_DIALOG:I = 0x1


# instance fields
.field private mAccountId:J

.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mAvatarDataColumn:I

.field private mAvatarHashColumn:I

.field private mCursor:Landroid/database/Cursor;

.field private mNicknameColumn:I

.field private mProviderId:J

.field private mSelectedNickname:Ljava/lang/String;

.field private mSelectedUsername:Ljava/lang/String;

.field private mUnblockDialogFormatString:Ljava/lang/String;

.field private mUsernameColumn:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-string v1, ""

    .line 39
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 56
    const-string v0, ""

    iput-object v1, p0, Lcom/google/android/talk/BlockedList;->mSelectedUsername:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v1, p0, Lcom/google/android/talk/BlockedList;->mSelectedNickname:Ljava/lang/String;

    .line 104
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/BlockedList;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget v0, p0, Lcom/google/android/talk/BlockedList;->mUsernameColumn:I

    return v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/BlockedList;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget v0, p0, Lcom/google/android/talk/BlockedList;->mNicknameColumn:I

    return v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/BlockedList;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/google/android/talk/BlockedList;->mProviderId:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/google/android/talk/BlockedList;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/google/android/talk/BlockedList;->mAccountId:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/google/android/talk/BlockedList;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget v0, p0, Lcom/google/android/talk/BlockedList;->mAvatarHashColumn:I

    return v0
.end method

.method static synthetic access$500(Lcom/google/android/talk/BlockedList;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget v0, p0, Lcom/google/android/talk/BlockedList;->mAvatarDataColumn:I

    return v0
.end method

.method static synthetic access$600(Lcom/google/android/talk/BlockedList;)Lcom/google/android/talk/TalkApp;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mApp:Lcom/google/android/talk/TalkApp;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/talk/BlockedList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BlockedList;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mSelectedUsername:Ljava/lang/String;

    return-object v0
.end method

.method private query()V
    .locals 5

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_0

    .line 86
    sget-object v0, Landroid/provider/Im$Contacts;->CONTENT_URI_BLOCKED_CONTACTS:Landroid/net/Uri;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "provider="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/talk/BlockedList;->mProviderId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND account="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/talk/BlockedList;->mAccountId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "nickname COLLATE UNICODE ASC"

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/google/android/talk/BlockedList;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    .line 91
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    const-string v1, "username"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/BlockedList;->mUsernameColumn:I

    .line 92
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    const-string v1, "nickname"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/BlockedList;->mNicknameColumn:I

    .line 93
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    const-string v1, "avatars_hash"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/BlockedList;->mAvatarHashColumn:I

    .line 94
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    const-string v1, "avatars_data"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/BlockedList;->mAvatarDataColumn:I

    .line 96
    :cond_0
    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 63
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 65
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BlockedList;->mApp:Lcom/google/android/talk/TalkApp;

    .line 66
    const v1, 0x7f060030

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BlockedList;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BlockedList;->setTitle(Ljava/lang/CharSequence;)V

    .line 68
    invoke-virtual {p0}, Lcom/google/android/talk/BlockedList;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 70
    .local v0, "extras":Landroid/os/Bundle;
    const-string v1, "providerId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/BlockedList;->mProviderId:J

    .line 71
    const-string v1, "accountId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/BlockedList;->mAccountId:J

    .line 73
    const v1, 0x7f060032

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BlockedList;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BlockedList;->mUnblockDialogFormatString:Ljava/lang/String;

    .line 75
    if-eqz p1, :cond_0

    .line 76
    const-string v1, "talk:selectedUsername"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BlockedList;->mSelectedUsername:Ljava/lang/String;

    .line 77
    const-string v1, "talk:selectedNickname"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BlockedList;->mSelectedNickname:Ljava/lang/String;

    .line 80
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/BlockedList;->query()V

    .line 81
    new-instance v1, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;

    iget-object v2, p0, Lcom/google/android/talk/BlockedList;->mCursor:Landroid/database/Cursor;

    invoke-direct {v1, p0, p0, v2}, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;-><init>(Lcom/google/android/talk/BlockedList;Landroid/content/Context;Landroid/database/Cursor;)V

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BlockedList;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 82
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 5
    .param p1, "id"    # I

    .prologue
    const/4 v2, 0x1

    .line 140
    if-ne p1, v2, :cond_0

    .line 141
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f060031

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/BlockedList;->mUnblockDialogFormatString:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/android/talk/BlockedList;->mSelectedNickname:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060034

    new-instance v2, Lcom/google/android/talk/BlockedList$2;

    invoke-direct {v2, p0}, Lcom/google/android/talk/BlockedList$2;-><init>(Lcom/google/android/talk/BlockedList;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060033

    new-instance v2, Lcom/google/android/talk/BlockedList$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/BlockedList$1;-><init>(Lcom/google/android/talk/BlockedList;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 165
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 179
    const v0, 0x7f0b0005

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/BlockedList;->mSelectedUsername:Ljava/lang/String;

    .line 180
    const v0, 0x7f0b0004

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/BlockedList;->mSelectedNickname:Ljava/lang/String;

    .line 181
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/talk/BlockedList;->showDialog(I)V

    .line 182
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    const/4 v1, 0x1

    .line 170
    invoke-super {p0, p1, p2}, Landroid/app/ListActivity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 171
    if-ne p1, v1, :cond_0

    .line 172
    check-cast p2, Landroid/app/AlertDialog;

    .end local p2    # "dialog":Landroid/app/Dialog;
    iget-object v0, p0, Lcom/google/android/talk/BlockedList;->mUnblockDialogFormatString:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/talk/BlockedList;->mSelectedNickname:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 175
    :cond_0
    return-void
.end method

.method public final onResume()V
    .locals 0

    .prologue
    .line 100
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 101
    invoke-direct {p0}, Lcom/google/android/talk/BlockedList;->query()V

    .line 102
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 133
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 134
    const-string v0, "talk:selectedUsername"

    iget-object v1, p0, Lcom/google/android/talk/BlockedList;->mSelectedUsername:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    const-string v0, "talk:selectedNickname"

    iget-object v1, p0, Lcom/google/android/talk/BlockedList;->mSelectedNickname:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method
