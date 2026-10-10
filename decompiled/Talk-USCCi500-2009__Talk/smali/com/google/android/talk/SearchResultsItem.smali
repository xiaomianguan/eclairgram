.class public Lcom/google/android/talk/SearchResultsItem;
.super Landroid/widget/LinearLayout;
.source "SearchResultsItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SearchResultsItem$1;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "talk"


# instance fields
.field private mDate:Landroid/widget/TextView;

.field private mPersonalLevel:Landroid/widget/ImageView;

.field private mSender:Landroid/widget/TextView;

.field private mSnippet:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 49
    const v0, 0x7f0b0036

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchResultsItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/SearchResultsItem;->mSender:Landroid/widget/TextView;

    .line 50
    const v0, 0x7f0b002d

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchResultsItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/SearchResultsItem;->mTitle:Landroid/widget/TextView;

    .line 51
    const v0, 0x7f0b0034

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchResultsItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/SearchResultsItem;->mSnippet:Landroid/widget/TextView;

    .line 52
    const v0, 0x7f0b0037

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchResultsItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/SearchResultsItem;->mDate:Landroid/widget/TextView;

    .line 53
    const v0, 0x7f0b0035

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchResultsItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/google/android/talk/SearchResultsItem;->mPersonalLevel:Landroid/widget/ImageView;

    .line 54
    return-void
.end method


# virtual methods
.method public final bind(Landroid/content/Context;Landroid/provider/Gmail$ConversationCursor;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/provider/Gmail$ConversationCursor;

    .prologue
    .line 57
    iget-object v8, p0, Lcom/google/android/talk/SearchResultsItem;->mTitle:Landroid/widget/TextView;

    if-nez v8, :cond_0

    .line 58
    invoke-direct {p0}, Lcom/google/android/talk/SearchResultsItem;->init()V

    .line 60
    :cond_0
    invoke-virtual {p2}, Landroid/provider/Gmail$ConversationCursor;->getAccount()Ljava/lang/String;

    move-result-object v5

    .line 61
    .local v5, "sender":Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/google/android/talk/SearchResultsItem;->mSender:Landroid/widget/TextView;

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    invoke-virtual {p2}, Landroid/provider/Gmail$ConversationCursor;->getSubject()Ljava/lang/String;

    move-result-object v7

    .line 64
    .local v7, "subject":Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/google/android/talk/SearchResultsItem;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    invoke-virtual {p2}, Landroid/provider/Gmail$ConversationCursor;->getSnippet()Ljava/lang/String;

    move-result-object v6

    .line 67
    .local v6, "snippet":Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/google/android/talk/SearchResultsItem;->mSnippet:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    invoke-virtual {p2}, Landroid/provider/Gmail$ConversationCursor;->getDateMs()J

    move-result-wide v0

    .line 70
    .local v0, "dateMs":J
    invoke-virtual {p0}, Lcom/google/android/talk/SearchResultsItem;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v0, v1}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(Landroid/content/Context;J)Ljava/lang/CharSequence;

    move-result-object v2

    .line 71
    .local v2, "dateText":Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/google/android/talk/SearchResultsItem;->mDate:Landroid/widget/TextView;

    invoke-virtual {v8, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    invoke-virtual {p2}, Landroid/provider/Gmail$ConversationCursor;->getPersonalLevel()Landroid/provider/Gmail$PersonalLevel;

    move-result-object v4

    .line 74
    .local v4, "personalLevel":Landroid/provider/Gmail$PersonalLevel;
    const/4 v3, 0x0

    .line 75
    .local v3, "icon":I
    sget-object v8, Lcom/google/android/talk/SearchResultsItem$1;->$SwitchMap$android$provider$Gmail$PersonalLevel:[I

    invoke-virtual {v4}, Landroid/provider/Gmail$PersonalLevel;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 88
    :goto_0
    iget-object v8, p0, Lcom/google/android/talk/SearchResultsItem;->mPersonalLevel:Landroid/widget/ImageView;

    invoke-virtual {v8, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 89
    return-void

    .line 81
    :pswitch_0
    const v3, 0x7f02001f

    .line 82
    goto :goto_0

    .line 85
    :pswitch_1
    const v3, 0x7f02001e

    goto :goto_0

    .line 75
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
