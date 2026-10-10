.class Lcom/google/android/talk/ChatView$MessageItem;
.super Landroid/widget/LinearLayout;
.source "ChatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageItem"
.end annotation


# instance fields
.field public mBold:Landroid/text/style/StyleSpan;

.field public mDateFormat:Ljava/text/DateFormat;

.field public mDateFormatStr:Ljava/lang/String;

.field public mMessageView:Landroid/widget/TextView;

.field public mSB:Landroid/text/SpannableStringBuilder;

.field public mShowPlainText:Z

.field public mStringBuilder:Ljava/lang/StringBuilder;

.field public mTimeStampView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;)V
    .locals 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 789
    iput-object p1, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    .line 790
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 780
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mStringBuilder:Ljava/lang/StringBuilder;

    .line 781
    new-instance v0, Landroid/text/style/StyleSpan;

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mBold:Landroid/text/style/StyleSpan;

    .line 782
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    .line 791
    invoke-virtual {p0, v2}, Lcom/google/android/talk/ChatView$MessageItem;->setOrientation(I)V

    .line 793
    invoke-static {p1}, Lcom/google/android/talk/ChatView;->access$3100(Lcom/google/android/talk/ChatView;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030005

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 795
    const v0, 0x7f0b0010

    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView$MessageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    .line 796
    const v0, 0x7f0b0011

    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView$MessageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mTimeStampView:Landroid/widget/TextView;

    .line 798
    const v0, 0x7f02000b

    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView$MessageItem;->setBackgroundResource(I)V

    .line 799
    iget-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mDateFormat:Ljava/text/DateFormat;

    .line 800
    invoke-static {p1}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060050

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mDateFormatStr:Ljava/lang/String;

    .line 801
    return-void
.end method

.method private hideExtraPictures(I)V
    .locals 4
    .param p1, "start"    # I

    .prologue
    .line 1247
    :goto_0
    new-instance v2, Ljava/lang/Integer;

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "start":I
    .local v1, "start":I
    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 1248
    .local v2, "tag":Ljava/lang/Integer;
    invoke-virtual {p0, v2}, Lcom/google/android/talk/ChatView$MessageItem;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 1249
    .local v0, "pictureView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1250
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1252
    :cond_0
    if-nez v0, :cond_1

    .line 1253
    return-void

    :cond_1
    move p1, v1

    .end local v1    # "start":I
    .restart local p1    # "start":I
    goto :goto_0
.end method

.method private hidePicture(I)V
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 1235
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 1236
    .local v1, "tag":Ljava/lang/Integer;
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView$MessageItem;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 1237
    .local v0, "pictureView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1238
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1240
    :cond_0
    return-void
.end method

.method private inflatePictureView(I)Landroid/view/View;
    .locals 13
    .param p1, "pos"    # I

    .prologue
    const-string v12, " pictureView: "

    const-string v11, " getTag: "

    .line 1103
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v4

    .line 1105
    .local v4, "logModeDebug":Z
    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 1106
    .local v7, "tag":Ljava/lang/Integer;
    invoke-virtual {p0, v7}, Lcom/google/android/talk/ChatView$MessageItem;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    .line 1107
    .local v5, "pictureView":Landroid/view/View;
    if-eqz v4, :cond_0

    .line 1108
    iget-object v8, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "inflatePictureView looking for tag: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " this: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 1110
    :cond_0
    if-eqz v5, :cond_2

    .line 1111
    if-eqz v4, :cond_1

    .line 1112
    iget-object v8, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "inflatePictureView found view with tag: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " getTag: "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " pictureView: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    :cond_1
    move-object v6, v5

    .line 1139
    .end local v5    # "pictureView":Landroid/view/View;
    .local v6, "pictureView":Landroid/view/View;
    :goto_0
    return-object v6

    .line 1117
    .end local v6    # "pictureView":Landroid/view/View;
    .restart local v5    # "pictureView":Landroid/view/View;
    :cond_2
    iget-object v8, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v8}, Lcom/google/android/talk/ChatView;->access$3100(Lcom/google/android/talk/ChatView;)Landroid/view/LayoutInflater;

    move-result-object v8

    const v9, 0x7f03000c

    const/4 v10, 0x1

    invoke-virtual {v8, v9, p0, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 1118
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView$MessageItem;->getChildCount()I

    move-result v1

    .line 1119
    .local v1, "childCount":I
    const/4 v2, 0x0

    .line 1120
    .local v2, "found":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_3

    .line 1121
    invoke-virtual {p0, v3}, Lcom/google/android/talk/ChatView$MessageItem;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1122
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v8

    const v9, 0x7f0b0024

    if-ne v8, v9, :cond_5

    .line 1123
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_5

    .line 1124
    const/4 v2, 0x1

    .line 1125
    move-object v5, v0

    .line 1126
    invoke-virtual {v5, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1132
    .end local v0    # "child":Landroid/view/View;
    :cond_3
    if-eqz v4, :cond_4

    .line 1133
    iget-object v8, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "inflatePictureView had to inflate view. found: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " CREATED tag: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " getTag: "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " pictureView: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 1137
    :cond_4
    const/4 v8, 0x0

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    move-object v6, v5

    .line 1139
    .end local v5    # "pictureView":Landroid/view/View;
    .restart local v6    # "pictureView":Landroid/view/View;
    goto :goto_0

    .line 1120
    .end local v6    # "pictureView":Landroid/view/View;
    .restart local v0    # "child":Landroid/view/View;
    .restart local v5    # "pictureView":Landroid/view/View;
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private setPicture(Lcom/google/android/talk/PictureCache$PictureData;Landroid/widget/ImageView;)V
    .locals 17
    .param p1, "pictureData"    # Lcom/google/android/talk/PictureCache$PictureData;
    .param p2, "pictureView"    # Landroid/widget/ImageView;

    .prologue
    .line 1175
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 1176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v12, v0

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "setPicture pictureData: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object v0, v13

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " desc: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/PictureCache$PictureData;->getDescription()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 1181
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    .line 1182
    .local v6, "parentView":Landroid/view/View;
    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1184
    const v12, 0x102000d

    invoke-virtual {v6, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 1185
    .local v9, "progress":Landroid/widget/ImageView;
    const/16 v12, 0x8

    invoke-virtual {v9, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1187
    const v12, 0x7f0b0025

    invoke-virtual {v6, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 1188
    .local v7, "pictureBlock":Landroid/view/View;
    const/4 v12, 0x0

    invoke-virtual {v7, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1190
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v12

    move-object/from16 v0, p2

    move-object v1, v12

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1193
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/PictureCache$PictureData;->getDescription()Ljava/lang/String;

    move-result-object v3

    .line 1194
    .local v3, "desc":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_4

    const/4 v12, 0x1

    move v4, v12

    .line 1195
    .local v4, "haveDesc":Z
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/PictureCache$PictureData;->getTitle()Ljava/lang/String;

    move-result-object v10

    .line 1196
    .local v10, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    invoke-virtual {v12}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 1197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    invoke-virtual {v12}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 1199
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 1200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    invoke-virtual {v12, v10}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    new-instance v13, Landroid/text/style/ForegroundColorSpan;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v14, v0

    invoke-static {v14}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f050009

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    move-result v14

    invoke-direct {v13, v14}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v15, v0

    invoke-virtual {v15}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v15

    const/16 v16, 0x21

    invoke-virtual/range {v12 .. v16}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1205
    if-eqz v4, :cond_1

    .line 1206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    const-string v13, "\n"

    invoke-virtual {v12, v13}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1209
    :cond_1
    if-eqz v4, :cond_2

    .line 1210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    invoke-virtual {v12, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1213
    :cond_2
    const v12, 0x7f0b0028

    invoke-virtual {v6, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 1214
    .local v8, "pictureInfo":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    move-object v12, v0

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1217
    const/4 v5, 0x0

    .line 1218
    .local v5, "iconId":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/PictureCache$PictureData;->getType()I

    move-result v11

    .line 1219
    .local v11, "type":I
    const/4 v12, 0x4

    if-ne v11, v12, :cond_5

    .line 1220
    const v5, 0x7f020018

    .line 1226
    :cond_3
    :goto_1
    const v12, 0x7f0b0027

    invoke-virtual {v6, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1227
    .local v2, "badge":Landroid/widget/ImageView;
    if-eqz v5, :cond_7

    .line 1228
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1232
    :goto_2
    return-void

    .line 1194
    .end local v2    # "badge":Landroid/widget/ImageView;
    .end local v4    # "haveDesc":Z
    .end local v5    # "iconId":I
    .end local v8    # "pictureInfo":Landroid/widget/TextView;
    .end local v10    # "title":Ljava/lang/String;
    .end local v11    # "type":I
    :cond_4
    const/4 v12, 0x0

    move v4, v12

    goto/16 :goto_0

    .line 1221
    .restart local v4    # "haveDesc":Z
    .restart local v5    # "iconId":I
    .restart local v8    # "pictureInfo":Landroid/widget/TextView;
    .restart local v10    # "title":Ljava/lang/String;
    .restart local v11    # "type":I
    :cond_5
    const/4 v12, 0x3

    if-ne v11, v12, :cond_6

    .line 1222
    const v5, 0x7f020041

    goto :goto_1

    .line 1223
    :cond_6
    const/4 v12, 0x2

    if-ne v11, v12, :cond_3

    .line 1224
    const v5, 0x7f02004b

    goto :goto_1

    .line 1230
    .restart local v2    # "badge":Landroid/widget/ImageView;
    :cond_7
    const/4 v12, 0x0

    invoke-virtual {v2, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2
.end method

.method private showPictures(Ljava/lang/CharSequence;)V
    .locals 13
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v2, 0x0

    .line 1143
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v9

    .line 1144
    .local v9, "logModeDebug":Z
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView$MessageItem;->getMessageLinks()[Landroid/text/style/URLSpan;

    move-result-object v8

    .line 1146
    .local v8, "links":[Landroid/text/style/URLSpan;
    array-length v7, v8

    .line 1147
    .local v7, "len":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v7, :cond_3

    .line 1148
    aget-object v12, v8, v6

    .line 1149
    .local v12, "urlSpan":Landroid/text/style/URLSpan;
    invoke-virtual {v12}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v1

    .line 1151
    .local v1, "pictureUrl":Ljava/lang/String;
    invoke-static {v1}, Lcom/google/android/talk/PictureCache;->allowScraping(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1152
    iget-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$4300(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/PictureCache;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v3}, Lcom/google/android/talk/ChatView;->access$4200(Lcom/google/android/talk/ChatView;)Landroid/os/Handler;

    move-result-object v4

    const/4 v5, 0x0

    move v3, v2

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/talk/PictureCache;->getPictureDataIfInCache(Ljava/lang/String;IILandroid/os/Handler;Lcom/google/android/talk/PictureCache$PictureData;)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v10

    .line 1159
    .local v10, "pictureData":Lcom/google/android/talk/PictureCache$PictureData;
    if-eqz v9, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "showPictures pictureData: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 1161
    :cond_0
    if-eqz v10, :cond_1

    invoke-virtual {v10}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1162
    invoke-direct {p0, v6}, Lcom/google/android/talk/ChatView$MessageItem;->inflatePictureView(I)Landroid/view/View;

    move-result-object v11

    .line 1163
    .local v11, "pictureView":Landroid/view/View;
    const v0, 0x7f0b0026

    invoke-virtual {v11, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-direct {p0, v10, v0}, Lcom/google/android/talk/ChatView$MessageItem;->setPicture(Lcom/google/android/talk/PictureCache$PictureData;Landroid/widget/ImageView;)V

    .line 1147
    .end local v10    # "pictureData":Lcom/google/android/talk/PictureCache$PictureData;
    .end local v11    # "pictureView":Landroid/view/View;
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1165
    .restart local v10    # "pictureData":Lcom/google/android/talk/PictureCache$PictureData;
    :cond_1
    invoke-direct {p0, v6}, Lcom/google/android/talk/ChatView$MessageItem;->hidePicture(I)V

    goto :goto_1

    .line 1168
    .end local v10    # "pictureData":Lcom/google/android/talk/PictureCache$PictureData;
    :cond_2
    invoke-direct {p0, v6}, Lcom/google/android/talk/ChatView$MessageItem;->hidePicture(I)V

    goto :goto_1

    .line 1171
    .end local v1    # "pictureUrl":Ljava/lang/String;
    .end local v12    # "urlSpan":Landroid/text/style/URLSpan;
    :cond_3
    invoke-direct {p0, v7}, Lcom/google/android/talk/ChatView$MessageItem;->hideExtraPictures(I)V

    .line 1172
    return-void
.end method


# virtual methods
.method public appendGroupChatConversionMessage(J)V
    .locals 7
    .param p1, "date"    # J

    .prologue
    const/4 v6, 0x0

    .line 960
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v2}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06004d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 962
    .local v0, "body":Ljava/lang/CharSequence;
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 963
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 964
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 966
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 968
    .local v1, "len":I
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050002

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v4, 0x21

    invoke-virtual {v2, v3, v6, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 971
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v2, p1, p2, v6}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 972
    return-void
.end method

.method appendInboxMessage(Ljava/lang/String;Ljava/lang/String;JZLandroid/database/Cursor;)V
    .locals 6
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "date"    # J
    .param p5, "showTimeStamp"    # Z
    .param p6, "c"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, 0x0

    .line 889
    iget-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mStringBuilder:Ljava/lang/StringBuilder;

    .line 890
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 891
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 892
    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 893
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 895
    .local v1, "namePortionLength":I
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 897
    iget-boolean v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-eqz v2, :cond_0

    .line 898
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3, p4, v5}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 908
    :goto_0
    return-void

    .line 900
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 901
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 902
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 904
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    iget-object v3, p0, Lcom/google/android/talk/ChatView$MessageItem;->mBold:Landroid/text/style/StyleSpan;

    const/16 v4, 0x21

    invoke-virtual {v2, v3, v5, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 906
    iget-object v2, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v2, p3, p4, p5}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    goto :goto_0
.end method

.method appendMessage(Ljava/lang/CharSequence;JZ)V
    .locals 10
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "date"    # J
    .param p4, "showTimeStamp"    # Z

    .prologue
    const/4 v9, 0x0

    .line 1076
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3800(Lcom/google/android/talk/ChatView;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3900(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move v2, v5

    .line 1077
    .local v2, "textColor":I
    :goto_0
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1078
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mTimeStampView:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v6}, Lcom/google/android/talk/ChatView;->access$4000(Lcom/google/android/talk/ChatView;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1080
    iget-boolean v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-eqz v5, :cond_1

    .line 1081
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setAutoLinkMask(I)V

    .line 1082
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1100
    :goto_1
    return-void

    .line 1076
    .end local v2    # "textColor":I
    :cond_0
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$4000(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move v2, v5

    goto :goto_0

    .line 1084
    .restart local v2    # "textColor":I
    :cond_1
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    const/16 v6, 0xf

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setAutoLinkMask(I)V

    .line 1085
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v6}, Lcom/google/android/talk/ChatView;->access$4100(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/util/Markup;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/google/android/talk/util/Markup;->markup(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    sget-object v7, Landroid/widget/TextView$BufferType;->EDITABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v5, v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 1087
    if-eqz p4, :cond_2

    .line 1089
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 1090
    .local v0, "date2":Ljava/util/Date;
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mDateFormat:Ljava/text/DateFormat;

    invoke-virtual {v5, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 1091
    .local v4, "timeStr":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mDateFormatStr:Ljava/lang/String;

    invoke-static {v5, v0}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Date;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 1092
    .local v1, "dateStr":Ljava/lang/CharSequence;
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f06004f

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v9

    const/4 v8, 0x1

    aput-object v1, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1093
    .local v3, "timeStampStr":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mTimeStampView:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1094
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mTimeStampView:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1098
    .end local v0    # "date2":Ljava/util/Date;
    .end local v1    # "dateStr":Ljava/lang/CharSequence;
    .end local v3    # "timeStampStr":Ljava/lang/String;
    .end local v4    # "timeStr":Ljava/lang/String;
    :goto_2
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatView$MessageItem;->showPictures(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1096
    :cond_2
    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->mTimeStampView:Landroid/widget/TextView;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2
.end method

.method public appendOffTheRecordStatus(Ljava/lang/String;JZ)V
    .locals 7
    .param p1, "body"    # Ljava/lang/String;
    .param p2, "date"    # J
    .param p4, "showTimeStamp"    # Z

    .prologue
    const/16 v6, 0x21

    const/4 v5, 0x0

    .line 1052
    iget-boolean v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-eqz v1, :cond_0

    .line 1053
    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 1073
    :goto_0
    return-void

    .line 1055
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 1056
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 1057
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1059
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1061
    .local v0, "len":I
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    iget-object v3, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v3}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050004

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v1, v2, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1064
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/StyleSpan;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v1, v2, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1067
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3f4ccccd    # 0.8f

    invoke-direct {v2, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v1, v2, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1071
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v1, p2, p3, p4}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    goto :goto_0
.end method

.method public appendPresenceUpdates(Ljava/lang/String;IJ)V
    .locals 10
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "type"    # I
    .param p3, "date"    # J

    .prologue
    const/16 v9, 0x21

    const/4 v8, 0x0

    .line 977
    packed-switch p2, :pswitch_data_0

    .line 991
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3300(Lcom/google/android/talk/ChatView;)Z

    move-result v5

    if-eqz v5, :cond_2

    const v5, 0x7f060048

    :goto_0
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 995
    .local v0, "body":Ljava/lang/CharSequence;
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 997
    .local v3, "sb":Ljava/lang/StringBuilder;
    iget-boolean v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-nez v4, :cond_0

    .line 998
    new-instance v1, Ljava/util/Formatter;

    invoke-direct {v1, v3}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;)V

    .line 999
    .local v1, "formatter":Ljava/util/Formatter;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v8

    invoke-virtual {v1, v4, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 1002
    .end local v1    # "formatter":Ljava/util/Formatter;
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1004
    iget-boolean v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-eqz v4, :cond_3

    .line 1005
    invoke-virtual {p0, v0, p3, p4, v8}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 1025
    :goto_2
    return-void

    .line 979
    .end local v0    # "body":Ljava/lang/CharSequence;
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    :pswitch_0
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3300(Lcom/google/android/talk/ChatView;)Z

    move-result v5

    if-eqz v5, :cond_1

    const v5, 0x7f060047

    :goto_3
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 980
    .restart local v0    # "body":Ljava/lang/CharSequence;
    goto :goto_1

    .line 979
    .end local v0    # "body":Ljava/lang/CharSequence;
    :cond_1
    const v5, 0x7f060049

    goto :goto_3

    .line 983
    :pswitch_1
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f06004a

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 984
    .restart local v0    # "body":Ljava/lang/CharSequence;
    goto :goto_1

    .line 987
    .end local v0    # "body":Ljava/lang/CharSequence;
    :pswitch_2
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f06004b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 988
    .restart local v0    # "body":Ljava/lang/CharSequence;
    goto :goto_1

    .line 991
    .end local v0    # "body":Ljava/lang/CharSequence;
    :cond_2
    const v5, 0x7f06004c

    goto :goto_0

    .line 1007
    .restart local v0    # "body":Ljava/lang/CharSequence;
    .restart local v3    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 1008
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 1009
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v4, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1011
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 1013
    .local v2, "len":I
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v6}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f050002

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v4, v5, v8, v2, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1016
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v5, Landroid/text/style/StyleSpan;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v4, v5, v8, v2, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1019
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x3f4ccccd    # 0.8f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v4, v5, v8, v2, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1023
    iget-object v4, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v4, p3, p4, v8}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    goto/16 :goto_2

    .line 977
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method appendSentMessage(Ljava/lang/String;JZI)V
    .locals 10
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "date"    # J
    .param p4, "showTimeStamp"    # Z
    .param p5, "errorCode"    # I

    .prologue
    .line 911
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v6}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060041

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 912
    .local v3, "meString":Ljava/lang/CharSequence;
    iget-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mStringBuilder:Ljava/lang/StringBuilder;

    .line 913
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 914
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 915
    const/16 v6, 0x20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 916
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    .line 917
    .local v4, "namePortionLength":I
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 919
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v5

    .line 920
    .local v5, "offset":I
    const/4 v1, 0x0

    .line 923
    .local v1, "errorOffset":I
    if-lez p5, :cond_0

    .line 924
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 925
    const-string v6, "\n"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 926
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v6}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f060058

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 929
    :cond_0
    iget-boolean v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-eqz v6, :cond_1

    .line 930
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {p0, v6, p2, p3, v7}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 957
    :goto_0
    return-void

    .line 932
    :cond_1
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 933
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 934
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v6, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 935
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    iget-object v7, p0, Lcom/google/android/talk/ChatView$MessageItem;->mBold:Landroid/text/style/StyleSpan;

    const/4 v8, 0x0

    const/16 v9, 0x21

    invoke-virtual {v6, v7, v8, v4, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 937
    if-lez p5, :cond_2

    .line 938
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 940
    .local v2, "length":I
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    iget-object v8, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v8}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f050003

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    invoke-direct {v7, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v8, 0x21

    invoke-virtual {v6, v7, v5, v2, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 943
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v7, Landroid/text/style/StyleSpan;

    const/4 v8, 0x2

    invoke-direct {v7, v8}, Landroid/text/style/StyleSpan;-><init>(I)V

    const/16 v8, 0x21

    invoke-virtual {v6, v7, v5, v2, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 947
    if-lez v1, :cond_2

    .line 948
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v7, Landroid/text/style/RelativeSizeSpan;

    const v8, 0x3f4ccccd    # 0.8f

    invoke-direct {v7, v8}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v8, 0x21

    invoke-virtual {v6, v7, v1, v2, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 954
    .end local v2    # "length":I
    :cond_2
    iget-object v6, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v6, p2, p3, p4}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 955
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/android/talk/ChatView$MessageItem;->updateBackgroundColor(I)V

    goto :goto_0
.end method

.method public appendStatusMessage(Ljava/lang/String;J)V
    .locals 7
    .param p1, "body"    # Ljava/lang/String;
    .param p2, "date"    # J

    .prologue
    const/16 v6, 0x21

    const/4 v5, 0x0

    .line 1028
    iget-boolean v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    if-eqz v1, :cond_0

    .line 1029
    invoke-virtual {p0, p1, p2, p3, v5}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    .line 1049
    :goto_0
    return-void

    .line 1031
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 1032
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 1033
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1035
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1037
    .local v0, "len":I
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    iget-object v3, p0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v3}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050004

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v1, v2, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1040
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/StyleSpan;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v1, v2, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1043
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3f4ccccd    # 0.8f

    invoke-direct {v2, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v1, v2, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1047
    iget-object v1, p0, Lcom/google/android/talk/ChatView$MessageItem;->mSB:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v1, p2, p3, v5}, Lcom/google/android/talk/ChatView$MessageItem;->appendMessage(Ljava/lang/CharSequence;JZ)V

    goto :goto_0
.end method

.method public bind(Landroid/database/Cursor;Z)V
    .locals 22
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "showPlainText"    # Z

    .prologue
    .line 808
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    .line 810
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$1600(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 811
    .local v8, "date":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$1700(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 812
    .local v21, "type":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$1500(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 813
    .local v7, "body":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3300(Lcom/google/android/talk/ChatView;)Z

    move-result v5

    if-eqz v5, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/ChatView;->access$1400(Lcom/google/android/talk/ChatView;)I

    move-result v6

    move-object/from16 v0, p1

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/google/android/talk/ChatView;->access$3400(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v6, v5

    .line 815
    .local v6, "nickname":Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$1800(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v17

    .line 816
    .local v17, "alwaysDisplayTs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$2000(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v19

    .line 817
    .local v19, "delta":J
    const/4 v5, 0x1

    move/from16 v0, v17

    move v1, v5

    if-eq v0, v1, :cond_0

    const-wide/32 v11, 0xea60

    cmp-long v5, v19, v11

    if-lez v5, :cond_5

    :cond_0
    const/4 v5, 0x1

    move v10, v5

    .line 822
    .local v10, "showTimeStamp":Z
    :goto_1
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getPosition()I

    move-result v5

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v11

    const/4 v12, 0x1

    sub-int/2addr v11, v12

    if-ne v5, v11, :cond_2

    .line 823
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 824
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "delta = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object v0, v11

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", showTs="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v11}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 826
    :cond_1
    if-nez v10, :cond_6

    .line 827
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    const-wide/32 v11, 0xea60

    invoke-static {v5, v11, v12}, Lcom/google/android/talk/ChatView;->access$3600(Lcom/google/android/talk/ChatView;J)V

    .line 833
    :cond_2
    :goto_2
    packed-switch v21, :pswitch_data_0

    .line 875
    :pswitch_0
    move-object/from16 v0, p0

    move-object v1, v6

    move/from16 v2, v21

    move-wide v3, v8

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatView$MessageItem;->appendPresenceUpdates(Ljava/lang/String;IJ)V

    .line 878
    .end local v6    # "nickname":Ljava/lang/String;
    .end local v7    # "body":Ljava/lang/String;
    .end local v10    # "showTimeStamp":Z
    :cond_3
    :goto_3
    return-void

    .line 813
    .end local v17    # "alwaysDisplayTs":I
    .end local v19    # "delta":J
    .restart local v7    # "body":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v5

    move-object v6, v5

    goto/16 :goto_0

    .line 817
    .restart local v6    # "nickname":Ljava/lang/String;
    .restart local v17    # "alwaysDisplayTs":I
    .restart local v19    # "delta":J
    :cond_5
    const/4 v5, 0x0

    move v10, v5

    goto :goto_1

    .line 829
    .restart local v10    # "showTimeStamp":Z
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3700(Lcom/google/android/talk/ChatView;)V

    goto :goto_2

    :pswitch_1
    move-object/from16 v5, p0

    move-object/from16 v11, p1

    .line 835
    invoke-virtual/range {v5 .. v11}, Lcom/google/android/talk/ChatView$MessageItem;->appendInboxMessage(Ljava/lang/String;Ljava/lang/String;JZLandroid/database/Cursor;)V

    .line 836
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    move v5, v0

    if-nez v5, :cond_3

    .line 839
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3300(Lcom/google/android/talk/ChatView;)Z

    move-result v5

    if-eqz v5, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$2300(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatScreen$ChatHost;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/talk/ChatScreen$ChatHost;->getColorMaker()Lcom/google/android/talk/util/ChatColorMaker;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/google/android/talk/util/ChatColorMaker;->get(Ljava/lang/String;I)I

    .end local v7    # "body":Ljava/lang/String;
    move-result v5

    move/from16 v18, v5

    .line 843
    .end local v6    # "nickname":Ljava/lang/String;
    .local v18, "bgColor":I
    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView$MessageItem;->updateBackgroundColor(I)V

    goto :goto_3

    .line 839
    .end local v18    # "bgColor":I
    .restart local v6    # "nickname":Ljava/lang/String;
    .restart local v7    # "body":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mContext:Landroid/content/Context;

    move-object v5, v0

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f05000a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .end local v6    # "nickname":Ljava/lang/String;
    move-result v5

    move/from16 v18, v5

    goto :goto_4

    .line 847
    .restart local v6    # "nickname":Ljava/lang/String;
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$1900(Lcom/google/android/talk/ChatView;)I

    move-result v5

    move-object/from16 v0, p1

    move v1, v5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    .local v16, "errorCode":I
    move-object/from16 v11, p0

    move-object v12, v7

    move-wide v13, v8

    move v15, v10

    .line 848
    invoke-virtual/range {v11 .. v16}, Lcom/google/android/talk/ChatView$MessageItem;->appendSentMessage(Ljava/lang/String;JZI)V

    .line 849
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->mShowPlainText:Z

    move v5, v0

    if-nez v5, :cond_3

    .line 850
    const/4 v5, -0x1

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView$MessageItem;->updateBackgroundColor(I)V

    goto/16 :goto_3

    .line 854
    .end local v16    # "errorCode":I
    :pswitch_3
    move-object/from16 v0, p0

    move-wide v1, v8

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/ChatView$MessageItem;->appendGroupChatConversionMessage(J)V

    goto/16 :goto_3

    .line 857
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060051

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .end local v6    # "nickname":Ljava/lang/String;
    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object v1, v5

    move-wide v2, v8

    move v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatView$MessageItem;->appendOffTheRecordStatus(Ljava/lang/String;JZ)V

    goto/16 :goto_3

    .line 860
    .restart local v6    # "nickname":Ljava/lang/String;
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060052

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .end local v6    # "nickname":Ljava/lang/String;
    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object v1, v5

    move-wide v2, v8

    move v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatView$MessageItem;->appendOffTheRecordStatus(Ljava/lang/String;JZ)V

    goto/16 :goto_3

    .line 863
    .restart local v6    # "nickname":Ljava/lang/String;
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060053

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .end local v6    # "nickname":Ljava/lang/String;
    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object v1, v5

    move-wide v2, v8

    move v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatView$MessageItem;->appendOffTheRecordStatus(Ljava/lang/String;JZ)V

    goto/16 :goto_3

    .line 867
    .restart local v6    # "nickname":Ljava/lang/String;
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/ChatView$MessageItem;->this$0:Lcom/google/android/talk/ChatView;

    move-object v5, v0

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;

    move-result-object v5

    const v7, 0x7f060054

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    .end local v7    # "body":Ljava/lang/String;
    .end local v10    # "showTimeStamp":Z
    const/4 v11, 0x0

    aput-object v6, v10, v11

    invoke-virtual {v5, v7, v10}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object v1, v5

    move-wide v2, v8

    move v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatView$MessageItem;->appendOffTheRecordStatus(Ljava/lang/String;JZ)V

    goto/16 :goto_3

    .line 872
    .restart local v7    # "body":Ljava/lang/String;
    .restart local v10    # "showTimeStamp":Z
    :pswitch_8
    move-object/from16 v0, p0

    move-object v1, v7

    move-wide v2, v8

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/talk/ChatView$MessageItem;->appendStatusMessage(Ljava/lang/String;J)V

    goto/16 :goto_3

    .line 833
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_8
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method final getMessageLinks()[Landroid/text/style/URLSpan;
    .locals 1

    .prologue
    .line 804
    iget-object v0, p0, Lcom/google/android/talk/ChatView$MessageItem;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getUrls()[Landroid/text/style/URLSpan;

    move-result-object v0

    return-object v0
.end method

.method public final updateBackgroundColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 881
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView$MessageItem;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 882
    .local v0, "g":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 883
    return-void
.end method
