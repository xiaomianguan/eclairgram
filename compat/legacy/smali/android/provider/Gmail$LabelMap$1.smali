.class Landroid/provider/Gmail$LabelMap$1;
.super Ljava/lang/Object;
.source "Gmail.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/provider/Gmail$LabelMap;->init(Landroid/database/Cursor;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/provider/Gmail$LabelMap;


# direct methods
.method constructor <init>(Landroid/provider/Gmail$LabelMap;)V
    .registers 2

    .prologue
    .line 1330
    iput-object p1, p0, Landroid/provider/Gmail$LabelMap$1;->this$0:Landroid/provider/Gmail$LabelMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 4
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 1331
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap$1;->this$0:Landroid/provider/Gmail$LabelMap;

    # invokes: Landroid/provider/Gmail$LabelMap;->updateDataStructures()V
    invoke-static {v0}, Landroid/provider/Gmail$LabelMap;->access$400(Landroid/provider/Gmail$LabelMap;)V

    .line 1332
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap$1;->this$0:Landroid/provider/Gmail$LabelMap;

    # invokes: Landroid/provider/Gmail$LabelMap;->setChanged()V
    invoke-static {v0}, Landroid/provider/Gmail$LabelMap;->access$500(Landroid/provider/Gmail$LabelMap;)V

    .line 1333
    iget-object v0, p0, Landroid/provider/Gmail$LabelMap$1;->this$0:Landroid/provider/Gmail$LabelMap;

    invoke-virtual {v0}, Landroid/provider/Gmail$LabelMap;->notifyObservers()V

    .line 1334
    return-void
.end method
