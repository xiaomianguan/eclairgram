.class public Lcom/google/android/talk/SearchConversationView;
.super Landroid/app/ListActivity;
.source "SearchConversationView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SearchConversationView$3;,
        Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;,
        Lcom/google/android/talk/SearchConversationView$ConversationContentObserver;
    }
.end annotation


# static fields
.field public static final EXTRA_ACCOUNT:Ljava/lang/String; = "account"

.field public static final EXTRA_CONVERSATION_ID:Ljava/lang/String; = "thread-id"


# instance fields
.field private mAccount:Ljava/lang/String;

.field private mContentObserver:Landroid/database/ContentObserver;

.field private mConversationId:J

.field private mGmail:Landroid/provider/Gmail;

.field private mHandler:Landroid/os/Handler;

.field private mLoaded:Z

.field private mMessageCursor:Landroid/provider/Gmail$MessageCursor;

.field private mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

.field private mSearchMessageAdapter:Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 83
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/SearchConversationView;->mLoaded:Z

    .line 223
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/SearchConversationView;->mHandler:Landroid/os/Handler;

    .line 225
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/SearchConversationView;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchConversationView;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/android/talk/SearchConversationView;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/SearchConversationView;)Landroid/provider/Gmail$MessageCursor;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchConversationView;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/android/talk/SearchConversationView;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/SearchConversationView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchConversationView;

    .prologue
    .line 83
    iget-boolean v0, p0, Lcom/google/android/talk/SearchConversationView;->mLoaded:Z

    return v0
.end method

.method static synthetic access$300(Lcom/google/android/talk/SearchConversationView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchConversationView;

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/google/android/talk/SearchConversationView;->buildConversationIfLoaded()V

    return-void
.end method

.method private buildConversationIfLoaded()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 169
    iget-object v1, p0, Lcom/google/android/talk/SearchConversationView;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    .line 170
    .local v1, "messageCursor":Landroid/provider/Gmail$MessageCursor;
    invoke-virtual {v1}, Landroid/provider/Gmail$MessageCursor;->count()I

    move-result v0

    .line 172
    .local v0, "count":I
    invoke-virtual {v1}, Landroid/provider/Gmail$MessageCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v2

    .line 174
    .local v2, "status":Landroid/provider/Gmail$CursorStatus;
    sget-object v3, Lcom/google/android/talk/SearchConversationView$3;->$SwitchMap$android$provider$Gmail$CursorStatus:[I

    invoke-virtual {v1}, Landroid/provider/Gmail$MessageCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v4

    invoke-virtual {v4}, Landroid/provider/Gmail$CursorStatus;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 194
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mSearchMessageAdapter:Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;

    invoke-virtual {v3, v1}, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->changeCursor(Landroid/provider/Gmail$MessageCursor;)V

    .line 196
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/google/android/talk/SearchConversationView;->mLoaded:Z

    .line 197
    :cond_1
    :goto_1
    return-void

    .line 177
    :pswitch_0
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    if-nez v3, :cond_1

    .line 178
    new-instance v3, Lcom/google/android/talk/NetworkProgressMonitor;

    invoke-direct {v3, p0, v5}, Lcom/google/android/talk/NetworkProgressMonitor;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    .line 179
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    const/4 v4, 0x0

    invoke-interface {v3, v5, v4}, Lcom/google/android/talk/IProgressMonitor;->beginTask(Ljava/lang/CharSequence;I)V

    goto :goto_1

    .line 184
    :pswitch_1
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    if-eqz v3, :cond_0

    .line 185
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    invoke-interface {v3}, Lcom/google/android/talk/IProgressMonitor;->done()V

    .line 186
    iput-object v5, p0, Lcom/google/android/talk/SearchConversationView;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    goto :goto_0

    .line 190
    :pswitch_2
    invoke-direct {p0}, Lcom/google/android/talk/SearchConversationView;->showRetryAlert()V

    goto :goto_0

    .line 174
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private showRetryAlert()V
    .locals 4

    .prologue
    .line 200
    new-instance v0, Lcom/google/android/talk/SearchConversationView$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/SearchConversationView$1;-><init>(Lcom/google/android/talk/SearchConversationView;)V

    .line 207
    .local v0, "buttonListener":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Lcom/google/android/talk/SearchConversationView$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/SearchConversationView$2;-><init>(Lcom/google/android/talk/SearchConversationView;)V

    .line 213
    .local v1, "cancelListener":Landroid/content/DialogInterface$OnCancelListener;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f060090

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f060091

    invoke-virtual {v2, v3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 218
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    .line 107
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 109
    invoke-virtual {p0}, Lcom/google/android/talk/SearchConversationView;->getWindow()Landroid/view/Window;

    move-result-object v2

    .line 110
    .local v2, "window":Landroid/view/Window;
    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/view/Window;->requestFeature(I)Z

    .line 111
    const v3, 0x7f030011

    invoke-virtual {p0, v3}, Lcom/google/android/talk/SearchConversationView;->setContentView(I)V

    .line 115
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 117
    invoke-virtual {p0}, Lcom/google/android/talk/SearchConversationView;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 118
    .local v1, "extras":Landroid/os/Bundle;
    const-string v3, "account"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mAccount:Ljava/lang/String;

    .line 119
    const-string v3, "thread-id"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/google/android/talk/SearchConversationView;->mConversationId:J

    .line 121
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    .line 122
    .local v0, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGmailProvider()Landroid/provider/Gmail;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mGmail:Landroid/provider/Gmail;

    .line 124
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mGmail:Landroid/provider/Gmail;

    iget-object v4, p0, Lcom/google/android/talk/SearchConversationView;->mAccount:Ljava/lang/String;

    iget-wide v5, p0, Lcom/google/android/talk/SearchConversationView;->mConversationId:J

    invoke-virtual {v3, v4, v5, v6}, Landroid/provider/Gmail;->getMessageCursorForConversationId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    .line 125
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v3}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/android/talk/SearchConversationView;->startManagingCursor(Landroid/database/Cursor;)V

    .line 127
    new-instance v3, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;

    iget-object v4, p0, Lcom/google/android/talk/SearchConversationView;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-direct {v3, p0, p0, v4}, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;-><init>(Lcom/google/android/talk/SearchConversationView;Landroid/app/Activity;Landroid/provider/Gmail$MessageCursor;)V

    iput-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mSearchMessageAdapter:Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;

    .line 128
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mSearchMessageAdapter:Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;

    invoke-virtual {p0, v3}, Lcom/google/android/talk/SearchConversationView;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 132
    new-instance v3, Lcom/google/android/talk/SearchConversationView$ConversationContentObserver;

    invoke-direct {v3, p0}, Lcom/google/android/talk/SearchConversationView$ConversationContentObserver;-><init>(Lcom/google/android/talk/SearchConversationView;)V

    iput-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mContentObserver:Landroid/database/ContentObserver;

    .line 133
    iget-object v3, p0, Lcom/google/android/talk/SearchConversationView;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    iget-object v4, p0, Lcom/google/android/talk/SearchConversationView;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/provider/Gmail$MessageCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 134
    return-void
.end method
