.class Lcom/google/android/talk/PreferencesActivity$1;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/PreferencesActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/PreferencesActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/PreferencesActivity;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/google/android/talk/PreferencesActivity$1;->this$0:Lcom/google/android/talk/PreferencesActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 122
    iget-object v1, p0, Lcom/google/android/talk/PreferencesActivity$1;->this$0:Lcom/google/android/talk/PreferencesActivity;

    invoke-static {v1}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    .line 123
    .local v0, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getRecentSuggestions()Landroid/provider/SearchRecentSuggestions;

    move-result-object v1

    invoke-virtual {v1}, Landroid/provider/SearchRecentSuggestions;->clearHistory()V

    .line 124
    return-void
.end method
