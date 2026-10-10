.class final Lcom/google/android/talk/BlockedList$BlockedUserAdapter;
.super Landroid/widget/ResourceCursorAdapter;
.source "BlockedList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BlockedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BlockedUserAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BlockedList;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/BlockedList;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    .line 106
    const v0, 0x7f030002

    invoke-direct {p0, p2, v0, p3}, Landroid/widget/ResourceCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;)V

    .line 107
    return-void
.end method


# virtual methods
.method public final bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    .line 111
    const v1, 0x7f0b0005

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 112
    .local v10, "name":Landroid/widget/TextView;
    const v1, 0x7f0b0004

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 113
    .local v11, "nickname":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v1}, Lcom/google/android/talk/BlockedList;->access$000(Lcom/google/android/talk/BlockedList;)I

    move-result v1

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 115
    .local v4, "username":Ljava/lang/String;
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v1}, Lcom/google/android/talk/BlockedList;->access$100(Lcom/google/android/talk/BlockedList;)I

    move-result v1

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    const v1, 0x7f0b0003

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 119
    .local v9, "i":Landroid/widget/ImageView;
    invoke-virtual {v9}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    invoke-virtual {v9}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v9}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v2

    sub-int v5, v1, v2

    .line 120
    .local v5, "desiredWidth":I
    invoke-virtual {v9}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    invoke-virtual {v9}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v9}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v2

    sub-int v6, v1, v2

    .line 122
    .local v6, "desiredHeight":I
    iget-object v1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v1}, Lcom/google/android/talk/BlockedList;->access$200(Lcom/google/android/talk/BlockedList;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v3}, Lcom/google/android/talk/BlockedList;->access$300(Lcom/google/android/talk/BlockedList;)J

    move-result-wide v7

    const/4 v3, 0x1

    invoke-static {v1, v2, v7, v8, v3}, Lcom/google/android/talk/AvatarCache;->getInstance(JJZ)Lcom/google/android/talk/AvatarCache;

    move-result-object v0

    .line 123
    .local v0, "cache":Lcom/google/android/talk/AvatarCache;
    iget-object v1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v1}, Lcom/google/android/talk/BlockedList;->access$400(Lcom/google/android/talk/BlockedList;)I

    move-result v2

    iget-object v1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v1}, Lcom/google/android/talk/BlockedList;->access$500(Lcom/google/android/talk/BlockedList;)I

    move-result v3

    iget-object v1, p0, Lcom/google/android/talk/BlockedList$BlockedUserAdapter;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v1}, Lcom/google/android/talk/BlockedList;->access$600(Lcom/google/android/talk/BlockedList;)Lcom/google/android/talk/TalkApp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    move-object v1, p3

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/AvatarCache;->getAvatar(Landroid/database/Cursor;IILjava/lang/String;IILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 127
    .local v8, "avatar":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 128
    return-void
.end method
