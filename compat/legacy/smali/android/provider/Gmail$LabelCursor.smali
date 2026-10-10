.class public final Landroid/provider/Gmail$LabelCursor;
.super Landroid/provider/Gmail$MailCursor;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "LabelCursor"
.end annotation


# instance fields
.field private mNameIndex:I

.field private mNumConversationsIndex:I

.field private mNumUnreadConversationsIndex:I

.field final synthetic this$0:Landroid/provider/Gmail;


# direct methods
.method private constructor <init>(Landroid/provider/Gmail;Ljava/lang/String;Landroid/database/Cursor;)V
    .registers 6
    .param p2, "account"    # Ljava/lang/String;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1247
    iput-object p1, p0, Landroid/provider/Gmail$LabelCursor;->this$0:Landroid/provider/Gmail;

    .line 1248
    invoke-direct {p0, p2, p3}, Landroid/provider/Gmail$MailCursor;-><init>(Ljava/lang/String;Landroid/database/Cursor;)V

    .line 1250
    iget-object v0, p0, Landroid/provider/Gmail$LabelCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "canonicalName"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$LabelCursor;->mNameIndex:I

    .line 1251
    iget-object v0, p0, Landroid/provider/Gmail$LabelCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "numConversations"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$LabelCursor;->mNumConversationsIndex:I

    .line 1253
    iget-object v0, p0, Landroid/provider/Gmail$LabelCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "numUnreadConversations"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$LabelCursor;->mNumUnreadConversationsIndex:I

    .line 1255
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1263
    iget v0, p0, Landroid/provider/Gmail$LabelCursor;->mNameIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$LabelCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNumConversations()I
    .registers 3

    .prologue
    .line 1272
    iget-object v0, p0, Landroid/provider/Gmail$LabelCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$LabelCursor;->mNumConversationsIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getNumUnreadConversations()I
    .registers 3

    .prologue
    .line 1281
    iget-object v0, p0, Landroid/provider/Gmail$LabelCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$LabelCursor;->mNumUnreadConversationsIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    return v0
.end method
