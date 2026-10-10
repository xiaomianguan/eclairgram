.class public final Landroid/provider/Gmail$ConversationColumns;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ConversationColumns"
.end annotation


# static fields
.field public static final DATE:Ljava/lang/String; = "date"

.field public static final FORCE_ALL_UNREAD:Ljava/lang/String; = "forceAllUnread"

.field public static final FROM:Ljava/lang/String; = "fromAddress"

.field public static final HAS_ATTACHMENTS:Ljava/lang/String; = "hasAttachments"

.field public static final HAS_MESSAGES_WITH_ERRORS:Ljava/lang/String; = "hasMessagesWithErrors"

.field public static final ID:Ljava/lang/String; = "_id"

.field public static final LABEL_IDS:Ljava/lang/String; = "labelIds"

.field public static final MAX_MESSAGE_ID:Ljava/lang/String; = "maxMessageId"

.field public static final NUM_MESSAGES:Ljava/lang/String; = "numMessages"

.field public static final PERSONAL_LEVEL:Ljava/lang/String; = "personalLevel"

.field public static final SNIPPET:Ljava/lang/String; = "snippet"

.field public static final SUBJECT:Ljava/lang/String; = "subject"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
