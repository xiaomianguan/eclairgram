.class public interface abstract Lorg/jivesoftware/smack/RosterListener;
.super Ljava/lang/Object;
.source "RosterListener.java"


# virtual methods
.method public abstract entriesAdded(JJLjava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract entriesDeleted(JJLjava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract entriesUpdated(JJLjava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract presenceChanged(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
.end method
