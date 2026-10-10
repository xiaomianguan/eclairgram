.class Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;
.super Ljava/lang/Object;
.source "SigningInActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/SigningInActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionErrorCallback"
.end annotation


# instance fields
.field private mError:Lcom/google/android/gtalkservice/ConnectionError;

.field final synthetic this$0:Lcom/google/android/talk/SigningInActivity;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/SigningInActivity;Lcom/google/android/gtalkservice/ConnectionError;)V
    .locals 0
    .param p2, "error"    # Lcom/google/android/gtalkservice/ConnectionError;

    .prologue
    .line 608
    iput-object p1, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 609
    iput-object p2, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->mError:Lcom/google/android/gtalkservice/ConnectionError;

    .line 610
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 613
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-virtual {v5}, Lcom/google/android/talk/SigningInActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 614
    .local v3, "r":Landroid/content/res/Resources;
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->mError:Lcom/google/android/gtalkservice/ConnectionError;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->mError:Lcom/google/android/gtalkservice/ConnectionError;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/ConnectionError;->getError()I

    move-result v5

    move v0, v5

    .line 615
    .local v0, "errorCode":I
    :goto_0
    const/4 v1, 0x1

    .line 617
    .local v1, "hideNetworkError":Z
    if-nez v0, :cond_3

    .line 618
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v5}, Lcom/google/android/talk/SigningInActivity;->access$400(Lcom/google/android/talk/SigningInActivity;)V

    .line 657
    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    .line 658
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v5}, Lcom/google/android/talk/SigningInActivity;->access$900(Lcom/google/android/talk/SigningInActivity;)V

    .line 660
    :cond_1
    return-void

    .line 614
    .end local v0    # "errorCode":I
    .end local v1    # "hideNetworkError":Z
    :cond_2
    const/4 v5, 0x0

    move v0, v5

    goto :goto_0

    .line 619
    .restart local v0    # "errorCode":I
    .restart local v1    # "hideNetworkError":Z
    :cond_3
    invoke-static {v0}, Lcom/google/android/gtalkservice/ConnectionError;->isNetworkError(I)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 621
    const/4 v2, 0x0

    .line 623
    .local v2, "noNetwork":Z
    const/4 v5, 0x1

    if-ne v0, v5, :cond_4

    .line 624
    const v4, 0x7f060066

    .line 625
    .local v4, "stringRes":I
    const/4 v2, 0x1

    .line 630
    :goto_2
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v5, v4}, Lcom/google/android/talk/SigningInActivity;->access$500(Lcom/google/android/talk/SigningInActivity;I)V

    .line 631
    const/4 v1, 0x0

    .line 634
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v5, v2}, Lcom/google/android/talk/SigningInActivity;->access$600(Lcom/google/android/talk/SigningInActivity;Z)V

    goto :goto_1

    .line 627
    .end local v4    # "stringRes":I
    :cond_4
    const v4, 0x7f060065

    .restart local v4    # "stringRes":I
    goto :goto_2

    .line 636
    .end local v2    # "noNetwork":Z
    .end local v4    # "stringRes":I
    :cond_5
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/google/android/talk/SigningInActivity;->access$702(Lcom/google/android/talk/SigningInActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 638
    packed-switch v0, :pswitch_data_0

    .line 652
    :goto_3
    :pswitch_0
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v5}, Lcom/google/android/talk/SigningInActivity;->access$700(Lcom/google/android/talk/SigningInActivity;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 653
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v5}, Lcom/google/android/talk/SigningInActivity;->access$800(Lcom/google/android/talk/SigningInActivity;)V

    goto :goto_1

    .line 640
    :pswitch_1
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    const v6, 0x7f060068

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/google/android/talk/SigningInActivity;->access$702(Lcom/google/android/talk/SigningInActivity;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3

    .line 644
    :pswitch_2
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    const v6, 0x7f060069

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/google/android/talk/SigningInActivity;->access$702(Lcom/google/android/talk/SigningInActivity;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3

    .line 648
    :pswitch_3
    iget-object v5, p0, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;->this$0:Lcom/google/android/talk/SigningInActivity;

    const v6, 0x7f06006a

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/google/android/talk/SigningInActivity;->access$702(Lcom/google/android/talk/SigningInActivity;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3

    .line 638
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method
