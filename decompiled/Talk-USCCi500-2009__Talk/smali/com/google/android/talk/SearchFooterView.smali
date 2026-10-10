.class public Lcom/google/android/talk/SearchFooterView;
.super Landroid/widget/LinearLayout;
.source "SearchFooterView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SearchFooterView$1;
    }
.end annotation


# instance fields
.field private mLoading:Landroid/view/View;

.field private mNetworkError:Landroid/view/View;

.field private mRetry:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    return-void
.end method


# virtual methods
.method public bind(Landroid/provider/Gmail$CursorStatus;Landroid/provider/Gmail$ConversationCursor;)V
    .locals 4
    .param p1, "cursorStatus"    # Landroid/provider/Gmail$CursorStatus;
    .param p2, "conversationCursor"    # Landroid/provider/Gmail$ConversationCursor;

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 56
    iget-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mRetry:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 58
    sget-object v0, Lcom/google/android/talk/SearchFooterView$1;->$SwitchMap$android$provider$Gmail$CursorStatus:[I

    invoke-virtual {p1}, Landroid/provider/Gmail$CursorStatus;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 70
    :goto_0
    return-void

    .line 60
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 62
    :pswitch_1
    iget-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mLoading:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 63
    iget-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mNetworkError:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 66
    :pswitch_2
    iget-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mNetworkError:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 67
    iget-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mLoading:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 58
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/talk/SearchFooterView;
    check-cast p0, Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {p0}, Landroid/provider/Gmail$ConversationCursor;->retry()V

    .line 45
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 37
    const v0, 0x7f0b0033

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchFooterView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mLoading:Landroid/view/View;

    .line 38
    const v0, 0x7f0b0031

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchFooterView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mNetworkError:Landroid/view/View;

    .line 39
    const v0, 0x7f0b0032

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchFooterView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mRetry:Landroid/view/View;

    .line 40
    iget-object v0, p0, Lcom/google/android/talk/SearchFooterView;->mRetry:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    return-void
.end method
