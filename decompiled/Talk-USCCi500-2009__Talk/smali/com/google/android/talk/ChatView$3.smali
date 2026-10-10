.class Lcom/google/android/talk/ChatView$3;
.super Ljava/lang/Object;
.source "ChatView.java"

# interfaces
.implements Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatView;->initialize(Landroid/content/Intent;Landroid/database/Cursor;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatView;)V
    .locals 0

    .prologue
    .line 314
    iput-object p1, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onContactInfoLoaded(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 8
    .param p1, "presenceStatus"    # I
    .param p2, "customPresence"    # Ljava/lang/String;
    .param p3, "nickName"    # Ljava/lang/String;
    .param p4, "avatar"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/16 v1, 0x14

    const/4 v2, 0x0

    .line 320
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    const/4 v4, 0x1

    invoke-static {v0, v4}, Lcom/google/android/talk/ChatView;->access$302(Lcom/google/android/talk/ChatView;Z)Z

    .line 321
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0, p3}, Lcom/google/android/talk/ChatView;->access$402(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;

    .line 322
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0, p1}, Lcom/google/android/talk/ChatView;->access$502(Lcom/google/android/talk/ChatView;I)I

    .line 323
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0, p2}, Lcom/google/android/talk/ChatView;->access$602(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;

    .line 324
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    check-cast p4, Landroid/graphics/drawable/BitmapDrawable;

    .end local p4    # "avatar":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p4}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/google/android/talk/ChatView;->access$702(Lcom/google/android/talk/ChatView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 326
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$800(Lcom/google/android/talk/ChatView;)V

    .line 327
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$900(Lcom/google/android/talk/ChatView;)V

    .line 329
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$1000(Lcom/google/android/talk/ChatView;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-nez v0, :cond_0

    .line 330
    sget-object v0, Landroid/provider/ContactsContract$CommonDataKinds$Email;->CONTENT_LOOKUP_URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$1100(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 331
    .local v3, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$1200(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatView$QueryHandler;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView$QueryHandler;->cancelOperation(I)V

    .line 332
    iget-object v0, p0, Lcom/google/android/talk/ChatView$3;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$1200(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatView$QueryHandler;

    move-result-object v0

    invoke-static {}, Lcom/google/android/talk/ChatView;->access$1300()[Ljava/lang/String;

    move-result-object v4

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/ChatView$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    .end local v3    # "uri":Landroid/net/Uri;
    :cond_0
    return-void
.end method
