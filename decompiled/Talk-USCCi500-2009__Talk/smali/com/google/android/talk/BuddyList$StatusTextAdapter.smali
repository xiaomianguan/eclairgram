.class Lcom/google/android/talk/BuddyList$StatusTextAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StatusTextAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/widget/ArrayAdapter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mResource:I

.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/BuddyList;Landroid/content/Context;I[Ljava/lang/Object;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resource"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I[TT;)V"
        }
    .end annotation

    .prologue
    .line 1783
    .local p0, "this":Lcom/google/android/talk/BuddyList$StatusTextAdapter;, "Lcom/google/android/talk/BuddyList$StatusTextAdapter<TT;>;"
    .local p4, "objects":[Ljava/lang/Object;, "[TT;"
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->this$0:Lcom/google/android/talk/BuddyList;

    .line 1784
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 1785
    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 1787
    iput p3, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->mResource:I

    .line 1788
    return-void
.end method

.method private createStatusViewFromResource(ILandroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 15
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .param p4, "resource"    # I

    .prologue
    .local p0, "this":Lcom/google/android/talk/BuddyList$StatusTextAdapter;, "Lcom/google/android/talk/BuddyList$StatusTextAdapter<TT;>;"
    const/4 v14, 0x0

    const/4 v13, 0x0

    .line 1805
    if-nez p2, :cond_0

    .line 1806
    iget-object v10, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    move-object v0, v10

    move/from16 v1, p4

    move-object/from16 v2, p3

    move v3, v14

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v9

    .line 1811
    .local v9, "view":Landroid/view/View;
    :goto_0
    move-object v0, v9

    check-cast v0, Landroid/widget/TextView;

    move-object v8, v0

    .line 1813
    .local v8, "text":Landroid/widget/TextView;
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v5

    .line 1815
    .local v5, "item":Ljava/lang/Object;
    instance-of v10, v5, Landroid/text/SpannableString;

    if-eqz v10, :cond_1

    .line 1816
    invoke-virtual {v8, v13, v13, v13, v13}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 1817
    check-cast v5, Landroid/text/SpannableString;

    .end local v5    # "item":Ljava/lang/Object;
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1832
    :goto_1
    return-object v9

    .line 1808
    .end local v8    # "text":Landroid/widget/TextView;
    .end local v9    # "view":Landroid/view/View;
    :cond_0
    move-object/from16 v9, p2

    .restart local v9    # "view":Landroid/view/View;
    goto :goto_0

    .line 1818
    .restart local v5    # "item":Ljava/lang/Object;
    .restart local v8    # "text":Landroid/widget/TextView;
    :cond_1
    instance-of v10, v5, Lcom/google/android/talk/BuddyList$StatusItem;

    if-eqz v10, :cond_2

    .line 1819
    move-object v0, v5

    check-cast v0, Lcom/google/android/talk/BuddyList$StatusItem;

    move-object v7, v0

    .line 1820
    .local v7, "statusItem":Lcom/google/android/talk/BuddyList$StatusItem;
    iget-object v10, v7, Lcom/google/android/talk/BuddyList$StatusItem;->mSpannableString:Landroid/text/SpannableString;

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1823
    const/4 v6, 0x2

    .line 1824
    .local v6, "shiftHack":I
    iget-object v10, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-virtual {v10}, Lcom/google/android/talk/BuddyList;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget v11, v7, Lcom/google/android/talk/BuddyList$StatusItem;->mStatusResourceId:I

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 1825
    .local v4, "d":Landroid/graphics/drawable/Drawable;
    const/4 v10, 0x2

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v11

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v12

    add-int/lit8 v12, v12, 0x2

    invoke-virtual {v4, v14, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1826
    invoke-virtual {v8, v4, v13, v13, v13}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 1828
    .end local v4    # "d":Landroid/graphics/drawable/Drawable;
    .end local v6    # "shiftHack":I
    .end local v7    # "statusItem":Lcom/google/android/talk/BuddyList$StatusItem;
    :cond_2
    invoke-virtual {v8, v13, v13, v13, v13}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 1829
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1797
    .local p0, "this":Lcom/google/android/talk/BuddyList$StatusTextAdapter;, "Lcom/google/android/talk/BuddyList$StatusTextAdapter<TT;>;"
    iget v0, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->mResource:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->createStatusViewFromResource(ILandroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1792
    .local p0, "this":Lcom/google/android/talk/BuddyList$StatusTextAdapter;, "Lcom/google/android/talk/BuddyList$StatusTextAdapter<TT;>;"
    iget v0, p0, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->mResource:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->createStatusViewFromResource(ILandroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
