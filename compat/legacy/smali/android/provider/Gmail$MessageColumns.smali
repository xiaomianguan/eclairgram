.class public final Landroid/provider/Gmail$MessageColumns;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MessageColumns"
.end annotation


# static fields
.field public static final BCC:Ljava/lang/String; = "bccAddresses"

.field public static final BODY:Ljava/lang/String; = "body"

.field public static final CC:Ljava/lang/String; = "ccAddresses"

.field public static final CONVERSATION_ID:Ljava/lang/String; = "conversation"

.field public static final DATE_RECEIVED_MS:Ljava/lang/String; = "dateReceivedMs"

.field public static final DATE_SENT_MS:Ljava/lang/String; = "dateSentMs"

.field public static final EMBEDS_EXTERNAL_RESOURCES:Ljava/lang/String; = "bodyEmbedsExternalResources"

.field public static final ERROR:Ljava/lang/String; = "error"

.field public static final FAKE_REF_MESSAGE_ID:Ljava/lang/String; = "refMessageId"

.field public static final FAKE_SAVE:Ljava/lang/String; = "save"

.field public static final FROM:Ljava/lang/String; = "fromAddress"

.field public static final ID:Ljava/lang/String; = "_id"

.field public static final JOINED_ATTACHMENT_INFOS:Ljava/lang/String; = "joinedAttachmentInfos"

.field public static final LABEL_IDS:Ljava/lang/String; = "labelIds"

.field public static final LIST_INFO:Ljava/lang/String; = "listInfo"

.field public static final MESSAGE_ID:Ljava/lang/String; = "messageId"

.field public static final PERSONAL_LEVEL:Ljava/lang/String; = "personalLevel"

.field public static final REF_MESSAGE_ID:Ljava/lang/String; = "refMessageId"

.field public static final REPLY_TO:Ljava/lang/String; = "replyToAddresses"

.field public static final SNIPPET:Ljava/lang/String; = "snippet"

.field public static final SUBJECT:Ljava/lang/String; = "subject"

.field public static final TO:Ljava/lang/String; = "toAddresses"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 353
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
