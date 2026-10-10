.class public Lorg/jivesoftware/smack/provider/ProviderManager;
.super Ljava/lang/Object;
.source "ProviderManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field private static extensionProviders:Ljava/util/Map;

.field private static iqProviders:Ljava/util/Map;

.field private static tagProtoBufMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/google/common/io/protocol/ProtoBufType;",
            ">;"
        }
    .end annotation
.end field

.field private static tagQNameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 119
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    .line 120
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->tagProtoBufMap:Ljava/util/Map;

    .line 122
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    .line 123
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 623
    return-void
.end method

.method public static addExtensionProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/PacketExtensionProvider;)V
    .locals 5
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "provider"    # Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .prologue
    .line 547
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 548
    .local v0, "key":Ljava/lang/String;
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v2, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    invoke-interface {p2}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->getTag()I

    move-result v1

    .line 551
    .local v1, "tag":I
    if-nez v1, :cond_0

    .line 559
    :goto_0
    return-void

    .line 554
    :cond_0
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 555
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " already in use."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 557
    :cond_1
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->tagProtoBufMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p2}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V
    .locals 5
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "provider"    # Lorg/jivesoftware/smack/provider/IQProvider;

    .prologue
    .line 442
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 443
    .local v0, "key":Ljava/lang/String;
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v2, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    invoke-interface {p2}, Lorg/jivesoftware/smack/provider/IQProvider;->getTag()I

    move-result v1

    .line 446
    .local v1, "tag":I
    if-nez v1, :cond_0

    .line 454
    :goto_0
    return-void

    .line 449
    :cond_0
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 450
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " already in use."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 452
    :cond_1
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    sget-object v2, Lorg/jivesoftware/smack/provider/ProviderManager;->tagProtoBufMap:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p2}, Lorg/jivesoftware/smack/provider/IQProvider;->getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static getExtensionProvider(I)Ljava/lang/Object;
    .locals 3
    .param p0, "tag"    # I

    .prologue
    .line 507
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 508
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 509
    .local v0, "key":Ljava/lang/String;
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 511
    .end local v0    # "key":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getExtensionProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 495
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 496
    .local v0, "key":Ljava/lang/String;
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getExtensionProviders()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 591
    new-instance v0, Ljava/util/HashMap;

    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public static getIQProvider(I)Ljava/lang/Object;
    .locals 3
    .param p0, "tag"    # I

    .prologue
    .line 394
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 395
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 396
    .local v0, "key":Ljava/lang/String;
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 398
    .end local v0    # "key":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getIQProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 382
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "key":Ljava/lang/String;
    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getIQProviders()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 407
    new-instance v0, Ljava/util/HashMap;

    sget-object v1, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method private static getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 603
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 604
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "/><"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 605
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static initializeBuiltInProviders()V
    .locals 3

    .prologue
    const-string v2, "query"

    .line 237
    const-string v0, "query"

    const-string v0, "http://jabber.org/protocol/disco#items"

    new-instance v1, Lorg/jivesoftware/smackx/provider/DiscoverItemsProvider;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/provider/DiscoverItemsProvider;-><init>()V

    invoke-static {v2, v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 242
    const-string v0, "query"

    const-string v0, "http://jabber.org/protocol/disco#info"

    new-instance v1, Lorg/jivesoftware/smackx/provider/DiscoverInfoProvider;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/provider/DiscoverInfoProvider;-><init>()V

    invoke-static {v2, v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 247
    const-string v0, "vCard"

    const-string v1, "vcard-temp"

    new-instance v2, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;-><init>()V

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 252
    const-string v0, "x"

    const-string v1, "http://jabber.org/protocol/muc#user"

    new-instance v2, Lorg/jivesoftware/smackx/provider/MUCUserProvider;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/provider/MUCUserProvider;-><init>()V

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smack/provider/ProviderManager;->addExtensionProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/PacketExtensionProvider;)V

    .line 262
    return-void
.end method

.method private static loge(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 358
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "##### [ProviderMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    return-void
.end method

.method private static logv(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 354
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "##### [ProviderMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    return-void
.end method

.method public static removeBultInProviders()V
    .locals 2

    .prologue
    const-string v1, "query"

    .line 265
    const-string v0, "query"

    const-string v0, "http://jabber.org/protocol/disco#items"

    invoke-static {v1, v0}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    const-string v0, "query"

    const-string v0, "http://jabber.org/protocol/disco#info"

    invoke-static {v1, v0}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string v0, "vCard"

    const-string v1, "vcard-temp"

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    const-string v0, "x"

    const-string v1, "http://jabber.org/protocol/muc#user"

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeExtensionProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    return-void
.end method

.method public static removeExtensionProvider(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 571
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 572
    .local v0, "key":Ljava/lang/String;
    sget-object v3, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .line 574
    .local v1, "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    if-eqz v1, :cond_0

    .line 575
    invoke-interface {v1}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->getTag()I

    move-result v2

    .line 576
    .local v2, "tag":I
    if-nez v2, :cond_1

    .line 583
    .end local v2    # "tag":I
    :cond_0
    :goto_0
    return-void

    .line 580
    .restart local v2    # "tag":I
    :cond_1
    sget-object v3, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    sget-object v3, Lorg/jivesoftware/smack/provider/ProviderManager;->tagProtoBufMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 465
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 466
    .local v0, "key":Ljava/lang/String;
    sget-object v3, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/provider/IQProvider;

    .line 468
    .local v1, "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    if-eqz v1, :cond_0

    .line 469
    invoke-interface {v1}, Lorg/jivesoftware/smack/provider/IQProvider;->getTag()I

    move-result v2

    .line 470
    .local v2, "tag":I
    sget-object v3, Lorg/jivesoftware/smack/provider/ProviderManager;->tagQNameMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    sget-object v3, Lorg/jivesoftware/smack/provider/ProviderManager;->tagProtoBufMap:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    .end local v2    # "tag":I
    :cond_0
    return-void
.end method
