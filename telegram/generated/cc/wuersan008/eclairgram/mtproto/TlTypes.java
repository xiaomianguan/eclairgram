package cc.wuersan008.eclairgram.mtproto;

/**
 * 由 scripts/gen_tl_schema.py 依据 telegram/schema/*.tl 自动生成，请勿手改。
 *
 * 每个构造器：编号 + 字段（名称、种类、引用类型、可选标志位）。
 * 解析 user/message 这类字段极多的类型时，按字段顺序读取即可对齐。
 */
public final class TlTypes {
    // kind
    public static final int INT = 1, LONG = 2, INT128 = 3, INT256 = 4,
        DOUBLE = 5, STRING = 6, BYTES = 7, BOOL = 8, TRUE = 9,
        VECTOR = 10, OBJECT = 11, FLAGWORD = 12;

    public static final class Field {
        public final String name;
        public final int kind;
        public final String ref;
        public final int flagSource;
        public final int flagBit;
        Field(String n, int k, String r, int fs, int fb) {
            name = n; kind = k; ref = r; flagSource = fs; flagBit = fb;
        }
    }

    public static final class Spec {
        public final int id;
        public final String name;
        public final Field[] fields;
        Spec(int i, String n, Field[] f) { id = i; name = n; fields = f; }
    }

    private static final java.util.HashMap<Integer, Spec> BY_ID =
            new java.util.HashMap<Integer, Spec>();

    public static Spec spec(int id) { return BY_ID.get(Integer.valueOf(id)); }

    static {
        init0();
        init1();
        init2();
        init3();
        init4();
        init5();
        init6();
        init7();
        init8();
        init9();
        init10();
        init11();
        init12();
        init13();
    }

    private static void init0() {
        BY_ID.put(Integer.valueOf(0x004a8537),
            new Spec(0x004a8537, "securePasswordKdfAlgoUnknown", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x004b572c),
            new Spec(0x004b572c, "inputRichMessageMarkdown", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rtl", TRUE, "", 1, 0), new Field("noautolink", TRUE, "", 1, 1), new Field("markdown", STRING, "", 0, -1), new Field("files", VECTOR, "InputRichFile", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x007efe0e),
            new Spec(0x007efe0e, "storage.fileJpeg", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0084cd5a),
            new Spec(0x0084cd5a, "updateTranscribedAudio", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pending", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("transcription_id", LONG, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x008c703f),
            new Spec(0x008c703f, "userStatusOffline", new Field[] { new Field("was_online", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x009fd736),
            new Spec(0x009fd736, "auth.sentCodeTypeFirebaseSms", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("nonce", BYTES, "", 1, 0), new Field("play_integrity_project_id", LONG, "", 1, 2), new Field("play_integrity_nonce", BYTES, "", 1, 2), new Field("receipt", STRING, "", 1, 1), new Field("push_timeout", INT, "", 1, 1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x00be3dfa),
            new Spec(0x00be3dfa, "secureValueErrorFrontSide", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x00f49ca0),
            new Spec(0x00f49ca0, "updates.difference", new Field[] { new Field("new_messages", VECTOR, "Message", 0, -1), new Field("new_encrypted_messages", VECTOR, "EncryptedMessage", 0, -1), new Field("other_updates", VECTOR, "Update", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("state", OBJECT, "updates.State", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x00f8ed08),
            new Spec(0x00f8ed08, "help.peerColors", new Field[] { new Field("hash", INT, "", 0, -1), new Field("colors", VECTOR, "help.PeerColorOption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x01190cf1),
            new Spec(0x01190cf1, "inputQuickReplyShortcutId", new Field[] { new Field("shortcut_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0194cb3b),
            new Spec(0x0194cb3b, "inputBusinessGreetingMessage", new Field[] { new Field("shortcut_id", INT, "", 0, -1), new Field("recipients", OBJECT, "InputBusinessRecipients", 0, -1), new Field("no_activity_days", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x01a9fbfc),
            new Spec(0x01a9fbfc, "textMentionName", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x01c641c2),
            new Spec(0x01c641c2, "webPageAttributeStarGiftAuction", new Field[] { new Field("gift", OBJECT, "StarGift", 0, -1), new Field("end_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x01eb3758),
            new Spec(0x01eb3758, "help.userInfo", new Field[] { new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 0, -1), new Field("author", STRING, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x01f2bf4a),
            new Spec(0x01f2bf4a, "publicForwardMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x021e1ad6),
            new Spec(0x021e1ad6, "photoCachedSize", new Field[] { new Field("type", STRING, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x023f109b),
            new Spec(0x023f109b, "forumTopicDeleted", new Field[] { new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x027477b4),
            new Spec(0x027477b4, "secureRequiredTypeOneOf", new Field[] { new Field("types", VECTOR, "SecureRequiredType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x028703c8),
            new Spec(0x028703c8, "inputStickerSetAnimatedEmoji", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x02cc6383),
            new Spec(0x02cc6383, "channelAdminLogEventActionToggleForum", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x02e16c98),
            new Spec(0x02e16c98, "inputStarGiftAuction", new Field[] { new Field("gift_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x02ff29d3),
            new Spec(0x02ff29d3, "textBotCommand", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x031224c3),
            new Spec(0x031224c3, "messageActionChatJoinedByLink", new Field[] { new Field("inviter_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x03173d78),
            new Spec(0x03173d78, "updates.getChannelDifference", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force", TRUE, "", 1, 0), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("filter", OBJECT, "ChannelMessagesFilter", 0, -1), new Field("pts", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x031f9590),
            new Spec(0x031f9590, "pageBlockSlideshow", new Field[] { new Field("items", VECTOR, "PageBlock", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x032512c5),
            new Spec(0x032512c5, "payments.getStarsSubscriptions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("missing_balance", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x032c3e77),
            new Spec(0x032c3e77, "inputGameID", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x032da4cf),
            new Spec(0x032da4cf, "account.verifyEmail", new Field[] { new Field("purpose", OBJECT, "EmailVerifyPurpose", 0, -1), new Field("verification", OBJECT, "EmailVerification", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0330e77f),
            new Spec(0x0330e77f, "messages.sendMedia", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 5), new Field("background", TRUE, "", 1, 6), new Field("clear_draft", TRUE, "", 1, 7), new Field("noforwards", TRUE, "", 1, 14), new Field("update_stickersets_order", TRUE, "", 1, 15), new Field("invert_media", TRUE, "", 1, 16), new Field("allow_paid_floodskip", TRUE, "", 1, 19), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 0), new Field("media", OBJECT, "InputMedia", 0, -1), new Field("message", STRING, "", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("entities", VECTOR, "MessageEntity", 1, 3), new Field("schedule_date", INT, "", 1, 10), new Field("schedule_repeat_period", INT, "", 1, 24), new Field("send_as", OBJECT, "InputPeer", 1, 13), new Field("quick_reply_shortcut", OBJECT, "InputQuickReplyShortcut", 1, 17), new Field("effect", LONG, "", 1, 18), new Field("allow_paid_stars", LONG, "", 1, 21), new Field("suggested_post", OBJECT, "SuggestedPost", 1, 22) }));
        BY_ID.put(Integer.valueOf(0x033ed001),
            new Spec(0x033ed001, "connectedBot", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("recipients", OBJECT, "BusinessBotRecipients", 0, -1), new Field("rights", OBJECT, "BusinessBotRights", 0, -1), new Field("device", STRING, "", 1, 0), new Field("date", INT, "", 1, 1), new Field("location", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x034b8621),
            new Spec(0x034b8621, "textMarked", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0352dafa),
            new Spec(0x0352dafa, "inputPrivacyKeyPhoneNumber", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0360d5d2),
            new Spec(0x0360d5d2, "chatParticipantAdmin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("inviter_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("rank", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x037c9330),
            new Spec(0x037c9330, "inputMediaUploadedDocument", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("nosound_video", TRUE, "", 1, 3), new Field("force_file", TRUE, "", 1, 4), new Field("spoiler", TRUE, "", 1, 5), new Field("file", OBJECT, "InputFile", 0, -1), new Field("thumb", OBJECT, "InputFile", 1, 2), new Field("mime_type", STRING, "", 0, -1), new Field("attributes", VECTOR, "DocumentAttribute", 0, -1), new Field("stickers", VECTOR, "InputDocument", 1, 0), new Field("video_cover", OBJECT, "InputPhoto", 1, 6), new Field("video_timestamp", INT, "", 1, 7), new Field("ttl_seconds", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x0388a3b5),
            new Spec(0x0388a3b5, "photos.uploadProfilePhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("fallback", TRUE, "", 1, 3), new Field("bot", OBJECT, "InputUser", 1, 5), new Field("file", OBJECT, "InputFile", 1, 0), new Field("video", OBJECT, "InputFile", 1, 1), new Field("video_start_ts", DOUBLE, "", 1, 2), new Field("video_emoji_markup", OBJECT, "VideoSize", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x038a08d3),
            new Spec(0x038a08d3, "help.getUserInfo", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x03c610bd),
            new Spec(0x03c610bd, "richButtonStyle", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bg_primary", TRUE, "", 1, 0), new Field("bg_danger", TRUE, "", 1, 1), new Field("bg_success", TRUE, "", 1, 2), new Field("link", TRUE, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x041845db),
            new Spec(0x041845db, "phone.getGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x042f1f61),
            new Spec(0x042f1f61, "premium.getBoostsStatus", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0438865b),
            new Spec(0x0438865b, "inputStickeredMediaDocument", new Field[] { new Field("id", OBJECT, "InputDocument", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x049ee584),
            new Spec(0x049ee584, "invoice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("test", TRUE, "", 1, 0), new Field("name_requested", TRUE, "", 1, 1), new Field("phone_requested", TRUE, "", 1, 2), new Field("email_requested", TRUE, "", 1, 3), new Field("shipping_address_requested", TRUE, "", 1, 4), new Field("flexible", TRUE, "", 1, 5), new Field("phone_to_provider", TRUE, "", 1, 6), new Field("email_to_provider", TRUE, "", 1, 7), new Field("recurring", TRUE, "", 1, 9), new Field("currency", STRING, "", 0, -1), new Field("prices", VECTOR, "LabeledPrice", 0, -1), new Field("max_tip_amount", LONG, "", 1, 8), new Field("suggested_tip_amounts", VECTOR, "LONG", 1, 8), new Field("terms_url", STRING, "", 1, 10), new Field("subscription_period", INT, "", 1, 11) }));
        BY_ID.put(Integer.valueOf(0x04c4d4ce),
            new Spec(0x04c4d4ce, "inputStickerSetEmojiGenericAnimations", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x04deb57d),
            new Spec(0x04deb57d, "msgs_state_info", new Field[] { new Field("req_msg_id", LONG, "", 0, -1), new Field("info", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x04f1aaa9),
            new Spec(0x04f1aaa9, "messages.getFavedStickers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0509113f),
            new Spec(0x0509113f, "attachMenuPeerTypeChat", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x050a9839),
            new Spec(0x050a9839, "requirementToContactEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x050c7ac8),
            new Spec(0x050c7ac8, "channelAdminLogEventActionChangeLinkedChat", new Field[] { new Field("prev_value", LONG, "", 0, -1), new Field("new_value", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x05162463),
            new Spec(0x05162463, "resPQ", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("pq", STRING, "", 0, -1), new Field("server_public_key_fingerprints", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0517165a),
            new Spec(0x0517165a, "bots.setBotCommands", new Field[] { new Field("scope", OBJECT, "BotCommandScope", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("commands", VECTOR, "BotCommand", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x051846fd),
            new Spec(0x051846fd, "botInlineMessageMediaGeo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("heading", INT, "", 1, 0), new Field("period", INT, "", 1, 1), new Field("proximity_notification_radius", INT, "", 1, 3), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x053ca973),
            new Spec(0x053ca973, "bots.toggleUsername", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("username", STRING, "", 0, -1), new Field("active", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x05416d58),
            new Spec(0x05416d58, "starsSubscriptionPricing", new Field[] { new Field("period", INT, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x05492a13),
            new Spec(0x05492a13, "updateUserPhone", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("phone", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0589ee75),
            new Spec(0x0589ee75, "messages.editFactCheck", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("text", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0598a92a),
            new Spec(0x0598a92a, "inputGroupCallStream", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("time_ms", LONG, "", 0, -1), new Field("scale", INT, "", 0, -1), new Field("video_channel", INT, "", 1, 0), new Field("video_quality", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x05a954c0),
            new Spec(0x05a954c0, "messages.receivedMessages", new Field[] { new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x05f58d0f),
            new Spec(0x05f58d0f, "contacts.search", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("broadcasts", TRUE, "", 1, 0), new Field("bots", TRUE, "", 1, 1), new Field("q", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x062cc1bc),
            new Spec(0x062cc1bc, "walletTransactionPeerAddress", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("domain", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x062dd747),
            new Spec(0x062dd747, "messages.unpinAllMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x0637b7ed),
            new Spec(0x0637b7ed, "topPeerCategoryCorrespondents", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0652c1c5),
            new Spec(0x0652c1c5, "messageEntityDiffDelete", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0656ac4b),
            new Spec(0x0656ac4b, "channelParticipantsSearch", new Field[] { new Field("q", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x068e9916),
            new Spec(0x068e9916, "auth.loginTokenMigrateTo", new Field[] { new Field("dc_id", INT, "", 0, -1), new Field("token", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0697102b),
            new Spec(0x0697102b, "quickReply", new Field[] { new Field("shortcut_id", INT, "", 0, -1), new Field("shortcut", STRING, "", 0, -1), new Field("top_message", INT, "", 0, -1), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0697f414),
            new Spec(0x0697f414, "privacyKeyVoiceMessages", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x06cbe645),
            new Spec(0x06cbe645, "userFull", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("blocked", TRUE, "", 1, 0), new Field("phone_calls_available", TRUE, "", 1, 4), new Field("phone_calls_private", TRUE, "", 1, 5), new Field("can_pin_message", TRUE, "", 1, 7), new Field("has_scheduled", TRUE, "", 1, 12), new Field("video_calls_available", TRUE, "", 1, 13), new Field("voice_messages_forbidden", TRUE, "", 1, 20), new Field("translations_disabled", TRUE, "", 1, 23), new Field("stories_pinned_available", TRUE, "", 1, 26), new Field("blocked_my_stories_from", TRUE, "", 1, 27), new Field("wallpaper_overridden", TRUE, "", 1, 28), new Field("contact_require_premium", TRUE, "", 1, 29), new Field("read_dates_private", TRUE, "", 1, 30), new Field("flags2", FLAGWORD, "", 0, -1), new Field("sponsored_enabled", TRUE, "", 2, 7), new Field("can_view_revenue", TRUE, "", 2, 9), new Field("bot_can_manage_emoji_status", TRUE, "", 2, 10), new Field("display_gifts_button", TRUE, "", 2, 16), new Field("noforwards_my_enabled", TRUE, "", 2, 23), new Field("noforwards_peer_enabled", TRUE, "", 2, 24), new Field("unofficial_security_risk", TRUE, "", 2, 26), new Field("id", LONG, "", 0, -1), new Field("about", STRING, "", 1, 1), new Field("settings", OBJECT, "PeerSettings", 0, -1), new Field("personal_photo", OBJECT, "Photo", 1, 21), new Field("profile_photo", OBJECT, "Photo", 1, 2), new Field("fallback_photo", OBJECT, "Photo", 1, 22), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1), new Field("bot_info", OBJECT, "BotInfo", 1, 3), new Field("pinned_msg_id", INT, "", 1, 6), new Field("common_chats_count", INT, "", 0, -1), new Field("folder_id", INT, "", 1, 11), new Field("ttl_period", INT, "", 1, 14), new Field("theme", OBJECT, "ChatTheme", 1, 15), new Field("private_forward_name", STRING, "", 1, 16), new Field("bot_group_admin_rights", OBJECT, "ChatAdminRights", 1, 17), new Field("bot_broadcast_admin_rights", OBJECT, "ChatAdminRights", 1, 18), new Field("wallpaper", OBJECT, "WallPaper", 1, 24), new Field("stories", OBJECT, "PeerStories", 1, 25), new Field("business_work_hours", OBJECT, "BusinessWorkHours", 2, 0), new Field("business_location", OBJECT, "BusinessLocation", 2, 1), new Field("business_greeting_message", OBJECT, "BusinessGreetingMessage", 2, 2), new Field("business_away_message", OBJECT, "BusinessAwayMessage", 2, 3), new Field("business_intro", OBJECT, "BusinessIntro", 2, 4), new Field("birthday", OBJECT, "Birthday", 2, 5), new Field("personal_channel_id", LONG, "", 2, 6), new Field("personal_channel_message", INT, "", 2, 6), new Field("stargifts_count", INT, "", 2, 8), new Field("starref_program", OBJECT, "StarRefProgram", 2, 11), new Field("bot_verification", OBJECT, "BotVerification", 2, 12), new Field("send_paid_messages_stars", LONG, "", 2, 14), new Field("disallowed_gifts", OBJECT, "DisallowedGiftsSettings", 2, 15), new Field("stars_rating", OBJECT, "StarsRating", 2, 17), new Field("stars_my_pending_rating", OBJECT, "StarsRating", 2, 18), new Field("stars_my_pending_rating_date", INT, "", 2, 18), new Field("main_tab", OBJECT, "ProfileTab", 2, 20), new Field("saved_music", OBJECT, "Document", 2, 21), new Field("note", OBJECT, "TextWithEntities", 2, 22), new Field("bot_manager_id", LONG, "", 2, 25) }));
        BY_ID.put(Integer.valueOf(0x06dd654c),
            new Spec(0x06dd654c, "account.getReactionsNotifySettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x06de6392),
            new Spec(0x06de6392, "bots.toggleUserEmojiStatusPermission", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x06e425c4),
            new Spec(0x06e425c4, "secureValueTypeDriverLicense", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x06ed998c),
            new Spec(0x06ed998c, "auth.codeTypeFragmentSms", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x07141dbf),
            new Spec(0x07141dbf, "inputEmojiStatusCollectible", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collectible_id", LONG, "", 0, -1), new Field("until", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x0773c080),
            new Spec(0x0773c080, "inputAiComposeToneID", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x07761198),
            new Spec(0x07761198, "updateChatParticipants", new Field[] { new Field("participants", OBJECT, "ChatParticipants", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x07967d36),
            new Spec(0x07967d36, "account.getWallPapers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x07b68920),
            new Spec(0x07b68920, "updateChannelViewForumAsMessages", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x07df587c),
            new Spec(0x07df587c, "updateBotEditBusinessMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("connection_id", STRING, "", 0, -1), new Field("message", OBJECT, "Message", 0, -1), new Field("reply_to_message", OBJECT, "Message", 1, 0), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x081202c9),
            new Spec(0x081202c9, "messages.setChatTheme", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("theme", OBJECT, "InputChatTheme", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x081ccf4f),
            new Spec(0x081ccf4f, "textImage", new Field[] { new Field("document_id", LONG, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x08736a09),
            new Spec(0x08736a09, "channels.getFullChannel", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x087fc5e7),
            new Spec(0x087fc5e7, "bots.invokeWebViewCustomMethod", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("custom_method", STRING, "", 0, -1), new Field("params", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x08a4d87a),
            new Spec(0x08a4d87a, "help.promoData", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("proxy", TRUE, "", 1, 0), new Field("expires", INT, "", 0, -1), new Field("peer", OBJECT, "Peer", 1, 3), new Field("psa_type", STRING, "", 1, 1), new Field("psa_message", STRING, "", 1, 2), new Field("pending_suggestions", VECTOR, "STRING", 0, -1), new Field("dismissed_suggestions", VECTOR, "STRING", 0, -1), new Field("custom_pending_suggestion", OBJECT, "PendingSuggestion", 1, 4), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x08cbec07),
            new Spec(0x08cbec07, "messageMediaDice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("value", INT, "", 0, -1), new Field("emoticon", STRING, "", 0, -1), new Field("game_outcome", OBJECT, "messages.EmojiGameOutcome", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x08fc711d),
            new Spec(0x08fc711d, "account.getAccountTTL", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0923d8d1),
            new Spec(0x0923d8d1, "inputInvoiceStarGiftDropOriginalDetails", new Field[] { new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x093bcf34),
            new Spec(0x093bcf34, "emojiGroupPremium", new Field[] { new Field("title", STRING, "", 0, -1), new Field("icon_emoji_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x093fa0bf),
            new Spec(0x093fa0bf, "smsjobs.updateSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("allow_international", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x0949d9dc),
            new Spec(0x0949d9dc, "future_salt", new Field[] { new Field("valid_since", INT, "", 0, -1), new Field("valid_until", INT, "", 0, -1), new Field("salt", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x096a0e00),
            new Spec(0x096a0e00, "contacts.deleteContacts", new Field[] { new Field("id", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x096a18d5),
            new Spec(0x096a18d5, "upload.file", new Field[] { new Field("type", OBJECT, "storage.FileType", 0, -1), new Field("mtime", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x096b2aec),
            new Spec(0x096b2aec, "pageBlockHeading2", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x09c2dd95),
            new Spec(0x09c2dd95, "messages.setBotPrecheckoutResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("success", TRUE, "", 1, 1), new Field("query_id", LONG, "", 0, -1), new Field("error", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x09c469cd),
            new Spec(0x09c469cd, "inputBusinessIntro", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("sticker", OBJECT, "InputDocument", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x09cb7759),
            new Spec(0x09cb7759, "updateBotMessageReactions", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("reactions", VECTOR, "ReactionCount", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x09d05049),
            new Spec(0x09d05049, "userStatusEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x09e82039),
            new Spec(0x09e82039, "photos.updateProfilePhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("fallback", TRUE, "", 1, 0), new Field("bot", OBJECT, "InputUser", 1, 1), new Field("id", OBJECT, "InputPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0a1321f3),
            new Spec(0x0a1321f3, "botCommandScopePeerUser", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0a245dd3),
            new Spec(0x0a245dd3, "channels.deactivateAllUsernames", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0a339f0b),
            new Spec(0x0a339f0b, "messageReactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("min", TRUE, "", 1, 0), new Field("can_see_list", TRUE, "", 1, 2), new Field("reactions_as_tags", TRUE, "", 1, 3), new Field("results", VECTOR, "ReactionCount", 0, -1), new Field("recent_reactions", VECTOR, "MessagePeerReaction", 1, 1), new Field("top_reactors", VECTOR, "MessageReactor", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x0a4314f5),
            new Spec(0x0a4314f5, "messages.sendWebViewResultMessage", new Field[] { new Field("bot_query_id", STRING, "", 0, -1), new Field("result", OBJECT, "InputBotInlineResult", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0a4f63c0),
            new Spec(0x0a4f63c0, "storage.filePng", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0a617e7b),
            new Spec(0x0a617e7b, "botInlineMessageRichMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("rich_message", OBJECT, "RichMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0a7f6bbb),
            new Spec(0x0a7f6bbb, "channels.getChannels", new Field[] { new Field("id", VECTOR, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0a8eb2be),
            new Spec(0x0a8eb2be, "inputReportReasonIllegalDrugs", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0a9f2259),
            new Spec(0x0a9f2259, "destroy_auth_key_none", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0aa021e5),
            new Spec(0x0aa021e5, "starGiftAuctionRoundExtendable", new Field[] { new Field("num", INT, "", 0, -1), new Field("duration", INT, "", 0, -1), new Field("extend_top", INT, "", 0, -1), new Field("extend_window", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0aa1c39f),
            new Spec(0x0aa1c39f, "inputPaymentCredentialsApplePay", new Field[] { new Field("payment_data", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0ade1591),
            new Spec(0x0ade1591, "contacts.blocked", new Field[] { new Field("blocked", VECTOR, "PeerBlocked", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0ae30253),
            new Spec(0x0ae30253, "messageRange", new Field[] { new Field("min_id", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0b0bf0da),
            new Spec(0x0b0bf0da, "wallet.disableBackup", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("password", OBJECT, "InputCheckPasswordSRP", 1, 0), new Field("new_public_key", BYTES, "", 1, 1), new Field("proof", OBJECT, "WalletOwnershipProof", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x0b17f890),
            new Spec(0x0b17f890, "messages.recentStickersNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0b290c69),
            new Spec(0x0b290c69, "channels.convertToGigagroup", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0b297e9b),
            new Spec(0x0b297e9b, "stories.togglePinnedToTop", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0b783982),
            new Spec(0x0b783982, "updateGroupCallConnection", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("presentation", TRUE, "", 1, 0), new Field("params", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0ba52007),
            new Spec(0x0ba52007, "inputPrivacyValueDisallowContacts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0bb2d201),
            new Spec(0x0bb2d201, "updateStickerSetsOrder", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("masks", TRUE, "", 1, 0), new Field("emojis", TRUE, "", 1, 1), new Field("order", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0bd915c0),
            new Spec(0x0bd915c0, "starsTopupOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("extended", TRUE, "", 1, 1), new Field("stars", LONG, "", 0, -1), new Field("store_product", STRING, "", 1, 0), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0be77b4a),
            new Spec(0x0be77b4a, "premium.getMyBoosts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0c5181ac),
            new Spec(0x0c5181ac, "exportedChatlistInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("peers", VECTOR, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0c94511c),
            new Spec(0x0c94511c, "webViewMessageSent", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("msg_id", OBJECT, "InputBotInlineMessageID", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x0ca71d64),
            new Spec(0x0ca71d64, "bots.previewInfo", new Field[] { new Field("media", VECTOR, "BotPreviewMedia", 0, -1), new Field("lang_codes", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0cde3739),
            new Spec(0x0cde3739, "inputStickerSetAnimatedEmojiAnimations", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0d09e07b),
            new Spec(0x0d09e07b, "inputPrivacyValueAllowContacts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0d36bf79),
            new Spec(0x0d36bf79, "auth.checkRecoveryPassword", new Field[] { new Field("code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0d54b65d),
            new Spec(0x0d54b65d, "messages.foundStickerSetsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0d6b48f7),
            new Spec(0x0d6b48f7, "payments.getSuggestedStarRefBots", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("order_by_revenue", TRUE, "", 1, 0), new Field("order_by_date", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0d91a548),
            new Spec(0x0d91a548, "users.getUsers", new Field[] { new Field("id", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0d999256),
            new Spec(0x0d999256, "messageActionTopicCreate", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title_missing", TRUE, "", 1, 1), new Field("title", STRING, "", 0, -1), new Field("icon_color", INT, "", 0, -1), new Field("icon_emoji_id", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x0da082fe),
            new Spec(0x0da082fe, "videoSizeStickerMarkup", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("sticker_id", LONG, "", 0, -1), new Field("background_colors", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0dae54f8),
            new Spec(0x0dae54f8, "invokeWithApnsSecret", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("nonce", STRING, "", 0, -1), new Field("secret", STRING, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0dc27582),
            new Spec(0x0dc27582, "onrampProviderInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("supports_base_currencies", TRUE, "", 1, 0), new Field("supports_limits", TRUE, "", 1, 1), new Field("supports_quote", TRUE, "", 1, 2), new Field("id", STRING, "", 0, -1), new Field("name", STRING, "", 0, -1), new Field("crypto_currencies", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e0310d7),
            new Spec(0x0e0310d7, "help.recentMeUrls", new Field[] { new Field("urls", VECTOR, "RecentMeUrl", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e0c35af),
            new Spec(0x0e0c35af, "inputAiComposeToneSingleUse", new Field[] { new Field("custom_prompt", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e17e23c),
            new Spec(0x0e17e23c, "photoSizeEmpty", new Field[] { new Field("type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e1f6896),
            new Spec(0x0e1f6896, "wallet.tonConnectSessions", new Field[] { new Field("sessions", VECTOR, "TonConnectSession", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e306d3a),
            new Spec(0x0e306d3a, "messages.readHistory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e3b2d0c),
            new Spec(0x0e3b2d0c, "inlineQueryPeerTypeBotPM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0e5af939),
            new Spec(0x0e5af939, "messageReplyStoryHeader", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("story_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e6b76ae),
            new Spec(0x0e6b76ae, "channelAdminLogEventActionChangeLocation", new Field[] { new Field("prev_value", OBJECT, "ChannelLocation", 0, -1), new Field("new_value", OBJECT, "ChannelLocation", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e6e47c4),
            new Spec(0x0e6e47c4, "pageBlockBlockquoteBlocks", new Field[] { new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("caption", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e7841f0),
            new Spec(0x0e7841f0, "messages.reorderPinnedForumTopics", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("order", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0e8e37e5),
            new Spec(0x0e8e37e5, "suggestedPost", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("accepted", TRUE, "", 1, 1), new Field("rejected", TRUE, "", 1, 2), new Field("price", OBJECT, "StarsAmount", 1, 3), new Field("schedule_date", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x0ecc2618),
            new Spec(0x0ecc2618, "channels.toggleJoinRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("apply_to_invites", TRUE, "", 1, 1), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1), new Field("guard_bot", OBJECT, "InputUser", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x0ecf6736),
            new Spec(0x0ecf6736, "messages.getFeaturedEmojiStickers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0edc39d0),
            new Spec(0x0edc39d0, "smsjobs.isEligibleToJoin", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0efa0194),
            new Spec(0x0efa0194, "joinChatBotResultDeclined", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x0f578105),
            new Spec(0x0f578105, "account.getRecentEmojiStatuses", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0f635e1b),
            new Spec(0x0f635e1b, "messages.getInlineGameHighScores", new Field[] { new Field("id", OBJECT, "InputBotInlineMessageID", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x0f91b065),
            new Spec(0x0f91b065, "payments.exportInvoice", new Field[] { new Field("invoice_media", OBJECT, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1013fd9e),
            new Spec(0x1013fd9e, "contacts.deleteByPhones", new Field[] { new Field("phones", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x104fc872),
            new Spec(0x104fc872, "ephemeral.welcomeMessages", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("messages", VECTOR, "EphemeralMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x107e31a0),
            new Spec(0x107e31a0, "messages.searchSentMedia", new Field[] { new Field("q", STRING, "", 0, -1), new Field("filter", OBJECT, "MessagesFilter", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1081464c),
            new Spec(0x1081464c, "storage.fileWebp", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x108d941f),
            new Spec(0x108d941f, "updateChannelTooLong", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel_id", LONG, "", 0, -1), new Field("pts", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x10a698e8),
            new Spec(0x10a698e8, "smsjobs.getStatus", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x10ab6dc7),
            new Spec(0x10ab6dc7, "chatlists.exportedInvites", new Field[] { new Field("invites", VECTOR, "ExportedChatlistInvite", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x10cf3123),
            new Spec(0x10cf3123, "bots.setBotInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot", OBJECT, "InputUser", 1, 2), new Field("lang_code", STRING, "", 0, -1), new Field("name", STRING, "", 1, 3), new Field("about", STRING, "", 1, 0), new Field("description", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x10e6bd2c),
            new Spec(0x10e6bd2c, "channels.checkUsername", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x10e6e3a6),
            new Spec(0x10e6e3a6, "chatlists.exportedChatlistInvite", new Field[] { new Field("filter", OBJECT, "DialogFilter", 0, -1), new Field("invite", OBJECT, "ExportedChatlistInvite", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x10ea6184),
            new Spec(0x10ea6184, "messages.sendVote", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("options", VECTOR, "BYTES", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1117dd5f),
            new Spec(0x1117dd5f, "geoPointEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1142bd56),
            new Spec(0x1142bd56, "savedPhoneContact", new Field[] { new Field("phone", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x114ff30d),
            new Spec(0x114ff30d, "contacts.contactBirthdays", new Field[] { new Field("contacts", VECTOR, "ContactBirthday", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1158fe3e),
            new Spec(0x1158fe3e, "stories.allStoriesNotModified", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("state", STRING, "", 0, -1), new Field("stealth_mode", OBJECT, "StoriesStealthMode", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x11679fa7),
            new Spec(0x11679fa7, "inputBusinessChatLink", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 0), new Field("title", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x11965f3a),
            new Spec(0x11965f3a, "botInlineResult", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", STRING, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("title", STRING, "", 1, 1), new Field("description", STRING, "", 1, 2), new Field("url", STRING, "", 1, 3), new Field("thumb", OBJECT, "WebDocument", 1, 4), new Field("content", OBJECT, "WebDocument", 1, 5), new Field("send_message", OBJECT, "BotInlineMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x11aee065),
            new Spec(0x11aee065, "wallet.tonConnectGetPending", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dapp_client_id", STRING, "", 1, 0), new Field("session_id", LONG, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x11b58939),
            new Spec(0x11b58939, "documentAttributeAnimated", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x11c1a322),
            new Spec(0x11c1a322, "keyboardInlineButton", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("style", OBJECT, "KeyboardButtonStyle", 1, 10), new Field("text", STRING, "", 0, -1), new Field("type", OBJECT, "InlineButtonType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x11e831ee),
            new Spec(0x11e831ee, "channels.getInactiveChannels", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x120b1ab9),
            new Spec(0x120b1ab9, "businessWeeklyOpen", new Field[] { new Field("start_minute", INT, "", 0, -1), new Field("end_minute", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x12229264),
            new Spec(0x12229264, "tonConnectManifest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("name", STRING, "", 0, -1), new Field("icon", OBJECT, "WebDocument", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x124b1c00),
            new Spec(0x124b1c00, "stickers.renameStickerSet", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x126556c6),
            new Spec(0x126556c6, "tonConnectSession", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pending", TRUE, "", 1, 0), new Field("closing", TRUE, "", 1, 1), new Field("closed", TRUE, "", 1, 2), new Field("id", LONG, "", 0, -1), new Field("dapp_client_id", STRING, "", 0, -1), new Field("client_id", STRING, "", 1, 3), new Field("nonce", BYTES, "", 0, -1), new Field("manifest", OBJECT, "TonConnectManifest", 1, 4), new Field("manifest_error", INT, "", 1, 5), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x12b299d4),
            new Spec(0x12b299d4, "stickerPack", new Field[] { new Field("emoticon", STRING, "", 0, -1), new Field("documents", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x12b3ad31),
            new Spec(0x12b3ad31, "account.getNotifySettings", new Field[] { new Field("peer", OBJECT, "InputNotifyPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x12bcbd9a),
            new Spec(0x12bcbd9a, "updateNewEncryptedMessage", new Field[] { new Field("message", OBJECT, "EncryptedMessage", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x12cbf0c4),
            new Spec(0x12cbf0c4, "messages.reportSponsoredMessage", new Field[] { new Field("random_id", BYTES, "", 0, -1), new Field("option", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x12f12a07),
            new Spec(0x12f12a07, "updateBotInlineSend", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("query", STRING, "", 0, -1), new Field("geo", OBJECT, "GeoPoint", 1, 0), new Field("id", STRING, "", 0, -1), new Field("msg_id", OBJECT, "InputBotInlineMessageID", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x13005788),
            new Spec(0x13005788, "contacts.importContactToken", new Field[] { new Field("token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x131cc67f),
            new Spec(0x131cc67f, "inputPrivacyValueAllowUsers", new Field[] { new Field("users", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x13567e8a),
            new Spec(0x13567e8a, "pageBlockUnsupported", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1359f4e6),
            new Spec(0x1359f4e6, "bots.canSendMessage", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x13659eb0),
            new Spec(0x13659eb0, "starsTransaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("refund", TRUE, "", 1, 3), new Field("pending", TRUE, "", 1, 4), new Field("failed", TRUE, "", 1, 6), new Field("gift", TRUE, "", 1, 10), new Field("reaction", TRUE, "", 1, 11), new Field("stargift_upgrade", TRUE, "", 1, 18), new Field("business_transfer", TRUE, "", 1, 21), new Field("stargift_resale", TRUE, "", 1, 22), new Field("posts_search", TRUE, "", 1, 24), new Field("stargift_prepaid_upgrade", TRUE, "", 1, 25), new Field("stargift_drop_original_details", TRUE, "", 1, 26), new Field("phonegroup_message", TRUE, "", 1, 27), new Field("stargift_auction_bid", TRUE, "", 1, 28), new Field("offer", TRUE, "", 1, 29), new Field("id", STRING, "", 0, -1), new Field("amount", OBJECT, "StarsAmount", 0, -1), new Field("date", INT, "", 0, -1), new Field("peer", OBJECT, "StarsTransactionPeer", 0, -1), new Field("title", STRING, "", 1, 0), new Field("description", STRING, "", 1, 1), new Field("photo", OBJECT, "WebDocument", 1, 2), new Field("transaction_date", INT, "", 1, 5), new Field("transaction_url", STRING, "", 1, 5), new Field("bot_payload", BYTES, "", 1, 7), new Field("msg_id", INT, "", 1, 8), new Field("extended_media", VECTOR, "MessageMedia", 1, 9), new Field("subscription_period", INT, "", 1, 12), new Field("giveaway_post_id", INT, "", 1, 13), new Field("stargift", OBJECT, "StarGift", 1, 14), new Field("floodskip_number", INT, "", 1, 15), new Field("starref_commission_permille", INT, "", 1, 16), new Field("starref_peer", OBJECT, "Peer", 1, 17), new Field("starref_amount", OBJECT, "StarsAmount", 1, 17), new Field("paid_messages", INT, "", 1, 19), new Field("premium_gift_months", INT, "", 1, 20), new Field("ads_proceeds_from_date", INT, "", 1, 23), new Field("ads_proceeds_to_date", INT, "", 1, 23) }));
        BY_ID.put(Integer.valueOf(0x13704a7c),
            new Spec(0x13704a7c, "messages.forwardMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 5), new Field("background", TRUE, "", 1, 6), new Field("with_my_score", TRUE, "", 1, 8), new Field("drop_author", TRUE, "", 1, 11), new Field("drop_media_captions", TRUE, "", 1, 12), new Field("noforwards", TRUE, "", 1, 14), new Field("allow_paid_floodskip", TRUE, "", 1, 19), new Field("from_ephemeral", TRUE, "", 1, 25), new Field("from_peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1), new Field("random_id", VECTOR, "LONG", 0, -1), new Field("to_peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 9), new Field("reply_to", OBJECT, "InputReplyTo", 1, 22), new Field("schedule_date", INT, "", 1, 10), new Field("schedule_repeat_period", INT, "", 1, 24), new Field("send_as", OBJECT, "InputPeer", 1, 13), new Field("quick_reply_shortcut", OBJECT, "InputQuickReplyShortcut", 1, 17), new Field("effect", LONG, "", 1, 18), new Field("video_timestamp", INT, "", 1, 20), new Field("allow_paid_stars", LONG, "", 1, 21), new Field("suggested_post", OBJECT, "SuggestedPost", 1, 23) }));
        BY_ID.put(Integer.valueOf(0x137948a5),
            new Spec(0x137948a5, "auth.passwordRecovery", new Field[] { new Field("email_pattern", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x139f63fb),
            new Spec(0x139f63fb, "contacts.updateContactNote", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1), new Field("note", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x140502d1),
            new Spec(0x140502d1, "updateWebBrowserException", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("delete", TRUE, "", 1, 1), new Field("open_external_browser", BOOL, "", 1, 0), new Field("exception", OBJECT, "WebDomainException", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1427a5e1),
            new Spec(0x1427a5e1, "channelParticipantsBanned", new Field[] { new Field("q", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x14455871),
            new Spec(0x14455871, "mediaAreaSuggestedReaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("flipped", TRUE, "", 1, 1), new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x145ade0b),
            new Spec(0x145ade0b, "contact", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("mutual", BOOL, "", 0, -1) }));
    }

    private static void init1() {
        BY_ID.put(Integer.valueOf(0x147ee23c),
            new Spec(0x147ee23c, "messages.searchResultsCalendar", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inexact", TRUE, "", 1, 0), new Field("count", INT, "", 0, -1), new Field("min_date", INT, "", 0, -1), new Field("min_msg_id", INT, "", 0, -1), new Field("offset_id_offset", INT, "", 1, 1), new Field("periods", VECTOR, "SearchResultsCalendarPeriod", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x148677e2),
            new Spec(0x148677e2, "topPeerCategoryBotsInline", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x14967978),
            new Spec(0x14967978, "messages.uploadMedia", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("business_connection_id", STRING, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("media", OBJECT, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x14b0ed0c),
            new Spec(0x14b0ed0c, "phoneCallRequested", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 6), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1), new Field("g_a_hash", BYTES, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x14b85813),
            new Spec(0x14b85813, "updateBotMenuButton", new Field[] { new Field("bot_id", LONG, "", 0, -1), new Field("button", OBJECT, "BotMenuButton", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x15031189),
            new Spec(0x15031189, "pageListOrderedItemText", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("checkbox", TRUE, "", 1, 0), new Field("checked", TRUE, "", 1, 1), new Field("num", STRING, "", 1, 2), new Field("text", OBJECT, "RichText", 0, -1), new Field("value", INT, "", 1, 3), new Field("type", STRING, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x15051f54),
            new Spec(0x15051f54, "photos.photosSlice", new Field[] { new Field("count", INT, "", 0, -1), new Field("photos", VECTOR, "Photo", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1508b6af),
            new Spec(0x1508b6af, "messages.getEmojiKeywordsDifference", new Field[] { new Field("lang_code", STRING, "", 0, -1), new Field("from_version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1513e7b0),
            new Spec(0x1513e7b0, "payments.toggleStarGiftsPinnedToTop", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("stargift", VECTOR, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1527bcac),
            new Spec(0x1527bcac, "secureSecretSettings", new Field[] { new Field("secure_algo", OBJECT, "SecurePasswordKdfAlgo", 0, -1), new Field("secure_secret", BYTES, "", 0, -1), new Field("secure_secret_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x15590068),
            new Spec(0x15590068, "documentAttributeFilename", new Field[] { new Field("file_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1592b79d),
            new Spec(0x1592b79d, "updateWebViewResultSent", new Field[] { new Field("query_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x15ad9f64),
            new Spec(0x15ad9f64, "messages.setInlineGameScore", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("edit_message", TRUE, "", 1, 0), new Field("force", TRUE, "", 1, 1), new Field("id", OBJECT, "InputBotInlineMessageID", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("score", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x15ba6c40),
            new Spec(0x15ba6c40, "messages.dialogs", new Field[] { new Field("dialogs", VECTOR, "Dialog", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x15cefd00),
            new Spec(0x15cefd00, "messageActionChatAddUser", new Field[] { new Field("users", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x160544ca),
            new Spec(0x160544ca, "inputStorePaymentPremiumGiveaway", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("only_new_subscribers", TRUE, "", 1, 0), new Field("winners_are_visible", TRUE, "", 1, 3), new Field("boost_peer", OBJECT, "InputPeer", 0, -1), new Field("additional_peers", VECTOR, "InputPeer", 1, 1), new Field("countries_iso2", VECTOR, "STRING", 1, 2), new Field("prize_description", STRING, "", 1, 4), new Field("random_id", LONG, "", 0, -1), new Field("until_date", INT, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x16115a96),
            new Spec(0x16115a96, "pageBlockRelatedArticles", new Field[] { new Field("title", OBJECT, "RichText", 0, -1), new Field("articles", VECTOR, "PageRelatedArticle", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x161d9628),
            new Spec(0x161d9628, "topPeerCategoryChannels", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x16605e3e),
            new Spec(0x16605e3e, "messageActionManagedBotCreated", new Field[] { new Field("bot_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1662af0b),
            new Spec(0x1662af0b, "messages.historyImport", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x167fc0a1),
            new Spec(0x167fc0a1, "channels.toggleAutotranslation", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x16a4b93c),
            new Spec(0x16a4b93c, "storyItem", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 5), new Field("public", TRUE, "", 1, 7), new Field("close_friends", TRUE, "", 1, 8), new Field("min", TRUE, "", 1, 9), new Field("noforwards", TRUE, "", 1, 10), new Field("edited", TRUE, "", 1, 11), new Field("contacts", TRUE, "", 1, 12), new Field("selected_contacts", TRUE, "", 1, 13), new Field("out", TRUE, "", 1, 16), new Field("id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("from_id", OBJECT, "Peer", 1, 18), new Field("fwd_from", OBJECT, "StoryFwdHeader", 1, 17), new Field("expire_date", INT, "", 0, -1), new Field("caption", STRING, "", 1, 0), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("media", OBJECT, "MessageMedia", 0, -1), new Field("media_areas", VECTOR, "MediaArea", 1, 14), new Field("privacy", VECTOR, "PrivacyRule", 1, 2), new Field("views", OBJECT, "StoryViews", 1, 3), new Field("sent_reaction", OBJECT, "Reaction", 1, 15), new Field("albums", VECTOR, "INT", 1, 19), new Field("music", OBJECT, "Document", 1, 20) }));
        BY_ID.put(Integer.valueOf(0x16bf744e),
            new Spec(0x16bf744e, "sendMessageTypingAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x16d9703b),
            new Spec(0x16d9703b, "contactStatus", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("status", OBJECT, "UserStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x16fcc2cb),
            new Spec(0x16fcc2cb, "messages.getAttachMenuBots", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1710f156),
            new Spec(0x1710f156, "updateEncryptedChatTyping", new Field[] { new Field("chat_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1720b4d8),
            new Spec(0x1720b4d8, "messages.readPollVotes", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1759c560),
            new Spec(0x1759c560, "pageBlockPhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 1), new Field("photo_id", LONG, "", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1), new Field("url", STRING, "", 1, 0), new Field("webpage_id", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x175df251),
            new Spec(0x175df251, "messages.updatePinnedForumTopic", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("topic_id", INT, "", 0, -1), new Field("pinned", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x176f8ba1),
            new Spec(0x176f8ba1, "sendMessageGeoLocationAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1782cbb1),
            new Spec(0x1782cbb1, "aicompose.saveTone", new Field[] { new Field("tone", OBJECT, "InputAiComposeTone", 0, -1), new Field("unsave", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x17aeb75a),
            new Spec(0x17aeb75a, "bots.addPreviewMedia", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("media", OBJECT, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x17b7a20b),
            new Spec(0x17b7a20b, "updateAttachMenuBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x17c6b5f6),
            new Spec(0x17c6b5f6, "help.support", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("user", OBJECT, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x17d348d2),
            new Spec(0x17d348d2, "privacyKeyNoPaidMessages", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x17d493d5),
            new Spec(0x17d493d5, "channelForbidden", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("broadcast", TRUE, "", 1, 5), new Field("megagroup", TRUE, "", 1, 8), new Field("monoforum", TRUE, "", 1, 10), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("until_date", INT, "", 1, 16) }));
        BY_ID.put(Integer.valueOf(0x17d54f61),
            new Spec(0x17d54f61, "phone.receivedCall", new Field[] { new Field("peer", OBJECT, "InputPhoneCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x17d7f87b),
            new Spec(0x17d7f87b, "account.connectedBots", new Field[] { new Field("connected_bots", VECTOR, "ConnectedBot", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x17db940b),
            new Spec(0x17db940b, "botInlineMediaResult", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", STRING, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("photo", OBJECT, "Photo", 1, 0), new Field("document", OBJECT, "Document", 1, 1), new Field("title", STRING, "", 1, 2), new Field("description", STRING, "", 1, 3), new Field("send_message", OBJECT, "BotInlineMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x18201aae),
            new Spec(0x18201aae, "account.clearRecentEmojiStatuses", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1824e40b),
            new Spec(0x1824e40b, "updateNewStoryReaction", new Field[] { new Field("story_id", INT, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x182e6d6f),
            new Spec(0x182e6d6f, "account.getWebAuthorizations", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x183040d3),
            new Spec(0x183040d3, "channelAdminLogEventActionParticipantJoin", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1837c364),
            new Spec(0x1837c364, "inputEncryptedFileEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1839490f),
            new Spec(0x1839490f, "messages.sponsoredMessagesEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x184b35ce),
            new Spec(0x184b35ce, "inputPrivacyValueAllowAll", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1871be50),
            new Spec(0x1871be50, "messages.exportedChatInvite", new Field[] { new Field("invite", OBJECT, "ExportedChatInvite", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x187fa0ca),
            new Spec(0x187fa0ca, "secureValue", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("data", OBJECT, "SecureData", 1, 0), new Field("front_side", OBJECT, "SecureFile", 1, 1), new Field("reverse_side", OBJECT, "SecureFile", 1, 2), new Field("selfie", OBJECT, "SecureFile", 1, 3), new Field("translation", VECTOR, "SecureFile", 1, 6), new Field("files", VECTOR, "SecureFile", 1, 4), new Field("plain_data", OBJECT, "SecurePlainData", 1, 5), new Field("hash", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x18b7a10d),
            new Spec(0x18b7a10d, "dcOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("ipv6", TRUE, "", 1, 0), new Field("media_only", TRUE, "", 1, 1), new Field("tcpo_only", TRUE, "", 1, 2), new Field("cdn", TRUE, "", 1, 3), new Field("static", TRUE, "", 1, 4), new Field("this_port_only", TRUE, "", 1, 5), new Field("id", INT, "", 0, -1), new Field("ip_address", STRING, "", 0, -1), new Field("port", INT, "", 0, -1), new Field("secret", BYTES, "", 1, 10) }));
        BY_ID.put(Integer.valueOf(0x18cb9f78),
            new Spec(0x18cb9f78, "help.inviteText", new Field[] { new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x18d1cdc2),
            new Spec(0x18d1cdc2, "botInlineMessageMediaContact", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("phone_number", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("vcard", STRING, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x18dea0ac),
            new Spec(0x18dea0ac, "messages.getAvailableReactions", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x18e82537),
            new Spec(0x18e82537, "wallet.encryptedSecretPhrasePart", new Field[] { new Field("data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x19360dc0),
            new Spec(0x19360dc0, "updateFolderPeers", new Field[] { new Field("folder_peers", VECTOR, "FolderPeer", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x193b4417),
            new Spec(0x193b4417, "inputNotifyUsers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x19420af6),
            new Spec(0x19420af6, "keyboardInlineButtonRow", new Field[] { new Field("buttons", VECTOR, "KeyboardInlineButton", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x19887601),
            new Spec(0x19887601, "toncenter.streamingUrl", new Field[] { new Field("url", STRING, "", 0, -1), new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1991b13b),
            new Spec(0x1991b13b, "bots.popularAppBots", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x199fed96),
            new Spec(0x199fed96, "inputPollAnswer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("text", OBJECT, "TextWithEntities", 0, -1), new Field("media", OBJECT, "InputMedia", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x19a13f71),
            new Spec(0x19a13f71, "connectedBotStarRef", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoked", TRUE, "", 1, 1), new Field("url", STRING, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("commission_permille", INT, "", 0, -1), new Field("duration_months", INT, "", 1, 0), new Field("participants", LONG, "", 0, -1), new Field("revenue", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x19ba4a67),
            new Spec(0x19ba4a67, "account.getPaidMessagesRevenue", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("parent_peer", OBJECT, "InputPeer", 1, 0), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x19bc4b6d),
            new Spec(0x19bc4b6d, "messages.addPollAnswer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("answer", OBJECT, "PollAnswer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x19c2f763),
            new Spec(0x19c2f763, "updates.getDifference", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_limit", INT, "", 1, 1), new Field("pts_total_limit", INT, "", 1, 0), new Field("date", INT, "", 0, -1), new Field("qts", INT, "", 0, -1), new Field("qts_limit", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x19d8eb45),
            new Spec(0x19d8eb45, "stories.report", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1), new Field("option", BYTES, "", 0, -1), new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1a542004),
            new Spec(0x1a542004, "messages.translateRichMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 1, 0), new Field("id", VECTOR, "INT", 1, 0), new Field("text", VECTOR, "InputRichMessage", 1, 1), new Field("to_lang", STRING, "", 0, -1), new Field("tone", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x1a8afc7e),
            new Spec(0x1a8afc7e, "groupCallMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("from_admin", TRUE, "", 1, 1), new Field("id", INT, "", 0, -1), new Field("from_id", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 0, -1), new Field("paid_message_stars", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1ab21940),
            new Spec(0x1ab21940, "phone.getGroupCallStreamChannels", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1abfb575),
            new Spec(0x1abfb575, "inputDocument", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1ad4a04a),
            new Spec(0x1ad4a04a, "messages.updateDialogFilter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", INT, "", 0, -1), new Field("filter", OBJECT, "DialogFilter", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1ae373ac),
            new Spec(0x1ae373ac, "contacts.resetTopPeerRating", new Field[] { new Field("category", OBJECT, "TopPeerCategory", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b03f006),
            new Spec(0x1b03f006, "channelParticipantLeft", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b0c841a),
            new Spec(0x1b0c841a, "draftMessageEmpty", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("date", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1b0e4f07),
            new Spec(0x1b0e4f07, "starsRating", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("level", INT, "", 0, -1), new Field("current_level_stars", LONG, "", 0, -1), new Field("stars", LONG, "", 0, -1), new Field("next_level_stars", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1b2286b8),
            new Spec(0x1b2286b8, "reactionEmoji", new Field[] { new Field("emoticon", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b287353),
            new Spec(0x1b287353, "messageActionSecureValuesSentMe", new Field[] { new Field("values", VECTOR, "SecureValue", 0, -1), new Field("credentials", OBJECT, "SecureCredentialsEncrypted", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b3f4df7),
            new Spec(0x1b3f4df7, "updateEditChannelMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b3faa88),
            new Spec(0x1b3faa88, "account.sendConfirmPhoneCode", new Field[] { new Field("hash", STRING, "", 0, -1), new Field("settings", OBJECT, "CodeSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b7907ae),
            new Spec(0x1b7907ae, "channelAdminLogEventActionToggleInvites", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1b97dd66),
            new Spec(0x1b97dd66, "messageReplyHeader", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reply_to_scheduled", TRUE, "", 1, 2), new Field("forum_topic", TRUE, "", 1, 3), new Field("quote", TRUE, "", 1, 9), new Field("reply_to_ephemeral", TRUE, "", 1, 13), new Field("reply_to_msg_id", INT, "", 1, 4), new Field("reply_to_peer_id", OBJECT, "Peer", 1, 0), new Field("reply_from", OBJECT, "MessageFwdHeader", 1, 5), new Field("reply_media", OBJECT, "MessageMedia", 1, 8), new Field("reply_to_top_id", INT, "", 1, 1), new Field("quote_text", STRING, "", 1, 6), new Field("quote_entities", VECTOR, "MessageEntity", 1, 7), new Field("quote_offset", INT, "", 1, 10), new Field("todo_item_id", INT, "", 1, 11), new Field("poll_option", BYTES, "", 1, 12) }));
        BY_ID.put(Integer.valueOf(0x1bb00451),
            new Spec(0x1bb00451, "inputMessagesFilterPinned", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1bbcf300),
            new Spec(0x1bbcf300, "messages.getSearchCounters", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 2), new Field("top_msg_id", INT, "", 1, 0), new Field("filters", VECTOR, "MessagesFilter", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1bd54456),
            new Spec(0x1bd54456, "channelParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("subscription_until_date", INT, "", 1, 0), new Field("rank", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x1bf335b9),
            new Spec(0x1bf335b9, "updateStoryID", new Field[] { new Field("id", INT, "", 0, -1), new Field("random_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1bf89d74),
            new Spec(0x1bf89d74, "messages.sendMultiMedia", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 5), new Field("background", TRUE, "", 1, 6), new Field("clear_draft", TRUE, "", 1, 7), new Field("noforwards", TRUE, "", 1, 14), new Field("update_stickersets_order", TRUE, "", 1, 15), new Field("invert_media", TRUE, "", 1, 16), new Field("allow_paid_floodskip", TRUE, "", 1, 19), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 0), new Field("multi_media", VECTOR, "InputSingleMedia", 0, -1), new Field("schedule_date", INT, "", 1, 10), new Field("send_as", OBJECT, "InputPeer", 1, 13), new Field("quick_reply_shortcut", OBJECT, "InputQuickReplyShortcut", 1, 17), new Field("effect", LONG, "", 1, 18), new Field("allow_paid_stars", LONG, "", 1, 21) }));
        BY_ID.put(Integer.valueOf(0x1c199183),
            new Spec(0x1c199183, "account.wallPapersNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1c3db333),
            new Spec(0x1c3db333, "account.uploadTheme", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("file", OBJECT, "InputFile", 0, -1), new Field("thumb", OBJECT, "InputFile", 1, 0), new Field("file_name", STRING, "", 0, -1), new Field("mime_type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1c50d144),
            new Spec(0x1c50d144, "phone.leaveGroupCallPresentation", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1c570ed1),
            new Spec(0x1c570ed1, "webDocument", new Field[] { new Field("url", STRING, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("size", INT, "", 0, -1), new Field("mime_type", STRING, "", 0, -1), new Field("attributes", VECTOR, "DocumentAttribute", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1c6e1c11),
            new Spec(0x1c6e1c11, "chatPhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_video", TRUE, "", 1, 0), new Field("photo_id", LONG, "", 0, -1), new Field("stripped_thumb", BYTES, "", 1, 1), new Field("dc_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1c8bedf3),
            new Spec(0x1c8bedf3, "payments.getOnrampBaseCurrencies", new Field[] { new Field("provider", STRING, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1ca48f57),
            new Spec(0x1ca48f57, "inputChatPhotoEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1ca6ac0a),
            new Spec(0x1ca6ac0a, "phone.editGroupCallTitle", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1cc6e91f),
            new Spec(0x1cc6e91f, "inputSingleMedia", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("media", OBJECT, "InputMedia", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1ccb966a),
            new Spec(0x1ccb966a, "textPhone", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("phone", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1cd7bf0d),
            new Spec(0x1cd7bf0d, "inputPhotoEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1cf671a0),
            new Spec(0x1cf671a0, "inputStickerSetTonGifts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1cff7e08),
            new Spec(0x1cff7e08, "messages.getSplitRanges", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1d1b1245),
            new Spec(0x1d1b1245, "inputAppEvent", new Field[] { new Field("time", DOUBLE, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("peer", LONG, "", 0, -1), new Field("data", OBJECT, "JSONValue", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1d2652ee),
            new Spec(0x1d2652ee, "account.finishTakeoutSession", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("success", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1d73e7ea),
            new Spec(0x1d73e7ea, "messages.messages", new Field[] { new Field("messages", VECTOR, "Message", 0, -1), new Field("topics", VECTOR, "ForumTopic", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1d741ef7),
            new Spec(0x1d741ef7, "inputStorePaymentStarsGift", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("stars", LONG, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1d998733),
            new Spec(0x1d998733, "contactBirthday", new Field[] { new Field("contact_id", LONG, "", 0, -1), new Field("birthday", OBJECT, "Birthday", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1da448e2),
            new Spec(0x1da448e2, "inputUserFromMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1dab80b7),
            new Spec(0x1dab80b7, "payments.starsRevenueWithdrawalUrl", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1dbfeca0),
            new Spec(0x1dbfeca0, "phone.deleteGroupCallParticipantMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("report_spam", TRUE, "", 1, 0), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1dd840f5),
            new Spec(0x1dd840f5, "messages.getEmojiStickerGroups", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1df92984),
            new Spec(0x1df92984, "invokeWithGooglePlayIntegrity", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("nonce", STRING, "", 0, -1), new Field("token", STRING, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e109708),
            new Spec(0x1e109708, "account.paidMessagesRevenue", new Field[] { new Field("stars_amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e148390),
            new Spec(0x1e148390, "pageBlockKicker", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e1c7c45),
            new Spec(0x1e1c7c45, "encryptedChatDiscarded", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("history_deleted", TRUE, "", 1, 0), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e22c78d),
            new Spec(0x1e22c78d, "inputReportReasonViolence", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1e251c95),
            new Spec(0x1e251c95, "help.hidePromoData", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e297bfa),
            new Spec(0x1e297bfa, "updateMessageReactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("saved_peer_id", OBJECT, "Peer", 1, 1), new Field("reactions", OBJECT, "MessageReactions", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e36fded),
            new Spec(0x1e36fded, "inputPhoneCall", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e76a78c),
            new Spec(0x1e76a78c, "topPeerCategoryPhoneCalls", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1e8caaeb),
            new Spec(0x1e8caaeb, "postAddress", new Field[] { new Field("street_line1", STRING, "", 0, -1), new Field("street_line2", STRING, "", 0, -1), new Field("city", STRING, "", 0, -1), new Field("state", STRING, "", 0, -1), new Field("country_iso2", STRING, "", 0, -1), new Field("post_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1e91fc99),
            new Spec(0x1e91fc99, "messages.getSavedDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exclude_pinned", TRUE, "", 1, 0), new Field("parent_peer", OBJECT, "InputPeer", 1, 1), new Field("offset_date", INT, "", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_peer", OBJECT, "InputPeer", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1ea2fda7),
            new Spec(0x1ea2fda7, "updateBusinessBotCallbackQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("connection_id", STRING, "", 0, -1), new Field("message", OBJECT, "Message", 0, -1), new Field("reply_to_message", OBJECT, "Message", 1, 2), new Field("chat_instance", LONG, "", 0, -1), new Field("data", BYTES, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x1ecafa10),
            new Spec(0x1ecafa10, "inputInvoiceStarGiftAuctionBid", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hide_name", TRUE, "", 1, 0), new Field("update_bid", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 1, 3), new Field("gift_id", LONG, "", 0, -1), new Field("bid_amount", LONG, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x1edaaac2),
            new Spec(0x1edaaac2, "account.setGlobalPrivacySettings", new Field[] { new Field("settings", OBJECT, "GlobalPrivacySettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1f01c757),
            new Spec(0x1f01c757, "starGiftAttributeIdBackdrop", new Field[] { new Field("backdrop_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1f040578),
            new Spec(0x1f040578, "auth.cancelCode", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1f0c1ad9),
            new Spec(0x1f0c1ad9, "paidReactionPrivacyAnonymous", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1f2b0afd),
            new Spec(0x1f2b0afd, "updateNewMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1f307eb7),
            new Spec(0x1f307eb7, "account.savedRingtoneConverted", new Field[] { new Field("document", OBJECT, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1f4a0e87),
            new Spec(0x1f4a0e87, "payments.createStarGiftCollection", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("title", STRING, "", 0, -1), new Field("stargift", VECTOR, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1fa01357),
            new Spec(0x1fa01357, "inputAiComposeToneSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1fad68cd),
            new Spec(0x1fad68cd, "channelAdminLogEvent", new Field[] { new Field("id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("action", OBJECT, "ChannelAdminLogEventAction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x1fb33026),
            new Spec(0x1fb33026, "help.getNearestDc", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x1fd6f6c1),
            new Spec(0x1fd6f6c1, "pageBlockOrderedList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reversed", TRUE, "", 1, 2), new Field("items", VECTOR, "PageListOrderedItem", 0, -1), new Field("start", INT, "", 1, 0), new Field("type", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x1fe9a9bf),
            new Spec(0x1fe9a9bf, "inputAiComposeToneDefault", new Field[] { new Field("tone", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2000a518),
            new Spec(0x2000a518, "privacyKeyBirthday", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x20212ca8),
            new Spec(0x20212ca8, "photos.photo", new Field[] { new Field("photo", OBJECT, "Photo", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2025e697),
            new Spec(0x2025e697, "wallet.getProofChallenge", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x204bd158),
            new Spec(0x204bd158, "phone.exportedGroupCallInvite", new Field[] { new Field("link", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x20529438),
            new Spec(0x20529438, "updateUser", new Field[] { new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2064674e),
            new Spec(0x2064674e, "updates.channelDifference", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("final", TRUE, "", 1, 0), new Field("pts", INT, "", 0, -1), new Field("timeout", INT, "", 1, 1), new Field("new_messages", VECTOR, "Message", 0, -1), new Field("other_updates", VECTOR, "Update", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x206ad49e),
            new Spec(0x206ad49e, "paidReactionPrivacyDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x206ae6d1),
            new Spec(0x206ae6d1, "inputStarsTransaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("refund", TRUE, "", 1, 0), new Field("id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2085c238),
            new Spec(0x2085c238, "inputSavedStarGiftSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x208e68c9),
            new Spec(0x208e68c9, "inputMessageEntityMentionName", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x209b82db),
            new Spec(0x209b82db, "channelLocation", new Field[] { new Field("geo_point", OBJECT, "GeoPoint", 0, -1), new Field("address", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x20bcbba1),
            new Spec(0x20bcbba1, "updateNewEphemeralMessage", new Field[] { new Field("message", OBJECT, "EphemeralMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x21108ff7),
            new Spec(0x21108ff7, "businessRecipients", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("existing_chats", TRUE, "", 1, 0), new Field("new_chats", TRUE, "", 1, 1), new Field("contacts", TRUE, "", 1, 2), new Field("non_contacts", TRUE, "", 1, 3), new Field("exclude_selected", TRUE, "", 1, 5), new Field("users", VECTOR, "LONG", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x211a1788),
            new Spec(0x211a1788, "webPageEmpty", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("url", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x21202222),
            new Spec(0x21202222, "messages.getDialogUnreadMarks", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("parent_peer", OBJECT, "InputPeer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x213853a3),
            new Spec(0x213853a3, "bots.getAccessSettings", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2144ca19),
            new Spec(0x2144ca19, "rpc_error", new Field[] { new Field("error_code", INT, "", 0, -1), new Field("error_message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x21461b5d),
            new Spec(0x21461b5d, "privacyValueAllowBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x219c34e6),
            new Spec(0x219c34e6, "phone.toggleGroupCallStartSubscription", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("subscribed", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x21a548f3),
            new Spec(0x21a548f3, "messages.getEmojiProfilePhotoGroups", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x21a61057),
            new Spec(0x21a61057, "messages.appendTodoList", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("list", VECTOR, "TodoItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x21e753bc),
            new Spec(0x21e753bc, "upload.webFile", new Field[] { new Field("size", INT, "", 0, -1), new Field("mime_type", STRING, "", 0, -1), new Field("file_type", OBJECT, "storage.FileType", 0, -1), new Field("mtime", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x21ec5a5f),
            new Spec(0x21ec5a5f, "securePlainEmail", new Field[] { new Field("email", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x221bb5e4),
            new Spec(0x221bb5e4, "todoCompletion", new Field[] { new Field("id", INT, "", 0, -1), new Field("completed_by", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x222600ef),
            new Spec(0x222600ef, "messages.exportedChatInviteReplaced", new Field[] { new Field("invite", OBJECT, "ExportedChatInvite", 0, -1), new Field("new_invite", OBJECT, "ExportedChatInvite", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2244afad),
            new Spec(0x2244afad, "communities.peerLinkRequests", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("total_count", INT, "", 0, -1), new Field("requests", VECTOR, "CommunityPeerRequest", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x22567115),
            new Spec(0x22567115, "channels.checkSearchPostsFlood", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x226ccefb),
            new Spec(0x226ccefb, "auth.codeTypeFlashCall", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x226e6308),
            new Spec(0x226e6308, "notifyForumTopic", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2271f2bf),
            new Spec(0x2271f2bf, "inputMediaAreaChannelPost", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x227d824b),
            new Spec(0x227d824b, "payments.getSavedInfo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x22ddd30c),
            new Spec(0x22ddd30c, "messages.getReplies", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_date", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x23209745),
            new Spec(0x23209745, "channelAdminLogEventActionStartGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2331b22d),
            new Spec(0x2331b22d, "photoEmpty", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x236df622),
            new Spec(0x236df622, "emojiKeywordDeleted", new Field[] { new Field("keyword", STRING, "", 0, -1), new Field("emoticons", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x23734b06),
            new Spec(0x23734b06, "encryptedMessageService", new Field[] { new Field("random_id", LONG, "", 0, -1), new Field("chat_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2390fe44),
            new Spec(0x2390fe44, "auth.sentCodeSuccess", new Field[] { new Field("authorization", OBJECT, "auth.Authorization", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x23e91ba3),
            new Spec(0x23e91ba3, "botPreviewMedia", new Field[] { new Field("date", INT, "", 0, -1), new Field("media", OBJECT, "MessageMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2433dc92),
            new Spec(0x2433dc92, "payments.getStarsRevenueWithdrawalUrl", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("ton", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("amount", LONG, "", 1, 1), new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x243e1c66),
            new Spec(0x243e1c66, "sendMessageUploadRoundAction", new Field[] { new Field("progress", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2442485e),
            new Spec(0x2442485e, "account.setAccountTTL", new Field[] { new Field("ttl", OBJECT, "AccountDaysTTL", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x24596d41),
            new Spec(0x24596d41, "inputQuickReplyShortcut", new Field[] { new Field("shortcut", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2478d1cc),
            new Spec(0x2478d1cc, "payments.getPaymentReceipt", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x24c26789),
            new Spec(0x24c26789, "textAutoPhone", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x24e6818d),
            new Spec(0x24e6818d, "upload.getWebFile", new Field[] { new Field("location", OBJECT, "InputWebFileLocation", 0, -1), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x250dbaf8),
            new Spec(0x250dbaf8, "starsTransactionPeerPremiumBot", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x257e962b),
            new Spec(0x257e962b, "premiumGiftCodeOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("users", INT, "", 0, -1), new Field("months", INT, "", 0, -1), new Field("store_product", STRING, "", 1, 0), new Field("store_quantity", INT, "", 1, 1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x25972bcb),
            new Spec(0x25972bcb, "sendMessageEmojiInteraction", new Field[] { new Field("emoticon", STRING, "", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("interaction", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x25a71742),
            new Spec(0x25a71742, "channels.getChannelRecommendations", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel", OBJECT, "InputChannel", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x25ae8f4a),
            new Spec(0x25ae8f4a, "payments.refundStarsCharge", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("charge_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x25b3eac7),
            new Spec(0x25b3eac7, "stories.getAlbums", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x25f324f7),
            new Spec(0x25f324f7, "updateChannelReadMessagesContents", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel_id", LONG, "", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("saved_peer_id", OBJECT, "Peer", 1, 1), new Field("messages", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x26219a58),
            new Spec(0x26219a58, "help.peerColorSet", new Field[] { new Field("colors", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2633421b),
            new Spec(0x2633421b, "chatFull", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_set_username", TRUE, "", 1, 7), new Field("has_scheduled", TRUE, "", 1, 8), new Field("translations_disabled", TRUE, "", 1, 19), new Field("has_welcome_messages", TRUE, "", 1, 21), new Field("id", LONG, "", 0, -1), new Field("about", STRING, "", 0, -1), new Field("participants", OBJECT, "ChatParticipants", 0, -1), new Field("chat_photo", OBJECT, "Photo", 1, 2), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1), new Field("exported_invite", OBJECT, "ExportedChatInvite", 1, 13), new Field("bot_info", VECTOR, "BotInfo", 1, 3), new Field("pinned_msg_id", INT, "", 1, 6), new Field("folder_id", INT, "", 1, 11), new Field("call", OBJECT, "InputGroupCall", 1, 12), new Field("ttl_period", INT, "", 1, 14), new Field("groupcall_default_join_as", OBJECT, "Peer", 1, 15), new Field("theme_emoticon", STRING, "", 1, 16), new Field("requests_pending", INT, "", 1, 17), new Field("recent_requesters", VECTOR, "LONG", 1, 17), new Field("available_reactions", OBJECT, "ChatReactions", 1, 18), new Field("reactions_limit", INT, "", 1, 20) }));
        BY_ID.put(Integer.valueOf(0x2661bf09),
            new Spec(0x2661bf09, "updatePhoneCallSignalingData", new Field[] { new Field("phone_call_id", LONG, "", 0, -1), new Field("data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x269dc2c1),
            new Spec(0x269dc2c1, "messages.requestWebView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("from_bot_menu", TRUE, "", 1, 4), new Field("silent", TRUE, "", 1, 5), new Field("compact", TRUE, "", 1, 7), new Field("fullscreen", TRUE, "", 1, 8), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("url", STRING, "", 1, 1), new Field("start_param", STRING, "", 1, 3), new Field("theme_params", OBJECT, "DataJSON", 1, 2), new Field("platform", STRING, "", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 0), new Field("send_as", OBJECT, "InputPeer", 1, 13) }));
        BY_ID.put(Integer.valueOf(0x269e3643),
            new Spec(0x269e3643, "messages.viewSponsoredMessage", new Field[] { new Field("random_id", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x269e9a49),
            new Spec(0x269e9a49, "messages.transcribeAudio", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x26ae0971),
            new Spec(0x26ae0971, "channelAdminLogEventActionToggleSignatures", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x26b5dde6),
            new Spec(0x26b5dde6, "messages.messageEditData", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("caption", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x26cf8950),
            new Spec(0x26cf8950, "messages.getDhConfig", new Field[] { new Field("version", INT, "", 0, -1), new Field("random_length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x26ffde7d),
            new Spec(0x26ffde7d, "updateDialogFilter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", INT, "", 0, -1), new Field("filter", OBJECT, "DialogFilter", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x2714d86c),
            new Spec(0x2714d86c, "account.checkUsername", new Field[] { new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2757ba54),
            new Spec(0x2757ba54, "payments.getPremiumGiftCodeOptions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("boost_peer", OBJECT, "InputPeer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x276d3ec6),
            new Spec(0x276d3ec6, "msg_detailed_info", new Field[] { new Field("msg_id", LONG, "", 0, -1), new Field("answer_msg_id", LONG, "", 0, -1), new Field("bytes", INT, "", 0, -1), new Field("status", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x277add7e),
            new Spec(0x277add7e, "phone.saveCallDebug", new Field[] { new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("debug", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x278f2868),
            new Spec(0x278f2868, "channelAdminLogEventActionSendMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x27bb1adc),
            new Spec(0x27bb1adc, "inputNotifyCommunity", new Field[] { new Field("community", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x27bcbbfc),
            new Spec(0x27bcbbfc, "inputPeerChannel", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
    }

    private static void init2() {
        BY_ID.put(Integer.valueOf(0x28373599),
            new Spec(0x28373599, "updateUserEmojiStatus", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("emoji_status", OBJECT, "EmojiStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x283bd312),
            new Spec(0x283bd312, "updateBotPurchasedPaidMedia", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("payload", STRING, "", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x284b3639),
            new Spec(0x284b3639, "stickers.checkShortName", new Field[] { new Field("short_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x28a20571),
            new Spec(0x28a20571, "messageEntityCode", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x28e16cc8),
            new Spec(0x28e16cc8, "stories.getStoriesViews", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x28ecf961),
            new Spec(0x28ecf961, "help.termsOfServiceUpdate", new Field[] { new Field("expires", INT, "", 0, -1), new Field("terms_of_service", OBJECT, "help.TermsOfService", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2955bc38),
            new Spec(0x2955bc38, "inlineButtonTypeCallback", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("requires_password", TRUE, "", 1, 0), new Field("data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x29562865),
            new Spec(0x29562865, "chatEmpty", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2979eeb2),
            new Spec(0x2979eeb2, "langPackStringDeleted", new Field[] { new Field("key", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2999beed),
            new Spec(0x2999beed, "stats.pollStats", new Field[] { new Field("votes_graph", OBJECT, "StatsGraph", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x29a8962c),
            new Spec(0x29a8962c, "contacts.blockFromReplies", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("delete_message", TRUE, "", 1, 0), new Field("delete_history", TRUE, "", 1, 1), new Field("report_spam", TRUE, "", 1, 2), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x29b1c66a),
            new Spec(0x29b1c66a, "messages.searchStickers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("emojis", TRUE, "", 1, 0), new Field("q", STRING, "", 0, -1), new Field("emoticon", STRING, "", 0, -1), new Field("lang_code", VECTOR, "STRING", 0, -1), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x29be5899),
            new Spec(0x29be5899, "inputTakeoutFileLocation", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x29d0f5ee),
            new Spec(0x29d0f5ee, "inputStickerSetEmojiDefaultStatuses", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x29ee847a),
            new Spec(0x29ee847a, "messages.search", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("q", STRING, "", 0, -1), new Field("from_id", OBJECT, "InputPeer", 1, 0), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 2), new Field("saved_reaction", VECTOR, "Reaction", 1, 3), new Field("top_msg_id", INT, "", 1, 1), new Field("filter", OBJECT, "MessagesFilter", 0, -1), new Field("min_date", INT, "", 0, -1), new Field("max_date", INT, "", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2a17bf5c),
            new Spec(0x2a17bf5c, "updateUserTyping", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("action", OBJECT, "SendMessageAction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2a2a697c),
            new Spec(0x2a2a697c, "payments.saveStarGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unsave", TRUE, "", 1, 0), new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2a3dc7ac),
            new Spec(0x2a3dc7ac, "groupCallParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("muted", TRUE, "", 1, 0), new Field("left", TRUE, "", 1, 1), new Field("can_self_unmute", TRUE, "", 1, 2), new Field("just_joined", TRUE, "", 1, 4), new Field("versioned", TRUE, "", 1, 5), new Field("min", TRUE, "", 1, 8), new Field("muted_by_you", TRUE, "", 1, 9), new Field("volume_by_admin", TRUE, "", 1, 10), new Field("self", TRUE, "", 1, 12), new Field("video_joined", TRUE, "", 1, 15), new Field("peer", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("active_date", INT, "", 1, 3), new Field("source", INT, "", 0, -1), new Field("volume", INT, "", 1, 7), new Field("about", STRING, "", 1, 11), new Field("raise_hand_rating", LONG, "", 1, 13), new Field("video", OBJECT, "GroupCallParticipantVideo", 1, 6), new Field("presentation", OBJECT, "GroupCallParticipantVideo", 1, 14), new Field("paid_stars_total", LONG, "", 1, 16) }));
        BY_ID.put(Integer.valueOf(0x2a862092),
            new Spec(0x2a862092, "messages.uploadImportedMedia", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("import_id", LONG, "", 0, -1), new Field("file_name", STRING, "", 0, -1), new Field("media", OBJECT, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2ad93719),
            new Spec(0x2ad93719, "messages.dialogFilters", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("tags_enabled", TRUE, "", 1, 0), new Field("filters", VECTOR, "DialogFilter", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2aee9191),
            new Spec(0x2aee9191, "smsjobs.status", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("allow_international", TRUE, "", 1, 0), new Field("recent_sent", INT, "", 0, -1), new Field("recent_since", INT, "", 0, -1), new Field("recent_remains", INT, "", 0, -1), new Field("total_sent", INT, "", 0, -1), new Field("total_since", INT, "", 0, -1), new Field("last_gift_slug", STRING, "", 1, 1), new Field("terms_url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2b96cd1b),
            new Spec(0x2b96cd1b, "account.emailVerified", new Field[] { new Field("email", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2ba1f5ce),
            new Spec(0x2ba1f5ce, "help.peerColorsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2be0dfa4),
            new Spec(0x2be0dfa4, "jsonNumber", new Field[] { new Field("value", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2bf40ccc),
            new Spec(0x2bf40ccc, "account.updateTheme", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("format", STRING, "", 0, -1), new Field("theme", OBJECT, "InputTheme", 0, -1), new Field("slug", STRING, "", 1, 0), new Field("title", STRING, "", 1, 1), new Field("document", OBJECT, "InputDocument", 1, 2), new Field("settings", VECTOR, "InputThemeSettings", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x2c084dc1),
            new Spec(0x2c084dc1, "updateStoriesStealthMode", new Field[] { new Field("stealth_mode", OBJECT, "StoriesStealthMode", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2c11c0d7),
            new Spec(0x2c11c0d7, "messages.searchCustomEmoji", new Field[] { new Field("emoticon", STRING, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2c221edd),
            new Spec(0x2c221edd, "messages.dhConfig", new Field[] { new Field("g", INT, "", 0, -1), new Field("p", BYTES, "", 0, -1), new Field("version", INT, "", 0, -1), new Field("random", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2c4ada50),
            new Spec(0x2c4ada50, "stories.getPeerStories", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2c63a72b),
            new Spec(0x2c63a72b, "stories.editStory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("media", OBJECT, "InputMedia", 1, 0), new Field("media_areas", VECTOR, "MediaArea", 1, 3), new Field("caption", STRING, "", 1, 1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("privacy_rules", VECTOR, "InputPrivacyRule", 1, 2), new Field("music", OBJECT, "InputDocument", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x2c800be5),
            new Spec(0x2c800be5, "contacts.importContacts", new Field[] { new Field("contacts", VECTOR, "InputContact", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2c85094c),
            new Spec(0x2c85094c, "auth.finishFirebasePnvLogin", new Field[] { new Field("google_token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2c8f2a25),
            new Spec(0x2c8f2a25, "messageActionSuggestBirthday", new Field[] { new Field("birthday", OBJECT, "Birthday", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2ca4fdf8),
            new Spec(0x2ca4fdf8, "privacyKeyStarGiftsAutoSave", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2ca51fd1),
            new Spec(0x2ca51fd1, "help.getTermsOfServiceUpdate", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2cb51097),
            new Spec(0x2cb51097, "messages.favedStickers", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("packs", VECTOR, "StickerPack", 0, -1), new Field("stickers", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2d0135b3),
            new Spec(0x2d0135b3, "bots.deletePreviewMedia", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("media", VECTOR, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2d01b9ef),
            new Spec(0x2d01b9ef, "account.resetWebAuthorization", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2d03522f),
            new Spec(0x2d03522f, "payments.sendPaymentForm", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("form_id", LONG, "", 0, -1), new Field("invoice", OBJECT, "InputInvoice", 0, -1), new Field("requested_info_id", STRING, "", 1, 0), new Field("shipping_option_id", STRING, "", 1, 1), new Field("credentials", OBJECT, "InputPaymentCredentials", 0, -1), new Field("tip_amount", LONG, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x2db873a9),
            new Spec(0x2db873a9, "auth.importWebTokenAuthorization", new Field[] { new Field("api_id", INT, "", 0, -1), new Field("api_hash", STRING, "", 0, -1), new Field("web_auth_token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2dbf3432),
            new Spec(0x2dbf3432, "phone.groupCallStreamRtmpUrl", new Field[] { new Field("url", STRING, "", 0, -1), new Field("key", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2dc173c8),
            new Spec(0x2dc173c8, "inputEncryptedFileBigUploaded", new Field[] { new Field("id", LONG, "", 0, -1), new Field("parts", INT, "", 0, -1), new Field("key_fingerprint", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2dca16b8),
            new Spec(0x2dca16b8, "payments.getStarsTransactionsByID", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("ton", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "InputStarsTransaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2dd14edc),
            new Spec(0x2dd14edc, "stickerSet", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("archived", TRUE, "", 1, 1), new Field("official", TRUE, "", 1, 2), new Field("masks", TRUE, "", 1, 3), new Field("emojis", TRUE, "", 1, 7), new Field("text_color", TRUE, "", 1, 9), new Field("channel_emoji_status", TRUE, "", 1, 10), new Field("creator", TRUE, "", 1, 11), new Field("installed_date", INT, "", 1, 0), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("short_name", STRING, "", 0, -1), new Field("thumbs", VECTOR, "PhotoSize", 1, 4), new Field("thumb_dc_id", INT, "", 1, 4), new Field("thumb_version", INT, "", 1, 4), new Field("thumb_document_id", LONG, "", 1, 8), new Field("count", INT, "", 0, -1), new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2de11aae),
            new Spec(0x2de11aae, "emojiStatusEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2df5fc0a),
            new Spec(0x2df5fc0a, "channelAdminLogEventActionDefaultBannedRights", new Field[] { new Field("prev_banned_rights", OBJECT, "ChatBannedRights", 0, -1), new Field("new_banned_rights", OBJECT, "ChatBannedRights", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2e2e8734),
            new Spec(0x2e2e8734, "contacts.block", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("my_stories_from", TRUE, "", 1, 0), new Field("id", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2e59d922),
            new Spec(0x2e59d922, "inputReportReasonPornography", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2e6eab1a),
            new Spec(0x2e6eab1a, "starsSubscription", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("canceled", TRUE, "", 1, 0), new Field("can_refulfill", TRUE, "", 1, 1), new Field("missing_balance", TRUE, "", 1, 2), new Field("bot_canceled", TRUE, "", 1, 7), new Field("id", STRING, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("until_date", INT, "", 0, -1), new Field("pricing", OBJECT, "StarsSubscriptionPricing", 0, -1), new Field("chat_invite_hash", STRING, "", 1, 3), new Field("title", STRING, "", 1, 4), new Field("photo", OBJECT, "WebDocument", 1, 5), new Field("invoice_slug", STRING, "", 1, 6) }));
        BY_ID.put(Integer.valueOf(0x2e79d779),
            new Spec(0x2e79d779, "payments.getBankCardData", new Field[] { new Field("number", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2e7b4543),
            new Spec(0x2e7b4543, "account.getCollectibleEmojiStatuses", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2e94c3e7),
            new Spec(0x2e94c3e7, "webPageAttributeStory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("id", INT, "", 0, -1), new Field("story", OBJECT, "StoryItem", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x2ea2c0d4),
            new Spec(0x2ea2c0d4, "auth.authorization", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("setup_password_required", TRUE, "", 1, 1), new Field("otherwise_relogin_days", INT, "", 1, 1), new Field("tmp_sessions", INT, "", 1, 0), new Field("future_auth_token", BYTES, "", 1, 2), new Field("user", OBJECT, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2eb1b658),
            new Spec(0x2eb1b658, "starGiftAttributeCounter", new Field[] { new Field("attribute", OBJECT, "StarGiftAttributeId", 0, -1), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2ec0533f),
            new Spec(0x2ec0533f, "messageMediaVenue", new Field[] { new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("title", STRING, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("venue_id", STRING, "", 0, -1), new Field("venue_type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2ec29951),
            new Spec(0x2ec29951, "payments.getOnrampAvailability", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("base_currency", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x2ecd56cd),
            new Spec(0x2ecd56cd, "messages.getEmojiStatusGroups", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2ed82995),
            new Spec(0x2ed82995, "payments.starGifts", new Field[] { new Field("hash", INT, "", 0, -1), new Field("gifts", VECTOR, "StarGift", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2eeed1c4),
            new Spec(0x2eeed1c4, "starGiftAuctionUserState", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("returned", TRUE, "", 1, 1), new Field("bid_amount", LONG, "", 1, 0), new Field("bid_date", INT, "", 1, 0), new Field("min_bid_amount", LONG, "", 1, 0), new Field("bid_peer", OBJECT, "Peer", 1, 0), new Field("acquired_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2efe1722),
            new Spec(0x2efe1722, "phone.confirmCall", new Field[] { new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("g_a", BYTES, "", 0, -1), new Field("key_fingerprint", LONG, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2f2ba99f),
            new Spec(0x2f2ba99f, "updateChannelWebPage", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("webpage", OBJECT, "WebPage", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2f2f21bf),
            new Spec(0x2f2f21bf, "updateReadHistoryOutbox", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2f453e49),
            new Spec(0x2f453e49, "inputPrivacyValueAllowCloseFriends", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2f58683c),
            new Spec(0x2f58683c, "pageListItemText", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("checkbox", TRUE, "", 1, 0), new Field("checked", TRUE, "", 1, 1), new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2f65c8e4),
            new Spec(0x2f65c8e4, "dialogPeerCommunity", new Field[] { new Field("community_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2f67a72f),
            new Spec(0x2f67a72f, "keyboardButton", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("style", OBJECT, "KeyboardButtonStyle", 1, 10), new Field("text", STRING, "", 0, -1), new Field("type", OBJECT, "ButtonType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x2f6cb2ab),
            new Spec(0x2f6cb2ab, "botCommandScopeDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x2f98c3d5),
            new Spec(0x2f98c3d5, "messages.createForumTopic", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title_missing", TRUE, "", 1, 4), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("title", STRING, "", 0, -1), new Field("icon_color", INT, "", 1, 0), new Field("icon_emoji_id", LONG, "", 1, 3), new Field("random_id", LONG, "", 0, -1), new Field("send_as", OBJECT, "InputPeer", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x2fe601d3),
            new Spec(0x2fe601d3, "channelParticipantCreator", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("admin_rights", OBJECT, "ChatAdminRights", 0, -1), new Field("rank", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x2ffe2f7a),
            new Spec(0x2ffe2f7a, "messageActionConferenceCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("missed", TRUE, "", 1, 0), new Field("active", TRUE, "", 1, 1), new Field("video", TRUE, "", 1, 4), new Field("call_id", LONG, "", 0, -1), new Field("duration", INT, "", 1, 2), new Field("other_participants", VECTOR, "Peer", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x30535af5),
            new Spec(0x30535af5, "phoneCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("p2p_allowed", TRUE, "", 1, 5), new Field("video", TRUE, "", 1, 6), new Field("conference_supported", TRUE, "", 1, 8), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1), new Field("g_a_or_b", BYTES, "", 0, -1), new Field("key_fingerprint", LONG, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1), new Field("connections", VECTOR, "PhoneConnection", 0, -1), new Field("start_date", INT, "", 0, -1), new Field("custom_parameters", OBJECT, "DataJSON", 1, 7) }));
        BY_ID.put(Integer.valueOf(0x3081ed9d),
            new Spec(0x3081ed9d, "inlineQueryPeerTypeSameBotPM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x30a6ec7e),
            new Spec(0x30a6ec7e, "messages.stickers", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("stickers", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x30d9743c),
            new Spec(0x30d9743c, "currencyRate", new Field[] { new Field("currency", STRING, "", 0, -1), new Field("rate", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x30eb63f0),
            new Spec(0x30eb63f0, "stories.canSendStory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x30f443db),
            new Spec(0x30f443db, "updateRecentEmojiStatuses", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x310240cc),
            new Spec(0x310240cc, "auctionBidLevel", new Field[] { new Field("pos", INT, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x313a9547),
            new Spec(0x313a9547, "starGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("limited", TRUE, "", 1, 0), new Field("sold_out", TRUE, "", 1, 1), new Field("birthday", TRUE, "", 1, 2), new Field("require_premium", TRUE, "", 1, 7), new Field("limited_per_user", TRUE, "", 1, 8), new Field("peer_color_available", TRUE, "", 1, 10), new Field("auction", TRUE, "", 1, 11), new Field("id", LONG, "", 0, -1), new Field("sticker", OBJECT, "Document", 0, -1), new Field("stars", LONG, "", 0, -1), new Field("availability_remains", INT, "", 1, 0), new Field("availability_total", INT, "", 1, 0), new Field("availability_resale", LONG, "", 1, 4), new Field("convert_stars", LONG, "", 0, -1), new Field("first_sale_date", INT, "", 1, 1), new Field("last_sale_date", INT, "", 1, 1), new Field("upgrade_stars", LONG, "", 1, 3), new Field("resell_min_stars", LONG, "", 1, 4), new Field("title", STRING, "", 1, 5), new Field("released_by", OBJECT, "Peer", 1, 6), new Field("per_user_total", INT, "", 1, 8), new Field("per_user_remains", INT, "", 1, 8), new Field("locked_until_date", INT, "", 1, 9), new Field("auction_slug", STRING, "", 1, 11), new Field("gifts_per_round", INT, "", 1, 11), new Field("auction_start_date", INT, "", 1, 11), new Field("upgrade_variants", INT, "", 1, 12), new Field("background", OBJECT, "StarGiftBackground", 1, 13) }));
        BY_ID.put(Integer.valueOf(0x313bc7f8),
            new Spec(0x313bc7f8, "updateShortMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("out", TRUE, "", 1, 1), new Field("mentioned", TRUE, "", 1, 4), new Field("media_unread", TRUE, "", 1, 5), new Field("silent", TRUE, "", 1, 13), new Field("id", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("fwd_from", OBJECT, "MessageFwdHeader", 1, 2), new Field("via_bot_id", LONG, "", 1, 11), new Field("reply_to", OBJECT, "MessageReplyHeader", 1, 3), new Field("entities", VECTOR, "MessageEntity", 1, 7), new Field("ttl_period", INT, "", 1, 25) }));
        BY_ID.put(Integer.valueOf(0x31518e9b),
            new Spec(0x31518e9b, "messageActionRequestedPeer", new Field[] { new Field("button_id", INT, "", 0, -1), new Field("peers", VECTOR, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x315a4974),
            new Spec(0x315a4974, "users.usersSlice", new Field[] { new Field("count", INT, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x316ce548),
            new Spec(0x316ce548, "account.setReactionsNotifySettings", new Field[] { new Field("settings", OBJECT, "ReactionsNotifySettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x31813cd8),
            new Spec(0x31813cd8, "bots.editAccessSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("restricted", TRUE, "", 1, 0), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("add_users", VECTOR, "InputUser", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x31a2a35e),
            new Spec(0x31a2a35e, "bots.requestWebViewButton", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("button", OBJECT, "KeyboardButton", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x31bb5d52),
            new Spec(0x31bb5d52, "channelAdminLogEventActionChangeWallpaper", new Field[] { new Field("prev_value", OBJECT, "WallPaper", 0, -1), new Field("new_value", OBJECT, "WallPaper", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x31bd492d),
            new Spec(0x31bd492d, "messages.messageReactionsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("reactions", VECTOR, "MessagePeerReaction", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x31c1c44f),
            new Spec(0x31c1c44f, "messages.getMessageReadParticipants", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x31c24808),
            new Spec(0x31c24808, "updateStickerSets", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("masks", TRUE, "", 1, 0), new Field("emojis", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x31c48347),
            new Spec(0x31c48347, "messageActionGiftCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_giveaway", TRUE, "", 1, 0), new Field("unclaimed", TRUE, "", 1, 5), new Field("boost_peer", OBJECT, "Peer", 1, 1), new Field("days", INT, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("currency", STRING, "", 1, 2), new Field("amount", LONG, "", 1, 2), new Field("crypto_currency", STRING, "", 1, 3), new Field("crypto_amount", LONG, "", 1, 3), new Field("message", OBJECT, "TextWithEntities", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x31cad303),
            new Spec(0x31cad303, "webPageAttributeStarGiftCollection", new Field[] { new Field("icons", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3259950a),
            new Spec(0x3259950a, "messages.savedReactionTags", new Field[] { new Field("tags", VECTOR, "SavedReactionTag", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x327a30cb),
            new Spec(0x327a30cb, "messages.saveGif", new Field[] { new Field("id", OBJECT, "InputDocument", 0, -1), new Field("unsave", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x32ca960f),
            new Spec(0x32ca960f, "messageEntitySpoiler", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x32d439a4),
            new Spec(0x32d439a4, "messages.sendEncryptedService", new Field[] { new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x32da9e9c),
            new Spec(0x32da9e9c, "inputStickerSetItem", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("document", OBJECT, "InputDocument", 0, -1), new Field("emoji", STRING, "", 0, -1), new Field("mask_coords", OBJECT, "MaskCoords", 1, 0), new Field("keywords", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x3334b0f0),
            new Spec(0x3334b0f0, "inputSecureFileUploaded", new Field[] { new Field("id", LONG, "", 0, -1), new Field("parts", INT, "", 0, -1), new Field("md5_checksum", STRING, "", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("secret", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3354678f),
            new Spec(0x3354678f, "updatePtsChanged", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3371c354),
            new Spec(0x3371c354, "messages.peerDialogs", new Field[] { new Field("dialogs", VECTOR, "Dialog", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("state", OBJECT, "updates.State", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3380c786),
            new Spec(0x3380c786, "inputBotInlineMessageMediaAuto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invert_media", TRUE, "", 1, 3), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x338bcf1c),
            new Spec(0x338bcf1c, "wallet.tonConnectRegisterKey", new Field[] { new Field("session_id", LONG, "", 0, -1), new Field("client_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x339bef6c),
            new Spec(0x339bef6c, "requestPeerTypeBroadcast", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("has_username", BOOL, "", 1, 3), new Field("user_admin_rights", OBJECT, "ChatAdminRights", 1, 1), new Field("bot_admin_rights", OBJECT, "ChatAdminRights", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x33db32f8),
            new Spec(0x33db32f8, "messages.translateResult", new Field[] { new Field("result", VECTOR, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x33ddf480),
            new Spec(0x33ddf480, "channels.getAdminLog", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("q", STRING, "", 0, -1), new Field("events_filter", OBJECT, "ChannelAdminLogEventsFilter", 1, 0), new Field("admins", VECTOR, "InputUser", 1, 1), new Field("max_id", LONG, "", 0, -1), new Field("min_id", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x33f0ea47),
            new Spec(0x33f0ea47, "secureCredentialsEncrypted", new Field[] { new Field("data", BYTES, "", 0, -1), new Field("hash", BYTES, "", 0, -1), new Field("secret", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3407e51b),
            new Spec(0x3407e51b, "stickerSetMultiCovered", new Field[] { new Field("set", OBJECT, "StickerSet", 0, -1), new Field("covers", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x34090c3b),
            new Spec(0x34090c3b, "messages.initHistoryImport", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("file", OBJECT, "InputFile", 0, -1), new Field("media_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3417d728),
            new Spec(0x3417d728, "inputPaymentCredentials", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("save", TRUE, "", 1, 0), new Field("data", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3441fd1c),
            new Spec(0x3441fd1c, "wallet.nftItem", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collection_address", STRING, "", 1, 0), new Field("address", STRING, "", 0, -1), new Field("owner_address", STRING, "", 0, -1), new Field("index", STRING, "", 0, -1), new Field("name", STRING, "", 1, 1), new Field("description", STRING, "", 1, 2), new Field("image", OBJECT, "WebDocument", 1, 3), new Field("image_small", OBJECT, "WebDocument", 1, 4), new Field("content_url", OBJECT, "WebDocument", 1, 5), new Field("lottie", OBJECT, "WebDocument", 1, 6), new Field("attributes", VECTOR, "wallet.NftAttribute", 1, 7), new Field("extra", OBJECT, "DataJSON", 1, 8) }));
        BY_ID.put(Integer.valueOf(0x34566b6a),
            new Spec(0x34566b6a, "pageTableCell", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("header", TRUE, "", 1, 0), new Field("align_center", TRUE, "", 1, 3), new Field("align_right", TRUE, "", 1, 4), new Field("valign_middle", TRUE, "", 1, 5), new Field("valign_bottom", TRUE, "", 1, 6), new Field("text", OBJECT, "RichText", 1, 7), new Field("colspan", INT, "", 1, 1), new Field("rowspan", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x3458f9c8),
            new Spec(0x3458f9c8, "chatThemeUniqueGift", new Field[] { new Field("gift", OBJECT, "StarGift", 0, -1), new Field("theme_settings", VECTOR, "ThemeSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x34636dd8),
            new Spec(0x34636dd8, "secureValueErrorTranslationFiles", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", VECTOR, "BYTES", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x347773c5),
            new Spec(0x347773c5, "pong", new Field[] { new Field("msg_id", LONG, "", 0, -1), new Field("ping_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x34a2f297),
            new Spec(0x34a2f297, "users.savedMusic", new Field[] { new Field("count", INT, "", 0, -1), new Field("documents", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x34c3bb53),
            new Spec(0x34c3bb53, "channelParticipantAdmin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_edit", TRUE, "", 1, 0), new Field("self", TRUE, "", 1, 1), new Field("user_id", LONG, "", 0, -1), new Field("inviter_id", LONG, "", 1, 1), new Field("promoted_by", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_rights", OBJECT, "ChatAdminRights", 0, -1), new Field("rank", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x34e793f1),
            new Spec(0x34e793f1, "inputInvoiceChatInviteSubscription", new Field[] { new Field("hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x34fdc5c3),
            new Spec(0x34fdc5c3, "messages.getBotApp", new Field[] { new Field("app", OBJECT, "InputBotApp", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3501c08a),
            new Spec(0x3501c08a, "bots.addUsername", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3504914f),
            new Spec(0x3504914f, "updateDialogFilters", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3514b3de),
            new Spec(0x3514b3de, "channels.updateUsername", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35436bbc),
            new Spec(0x35436bbc, "messages.declineUrlAuth", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x354a9b09),
            new Spec(0x354a9b09, "botInlineMessageMediaInvoice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("shipping_address_requested", TRUE, "", 1, 1), new Field("test", TRUE, "", 1, 3), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "WebDocument", 1, 0), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x35553762),
            new Spec(0x35553762, "textAnchor", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35705b8a),
            new Spec(0x35705b8a, "messages.searchStickerSets", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exclude_featured", TRUE, "", 1, 0), new Field("q", STRING, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3583fcb1),
            new Spec(0x3583fcb1, "channels.setMainProfileTab", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("tab", OBJECT, "ProfileTab", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35a0e062),
            new Spec(0x35a0e062, "messages.getEmojiKeywords", new Field[] { new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35a95cb9),
            new Spec(0x35a95cb9, "inputPeerChat", new Field[] { new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35a9e0d5),
            new Spec(0x35a9e0d5, "account.getChannelRestrictedStatusEmojis", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35ddd674),
            new Spec(0x35ddd674, "messages.editChatPhoto", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("photo", OBJECT, "InputChatPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x35e410a8),
            new Spec(0x35e410a8, "messages.stickerSetInstallResultArchive", new Field[] { new Field("sets", VECTOR, "StickerSetCovered", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3630b85a),
            new Spec(0x3630b85a, "sendMessageTextDraftAction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_stop", TRUE, "", 1, 0), new Field("keep_on_stop", TRUE, "", 1, 1), new Field("random_id", LONG, "", 0, -1), new Field("text", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x363293ae),
            new Spec(0x363293ae, "dialogFilterDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3637e05b),
            new Spec(0x3637e05b, "messages.getSavedReactionTags", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 1, 0), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x36437737),
            new Spec(0x36437737, "starGiftAttributeRarity", new Field[] { new Field("permille", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3645230a),
            new Spec(0x3645230a, "pollAnswerVoters", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("chosen", TRUE, "", 1, 0), new Field("correct", TRUE, "", 1, 1), new Field("option", BYTES, "", 0, -1), new Field("voters", INT, "", 1, 2), new Field("recent_voters", VECTOR, "Peer", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x365275f2),
            new Spec(0x365275f2, "invokeWithMessagesRange", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("range", OBJECT, "MessageRange", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x36585ea4),
            new Spec(0x36585ea4, "messages.botCallbackAnswer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("alert", TRUE, "", 1, 1), new Field("has_url", TRUE, "", 1, 3), new Field("native_ui", TRUE, "", 1, 4), new Field("message", STRING, "", 1, 0), new Field("url", STRING, "", 1, 2), new Field("cache_time", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3660c311),
            new Spec(0x3660c311, "phoneCallAccepted", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 6), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1), new Field("g_b", BYTES, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x367544db),
            new Spec(0x367544db, "channels.deleteParticipantHistory", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x367617d3),
            new Spec(0x367617d3, "messages.forumTopics", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("order_by_create_date", TRUE, "", 1, 0), new Field("count", INT, "", 0, -1), new Field("topics", VECTOR, "ForumTopic", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("pts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x36a73f77),
            new Spec(0x36a73f77, "messages.readMessageContents", new Field[] { new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x36c6019a),
            new Spec(0x36c6019a, "peerChat", new Field[] { new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x36e5bf4d),
            new Spec(0x36e5bf4d, "messages.readMentions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x36f8c871),
            new Spec(0x36f8c871, "documentEmpty", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x37096c70),
            new Spec(0x37096c70, "auth.recoverPassword", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("code", STRING, "", 0, -1), new Field("new_settings", OBJECT, "account.PasswordInputSettings", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x37148dbb),
            new Spec(0x37148dbb, "payments.getPaymentForm", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invoice", OBJECT, "InputInvoice", 0, -1), new Field("theme_params", OBJECT, "DataJSON", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x37257e99),
            new Spec(0x37257e99, "inputPeerPhotoFileLocation", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("big", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("photo_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x372efcd0),
            new Spec(0x372efcd0, "wallPaperSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("blur", TRUE, "", 1, 1), new Field("motion", TRUE, "", 1, 2), new Field("background_color", INT, "", 1, 0), new Field("second_background_color", INT, "", 1, 4), new Field("third_background_color", INT, "", 1, 5), new Field("fourth_background_color", INT, "", 1, 6), new Field("intensity", INT, "", 1, 3), new Field("rotation", INT, "", 1, 4), new Field("emoticon", STRING, "", 1, 7) }));
        BY_ID.put(Integer.valueOf(0x37381085),
            new Spec(0x37381085, "mediaAreaUrl", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x374fa7ad),
            new Spec(0x374fa7ad, "payments.checkCanSendGiftResultOk", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x374fef40),
            new Spec(0x374fef40, "stats.getStoryStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3751b49e),
            new Spec(0x3751b49e, "inputMessagesFilterMusic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x37982646),
            new Spec(0x37982646, "ipPortSecret", new Field[] { new Field("ipv4", INT, "", 0, -1), new Field("port", INT, "", 0, -1), new Field("secret", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x37c1011c),
            new Spec(0x37c1011c, "chatPhotoEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3823cc40),
            new Spec(0x3823cc40, "inputPrivacyKeyAbout", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x38641628),
            new Spec(0x38641628, "messages.stickerSetInstallResultSuccess", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x38df3532),
            new Spec(0x38df3532, "account.updateDeviceLocked", new Field[] { new Field("period", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x38e79fde),
            new Spec(0x38e79fde, "chatParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("inviter_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("rank", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x38fa3ba3),
            new Spec(0x38fa3ba3, "pageBlockDocument", new Field[] { new Field("document_id", LONG, "", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x38fe25b7),
            new Spec(0x38fe25b7, "updateEncryptedMessagesRead", new Field[] { new Field("chat_id", INT, "", 0, -1), new Field("max_date", INT, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x390d5c5e),
            new Spec(0x390d5c5e, "auth.loginTokenSuccess", new Field[] { new Field("authorization", OBJECT, "auth.Authorization", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3920e6ef),
            new Spec(0x3920e6ef, "messages.getAdminsWithInvites", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x392718f8),
            new Spec(0x392718f8, "messages.saveRecentSticker", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("attached", TRUE, "", 1, 0), new Field("id", OBJECT, "InputDocument", 0, -1), new Field("unsave", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x39461db2),
            new Spec(0x39461db2, "messages.getRecentReactions", new Field[] { new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x39491cc8),
            new Spec(0x39491cc8, "privacyKeyPhoneP2P", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x394e7f21),
            new Spec(0x394e7f21, "payments.starsRevenueAdsAccountUrl", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x395f69da),
            new Spec(0x395f69da, "upload.getCdnFile", new Field[] { new Field("file_token", BYTES, "", 0, -1), new Field("offset", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x396ca5fc),
            new Spec(0x396ca5fc, "stats.broadcastStats", new Field[] { new Field("period", OBJECT, "StatsDateRangeDays", 0, -1), new Field("followers", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("views_per_post", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("shares_per_post", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("reactions_per_post", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("views_per_story", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("shares_per_story", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("reactions_per_story", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("enabled_notifications", OBJECT, "StatsPercentValue", 0, -1), new Field("growth_graph", OBJECT, "StatsGraph", 0, -1), new Field("followers_graph", OBJECT, "StatsGraph", 0, -1), new Field("mute_graph", OBJECT, "StatsGraph", 0, -1), new Field("top_hours_graph", OBJECT, "StatsGraph", 0, -1), new Field("interactions_graph", OBJECT, "StatsGraph", 0, -1), new Field("iv_interactions_graph", OBJECT, "StatsGraph", 0, -1), new Field("views_by_source_graph", OBJECT, "StatsGraph", 0, -1), new Field("new_followers_by_source_graph", OBJECT, "StatsGraph", 0, -1), new Field("languages_graph", OBJECT, "StatsGraph", 0, -1), new Field("reactions_by_emotion_graph", OBJECT, "StatsGraph", 0, -1), new Field("story_interactions_graph", OBJECT, "StatsGraph", 0, -1), new Field("story_reactions_by_emotion_graph", OBJECT, "StatsGraph", 0, -1), new Field("recent_posts_interactions", VECTOR, "PostInteractionCounters", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x39854d1f),
            new Spec(0x39854d1f, "premium.getUserBoosts", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x399674dc),
            new Spec(0x399674dc, "messageActionPollDeleteAnswer", new Field[] { new Field("answer", OBJECT, "PollAnswer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x39a51dfb),
            new Spec(0x39a51dfb, "updateNewScheduledMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x39c67432),
            new Spec(0x39c67432, "updateSavedReactionTags", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x39f23300),
            new Spec(0x39f23300, "pageBlockCover", new Field[] { new Field("cover", OBJECT, "PageBlock", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3a20ecb8),
            new Spec(0x3a20ecb8, "inputMessagesFilterChatPhotos", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3a5869ec),
            new Spec(0x3a5869ec, "account.getTheme", new Field[] { new Field("format", STRING, "", 0, -1), new Field("theme", OBJECT, "InputTheme", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3a912d4a),
            new Spec(0x3a912d4a, "passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow", new Field[] { new Field("salt1", BYTES, "", 0, -1), new Field("salt2", BYTES, "", 0, -1), new Field("g", INT, "", 0, -1), new Field("p", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3aae0528),
            new Spec(0x3aae0528, "starGiftAuctionRound", new Field[] { new Field("num", INT, "", 0, -1), new Field("duration", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3b1adf37),
            new Spec(0x3b1adf37, "messages.reorderPinnedDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force", TRUE, "", 1, 0), new Field("folder_id", INT, "", 0, -1), new Field("order", VECTOR, "InputDialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3b6d152e),
            new Spec(0x3b6d152e, "users.userFull", new Field[] { new Field("full_user", OBJECT, "UserFull", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3b7d0ea6),
            new Spec(0x3b7d0ea6, "messages.getFutureChatCreatorAfterLeave", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
    }

    private static void init3() {
        BY_ID.put(Integer.valueOf(0x3ba47bff),
            new Spec(0x3ba47bff, "messages.getForumTopics", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("q", STRING, "", 1, 0), new Field("offset_date", INT, "", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_topic", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3bb3b94a),
            new Spec(0x3bb3b94a, "inputPhoto", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3bb842ac),
            new Spec(0x3bb842ac, "outboxReadDate", new Field[] { new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3bcab5b4),
            new Spec(0x3bcab5b4, "inlineButtonTypeWebView", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3bcbf734),
            new Spec(0x3bcbf734, "dh_gen_ok", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce_hash1", INT128, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3bd2b4a0),
            new Spec(0x3bd2b4a0, "phone.acceptCall", new Field[] { new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("g_b", BYTES, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3bd4b7c2),
            new Spec(0x3bd4b7c2, "inputReplyToMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reply_to_msg_id", INT, "", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("reply_to_peer_id", OBJECT, "InputPeer", 1, 1), new Field("quote_text", STRING, "", 1, 2), new Field("quote_entities", VECTOR, "MessageEntity", 1, 3), new Field("quote_offset", INT, "", 1, 4), new Field("monoforum_peer_id", OBJECT, "InputPeer", 1, 5), new Field("todo_item_id", INT, "", 1, 6), new Field("poll_option", BYTES, "", 1, 7) }));
        BY_ID.put(Integer.valueOf(0x3c134d7b),
            new Spec(0x3c134d7b, "messageActionSetMessagesTTL", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("period", INT, "", 0, -1), new Field("auto_setting_from", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x3c20629f),
            new Spec(0x3c20629f, "inlineBotSwitchPM", new Field[] { new Field("text", STRING, "", 0, -1), new Field("start_param", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c27b78f),
            new Spec(0x3c27b78f, "inputPasskeyCredentialPublicKey", new Field[] { new Field("id", STRING, "", 0, -1), new Field("raw_id", STRING, "", 0, -1), new Field("response", OBJECT, "InputPasskeyResponse", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c2884c1),
            new Spec(0x3c2884c1, "textUrl", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("url", STRING, "", 0, -1), new Field("webpage_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c29a3e2),
            new Spec(0x3c29a3e2, "pageBlockThinking", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c4301c0),
            new Spec(0x3c4301c0, "attachMenuBots", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("bots", VECTOR, "AttachMenuBot", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c479971),
            new Spec(0x3c479971, "phone.declineConferenceCallInvite", new Field[] { new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c4f04d8),
            new Spec(0x3c4f04d8, "botCommandScopeUsers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3c5693e9),
            new Spec(0x3c5693e9, "inputTheme", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c60b621),
            new Spec(0x3c60b621, "bots.exportedBotToken", new Field[] { new Field("token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3c6a84d4),
            new Spec(0x3c6a84d4, "p_q_inner_data_temp", new Field[] { new Field("pq", STRING, "", 0, -1), new Field("p", STRING, "", 0, -1), new Field("q", STRING, "", 0, -1), new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce", INT256, "", 0, -1), new Field("expires_in", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3cbc93f8),
            new Spec(0x3cbc93f8, "chatParticipants", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("participants", VECTOR, "ChatParticipant", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3cc04740),
            new Spec(0x3cc04740, "messages.deleteQuickReplyShortcut", new Field[] { new Field("shortcut_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3cd2a36a),
            new Spec(0x3cd2a36a, "textTonAddress", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3cd623ec),
            new Spec(0x3cd623ec, "urlAuthResultRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("request_write_access", TRUE, "", 1, 0), new Field("request_phone_number", TRUE, "", 1, 1), new Field("match_codes_first", TRUE, "", 1, 5), new Field("is_app", TRUE, "", 1, 6), new Field("bot", OBJECT, "User", 0, -1), new Field("domain", STRING, "", 0, -1), new Field("browser", STRING, "", 1, 2), new Field("platform", STRING, "", 1, 2), new Field("ip", STRING, "", 1, 2), new Field("region", STRING, "", 1, 2), new Field("match_codes", VECTOR, "STRING", 1, 3), new Field("user_id_hint", LONG, "", 1, 4), new Field("verified_app_name", STRING, "", 1, 7) }));
        BY_ID.put(Integer.valueOf(0x3cd930b7),
            new Spec(0x3cd930b7, "channels.setEmojiStickers", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3d662b7b),
            new Spec(0x3d662b7b, "privacyKeyPhoneCall", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3d6ce850),
            new Spec(0x3d6ce850, "messages.getSponsoredMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x3d8de0f9),
            new Spec(0x3d8de0f9, "bots.resetBotCommands", new Field[] { new Field("scope", OBJECT, "BotCommandScope", 0, -1), new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3dac6a00),
            new Spec(0x3dac6a00, "secureValueTypePassport", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3dbb5986),
            new Spec(0x3dbb5986, "auth.sentCodeTypeApp", new Field[] { new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3dbc0415),
            new Spec(0x3dbc0415, "messages.acceptEncryption", new Field[] { new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("g_b", BYTES, "", 0, -1), new Field("key_fingerprint", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3dc0f114),
            new Spec(0x3dc0f114, "help.getRecentMeUrls", new Field[] { new Field("referer", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3dc4b4f0),
            new Spec(0x3dc4b4f0, "invokeAfterMsgs", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("msg_ids", VECTOR, "LONG", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3dcd7a87),
            new Spec(0x3dcd7a87, "inputBotInlineMessageText", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 0), new Field("invert_media", TRUE, "", 1, 3), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x3dda5451),
            new Spec(0x3dda5451, "updateChatParticipantAdd", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("inviter_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3de1dfed),
            new Spec(0x3de1dfed, "payments.starGiftUpgradePreview", new Field[] { new Field("sample_attributes", VECTOR, "StarGiftAttribute", 0, -1), new Field("prices", VECTOR, "StarGiftUpgradePrice", 0, -1), new Field("next_prices", VECTOR, "StarGiftUpgradePrice", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3dea5b03),
            new Spec(0x3dea5b03, "account.saveRingtone", new Field[] { new Field("id", OBJECT, "InputDocument", 0, -1), new Field("unsave", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3ded6320),
            new Spec(0x3ded6320, "messageMediaEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3e050d0f),
            new Spec(0x3e050d0f, "updateQuickReplyMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e0b5b6a),
            new Spec(0x3e0b5b6a, "searchPostsFlood", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_is_free", TRUE, "", 1, 0), new Field("total_daily", INT, "", 0, -1), new Field("remains", INT, "", 0, -1), new Field("wait_till", INT, "", 1, 1), new Field("stars_amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e0bdd7c),
            new Spec(0x3e0bdd7c, "account.updateUsername", new Field[] { new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e11affb),
            new Spec(0x3e11affb, "updates.channelDifferenceEmpty", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("final", TRUE, "", 1, 0), new Field("pts", INT, "", 0, -1), new Field("timeout", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x3e24e573),
            new Spec(0x3e24e573, "payments.bankCardData", new Field[] { new Field("title", STRING, "", 0, -1), new Field("open_urls", VECTOR, "BankCardOpenUrl", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e2793ba),
            new Spec(0x3e2793ba, "messageActionNoForwardsRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("expired", TRUE, "", 1, 0), new Field("prev_value", BOOL, "", 0, -1), new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e3bcf2f),
            new Spec(0x3e3bcf2f, "channels.sponsoredMessageReportResultAdsHidden", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3e63935c),
            new Spec(0x3e63935c, "inputPasskeyResponseRegister", new Field[] { new Field("client_data", OBJECT, "DataJSON", 0, -1), new Field("attestation_data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e72ba19),
            new Spec(0x3e72ba19, "auth.logOut", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3e77f614),
            new Spec(0x3e77f614, "inputInvoicePremiumAuthCode", new Field[] { new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e7f6847),
            new Spec(0x3e7f6847, "channelAdminLogEventActionParticipantVolume", new Field[] { new Field("participant", OBJECT, "GroupCallParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3e81e078),
            new Spec(0x3e81e078, "requestPeerTypeCreateBot", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot_managed", TRUE, "", 1, 0), new Field("suggested_name", STRING, "", 1, 1), new Field("suggested_username", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x3e85e92c),
            new Spec(0x3e85e92c, "updateDeleteGroupCallMessages", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("messages", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3ea9feb1),
            new Spec(0x3ea9feb1, "channelAdminLogEventActionChangeEmojiStatus", new Field[] { new Field("prev_value", OBJECT, "EmojiStatus", 0, -1), new Field("new_value", OBJECT, "EmojiStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3eadb1bb),
            new Spec(0x3eadb1bb, "messages.checkChatInvite", new Field[] { new Field("hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3f3e00dc),
            new Spec(0x3f3e00dc, "payments.getOnrampProviders", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("crypto_currency", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x3f64c076),
            new Spec(0x3f64c076, "messages.reportReaction", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("reaction_peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3f6d7b68),
            new Spec(0x3f6d7b68, "jsonNull", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3fa33fcf),
            new Spec(0x3fa33fcf, "inlineButtonTypeUserProfile", new Field[] { new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3fa464c8),
            new Spec(0x3fa464c8, "ephemeral.getCallbackAnswer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("data", BYTES, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x3fc18057),
            new Spec(0x3fc18057, "inputStorePaymentAuthCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("restore", TRUE, "", 1, 0), new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("premium_days", INT, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3fc9053b),
            new Spec(0x3fc9053b, "exportedStoryLink", new Field[] { new Field("link", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3fd863d1),
            new Spec(0x3fd863d1, "botCommandScopePeerAdmins", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3fe268fe),
            new Spec(0x3fe268fe, "inputButtonTypeRequestPeer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("name_requested", TRUE, "", 1, 0), new Field("username_requested", TRUE, "", 1, 1), new Field("photo_requested", TRUE, "", 1, 2), new Field("button_id", INT, "", 0, -1), new Field("peer_type", OBJECT, "RequestPeerType", 0, -1), new Field("max_quantity", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3fedc75f),
            new Spec(0x3fedc75f, "help.getDeepLinkInfo", new Field[] { new Field("path", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x3fedd339),
            new Spec(0x3fedd339, "true", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x3ff75734),
            new Spec(0x3ff75734, "channels.toggleForum", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1), new Field("tabs", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x40181ffe),
            new Spec(0x40181ffe, "inputPhotoFileLocation", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1), new Field("thumb_size", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x402b4495),
            new Spec(0x402b4495, "inputMessageReadMetric", new Field[] { new Field("msg_id", INT, "", 0, -1), new Field("view_id", LONG, "", 0, -1), new Field("time_in_view_ms", INT, "", 0, -1), new Field("active_time_in_view_ms", INT, "", 0, -1), new Field("height_to_viewport_ratio_permille", INT, "", 0, -1), new Field("seen_range_ratio_permille", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x40582bb2),
            new Spec(0x40582bb2, "channels.setDiscussionGroup", new Field[] { new Field("broadcast", OBJECT, "InputChannel", 0, -1), new Field("group", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x405fef0d),
            new Spec(0x405fef0d, "inputMediaInvoice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "InputWebDocument", 1, 0), new Field("invoice", OBJECT, "Invoice", 0, -1), new Field("payload", BYTES, "", 0, -1), new Field("provider", STRING, "", 1, 3), new Field("provider_data", OBJECT, "DataJSON", 0, -1), new Field("start_param", STRING, "", 1, 1), new Field("extended_media", OBJECT, "InputMedia", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x4067c5e6),
            new Spec(0x4067c5e6, "messages.reportReadMetrics", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("metrics", VECTOR, "InputMessageReadMetric", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x40bc6f52),
            new Spec(0x40bc6f52, "storage.filePartial", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x40d13c0e),
            new Spec(0x40d13c0e, "stickerSetFullCovered", new Field[] { new Field("set", OBJECT, "StickerSet", 0, -1), new Field("packs", VECTOR, "StickerPack", 0, -1), new Field("keywords", VECTOR, "StickerKeyword", 0, -1), new Field("documents", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x40f48462),
            new Spec(0x40f48462, "account.changeAuthorizationSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("confirmed", TRUE, "", 1, 3), new Field("hash", LONG, "", 0, -1), new Field("encrypted_requests_disabled", BOOL, "", 1, 0), new Field("call_requests_disabled", BOOL, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x410a134e),
            new Spec(0x410a134e, "channelAdminLogEventActionExportedInviteRevoke", new Field[] { new Field("invite", OBJECT, "ExportedChatInvite", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4119b95e),
            new Spec(0x4119b95e, "inputReplyToEphemeralMessage", new Field[] { new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x41248786),
            new Spec(0x41248786, "phone.saveCallLog", new Field[] { new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("file", OBJECT, "InputFile", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x413a3e73),
            new Spec(0x413a3e73, "messages.requestSimpleWebView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("from_switch_webview", TRUE, "", 1, 1), new Field("from_side_menu", TRUE, "", 1, 2), new Field("compact", TRUE, "", 1, 7), new Field("fullscreen", TRUE, "", 1, 8), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("url", STRING, "", 1, 3), new Field("start_param", STRING, "", 1, 4), new Field("theme_params", OBJECT, "DataJSON", 1, 0), new Field("platform", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4167add1),
            new Spec(0x4167add1, "phone.saveDefaultSendAs", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("send_as", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x416c56e8),
            new Spec(0x416c56e8, "payments.uniqueStarGift", new Field[] { new Field("gift", OBJECT, "StarGift", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x417bbf11),
            new Spec(0x417bbf11, "inputBotInlineMessageMediaVenue", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("title", STRING, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("venue_id", STRING, "", 0, -1), new Field("venue_type", STRING, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x418d549c),
            new Spec(0x418d549c, "channels.toggleSignatures", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("signatures_enabled", TRUE, "", 1, 0), new Field("profiles_enabled", TRUE, "", 1, 1), new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x41b3e202),
            new Spec(0x41b3e202, "messageActionPaymentRefunded", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("payload", BYTES, "", 1, 0), new Field("charge", OBJECT, "PaymentCharge", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x41bf109b),
            new Spec(0x41bf109b, "exportedContactToken", new Field[] { new Field("url", STRING, "", 0, -1), new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x41c10fff),
            new Spec(0x41c10fff, "chatlists.checkChatlistInvite", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x41c87565),
            new Spec(0x41c87565, "privacyValueDisallowChatParticipants", new Field[] { new Field("chats", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x41cbf256),
            new Spec(0x41cbf256, "chat", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("left", TRUE, "", 1, 2), new Field("deactivated", TRUE, "", 1, 5), new Field("call_active", TRUE, "", 1, 23), new Field("call_not_empty", TRUE, "", 1, 24), new Field("noforwards", TRUE, "", 1, 25), new Field("id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("photo", OBJECT, "ChatPhoto", 0, -1), new Field("participants_count", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("version", INT, "", 0, -1), new Field("migrated_to", OBJECT, "InputChannel", 1, 6), new Field("admin_rights", OBJECT, "ChatAdminRights", 1, 14), new Field("default_banned_rights", OBJECT, "ChatBannedRights", 1, 18) }));
        BY_ID.put(Integer.valueOf(0x41df43fc),
            new Spec(0x41df43fc, "savedStarGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("name_hidden", TRUE, "", 1, 0), new Field("unsaved", TRUE, "", 1, 5), new Field("refunded", TRUE, "", 1, 9), new Field("can_upgrade", TRUE, "", 1, 10), new Field("pinned_to_top", TRUE, "", 1, 12), new Field("upgrade_separate", TRUE, "", 1, 17), new Field("from_id", OBJECT, "Peer", 1, 1), new Field("date", INT, "", 0, -1), new Field("gift", OBJECT, "StarGift", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 2), new Field("msg_id", INT, "", 1, 3), new Field("saved_id", LONG, "", 1, 11), new Field("convert_stars", LONG, "", 1, 4), new Field("upgrade_stars", LONG, "", 1, 6), new Field("can_export_at", INT, "", 1, 7), new Field("transfer_stars", LONG, "", 1, 8), new Field("can_transfer_at", INT, "", 1, 13), new Field("can_resell_at", INT, "", 1, 14), new Field("collection_id", VECTOR, "INT", 1, 15), new Field("prepaid_upgrade_hash", STRING, "", 1, 16), new Field("drop_original_details_stars", LONG, "", 1, 18), new Field("gift_num", INT, "", 1, 19), new Field("can_craft_at", INT, "", 1, 20) }));
        BY_ID.put(Integer.valueOf(0x4203998f),
            new Spec(0x4203998f, "messages.translatedRichMessage", new Field[] { new Field("result", VECTOR, "RichMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4203c5ef),
            new Spec(0x4203c5ef, "help.countryCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("country_code", STRING, "", 0, -1), new Field("prefixes", VECTOR, "STRING", 1, 0), new Field("patterns", VECTOR, "STRING", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x423ab3ad),
            new Spec(0x423ab3ad, "bots.getPreviewInfo", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4258c205),
            new Spec(0x4258c205, "botMenuButtonCommands", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x429547e8),
            new Spec(0x429547e8, "account.initPasskeyRegistration", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x42b00348),
            new Spec(0x42b00348, "starGiftAuctionAcquiredGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("name_hidden", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("bid_amount", LONG, "", 0, -1), new Field("round", INT, "", 0, -1), new Field("pos", INT, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1), new Field("gift_num", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x42c6978f),
            new Spec(0x42c6978f, "langpack.getLanguages", new Field[] { new Field("lang_pack", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x42e047bb),
            new Spec(0x42e047bb, "channelAdminLogEventActionDeleteMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x42ff96ed),
            new Spec(0x42ff96ed, "phone.requestCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 0), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("random_id", INT, "", 0, -1), new Field("g_a_hash", BYTES, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x42ffd42b),
            new Spec(0x42ffd42b, "privacyKeyAddedByPhone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x430d3150),
            new Spec(0x430d3150, "sponsoredMessageReportOption", new Field[] { new Field("text", STRING, "", 0, -1), new Field("option", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4322d5a5),
            new Spec(0x4322d5a5, "wallet.transactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("balance", LONG, "", 0, -1), new Field("transactions", VECTOR, "WalletTransaction", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x43286cf2),
            new Spec(0x43286cf2, "messages.getUnreadPollVotes", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("offset_id", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4345be73),
            new Spec(0x4345be73, "emailVerifyPurposeLoginSetup", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x434bd2af),
            new Spec(0x434bd2af, "channelAdminLogEventActionChangePhoto", new Field[] { new Field("prev_photo", OBJECT, "Photo", 0, -1), new Field("new_photo", OBJECT, "Photo", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x435885b5),
            new Spec(0x435885b5, "messages.togglePaidReactionPrivacy", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("private", OBJECT, "PaidReactionPrivacy", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4365af6b),
            new Spec(0x4365af6b, "payments.getUniqueStarGiftValueInfo", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4367daa0),
            new Spec(0x4367daa0, "payments.giveawayInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("participating", TRUE, "", 1, 0), new Field("preparing_results", TRUE, "", 1, 3), new Field("start_date", INT, "", 0, -1), new Field("joined_too_early_date", INT, "", 1, 1), new Field("admin_disallowed_chat_id", LONG, "", 1, 2), new Field("disallowed_country", STRING, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x43b46b20),
            new Spec(0x43b46b20, "defaultHistoryTTL", new Field[] { new Field("period", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x43c57c48),
            new Spec(0x43c57c48, "documentAttributeVideo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("round_message", TRUE, "", 1, 0), new Field("supports_streaming", TRUE, "", 1, 1), new Field("nosound", TRUE, "", 1, 3), new Field("duration", DOUBLE, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("preload_prefix_size", INT, "", 1, 2), new Field("video_start_ts", DOUBLE, "", 1, 4), new Field("video_codec", STRING, "", 1, 5) }));
        BY_ID.put(Integer.valueOf(0x43fe19f3),
            new Spec(0x43fe19f3, "messages.checkHistoryImport", new Field[] { new Field("import_head", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4423e6c5),
            new Spec(0x4423e6c5, "messages.getHistory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_date", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x445663a7),
            new Spec(0x445663a7, "messages.chatInviteJoinResultOk", new Field[] { new Field("updates", OBJECT, "Updates", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x446972fd),
            new Spec(0x446972fd, "messages.getDiscussionMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x44747e9a),
            new Spec(0x44747e9a, "auth.authorizationSignUpRequired", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("terms_of_service", OBJECT, "help.TermsOfService", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x449e0b51),
            new Spec(0x449e0b51, "account.getTmpPassword", new Field[] { new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1), new Field("period", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x44ba9dd9),
            new Spec(0x44ba9dd9, "messages.savedDialogsSlice", new Field[] { new Field("count", INT, "", 0, -1), new Field("dialogs", VECTOR, "SavedDialog", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x44c1f8e9),
            new Spec(0x44c1f8e9, "inputStickerSetEmojiDefaultTopicIcons", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x44e56023),
            new Spec(0x44e56023, "messages.emojiGameDiceInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("game_hash", STRING, "", 0, -1), new Field("prev_stake", LONG, "", 0, -1), new Field("current_streak", INT, "", 0, -1), new Field("params", VECTOR, "INT", 0, -1), new Field("plays_left", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x44fa7a15),
            new Spec(0x44fa7a15, "messages.sendEncrypted", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4500c525),
            new Spec(0x4500c525, "wallet.enableBackup", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("parts", VECTOR, "BYTES", 0, -1), new Field("new_public_key", BYTES, "", 1, 1), new Field("proof", OBJECT, "WalletOwnershipProof", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x4504d54f),
            new Spec(0x4504d54f, "bots.setBotMenuButton", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("button", OBJECT, "BotMenuButton", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x455b853d),
            new Spec(0x455b853d, "messageViews", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("views", INT, "", 1, 0), new Field("forwards", INT, "", 1, 1), new Field("replies", OBJECT, "MessageReplies", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x4576f3f0),
            new Spec(0x4576f3f0, "attachMenuBotIconColor", new Field[] { new Field("name", STRING, "", 0, -1), new Field("color", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x45d5b021),
            new Spec(0x45d5b021, "messageActionGiftStars", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("stars", LONG, "", 0, -1), new Field("crypto_currency", STRING, "", 1, 0), new Field("crypto_amount", LONG, "", 1, 0), new Field("transaction_id", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x461b3f48),
            new Spec(0x461b3f48, "messages.getMessageReactionsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 1, 0), new Field("offset", STRING, "", 1, 1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4628f6e6),
            new Spec(0x4628f6e6, "messagePeerVoteMultiple", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("options", VECTOR, "BYTES", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x46560264),
            new Spec(0x46560264, "updateLangPackTooLong", new Field[] { new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4679b65f),
            new Spec(0x4679b65f, "accessPointRule", new Field[] { new Field("phone_prefix_rules", STRING, "", 0, -1), new Field("dc_id", INT, "", 0, -1), new Field("ips", VECTOR, "IpPort", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x467a0766),
            new Spec(0x467a0766, "pageBlockParagraph", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4696459a),
            new Spec(0x4696459a, "stickers.replaceSticker", new Field[] { new Field("sticker", OBJECT, "InputDocument", 0, -1), new Field("new_sticker", OBJECT, "InputStickerSetItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x46c6e36f),
            new Spec(0x46c6e36f, "payments.starGiftUpgradeAttributes", new Field[] { new Field("attributes", VECTOR, "StarGiftAttribute", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x46d840ab),
            new Spec(0x46d840ab, "channelAdminLogEventActionChangeEmojiStickerSet", new Field[] { new Field("prev_stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("new_stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x46dc1fb9),
            new Spec(0x46dc1fb9, "dh_gen_retry", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce_hash2", INT128, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x46e1d13d),
            new Spec(0x46e1d13d, "recentMeUrlUnknown", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x472455aa),
            new Spec(0x472455aa, "messages.getPaidReactionPrivacy", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4792929b),
            new Spec(0x4792929b, "messageActionScreenshotTaken", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x47a971e0),
            new Spec(0x47a971e0, "statsURL", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x47dd8079),
            new Spec(0x47dd8079, "messageActionWebViewDataSentMe", new Field[] { new Field("text", STRING, "", 0, -1), new Field("data", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x481eadfa),
            new Spec(0x481eadfa, "emojiListNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x48222faf),
            new Spec(0x48222faf, "inputGeoPoint", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("lat", DOUBLE, "", 0, -1), new Field("long", DOUBLE, "", 0, -1), new Field("accuracy_radius", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x4880ed9a),
            new Spec(0x4880ed9a, "updateManagedBot", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x48870999),
            new Spec(0x48870999, "pageBlockFooter", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4899484e),
            new Spec(0x4899484e, "messages.votesList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("votes", VECTOR, "MessagePeerVote", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x48aaae3c),
            new Spec(0x48aaae3c, "starGiftAttributeIdModel", new Field[] { new Field("document_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x48bad7a5),
            new Spec(0x48bad7a5, "inlineButtonTypeBuy", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x48cdc6d8),
            new Spec(0x48cdc6d8, "phone.createGroupCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rtmp_stream", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("random_id", INT, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("schedule_date", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x48e246c2),
            new Spec(0x48e246c2, "updateStarGiftAuctionState", new Field[] { new Field("gift_id", LONG, "", 0, -1), new Field("state", OBJECT, "StarGiftAuctionState", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x48e91302),
            new Spec(0x48e91302, "messageActionGiftPremium", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("days", INT, "", 0, -1), new Field("crypto_currency", STRING, "", 1, 0), new Field("crypto_amount", LONG, "", 1, 0), new Field("message", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x48f1d94c),
            new Spec(0x48f1d94c, "encryptedChatRequested", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("folder_id", INT, "", 1, 0), new Field("id", INT, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1), new Field("g_a", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x490dada1),
            new Spec(0x490dada1, "auth.cancelWebTokenAuthorization", new Field[] { new Field("web_auth_token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4959427a),
            new Spec(0x4959427a, "premium.boostsStatus", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("my_boost", TRUE, "", 1, 2), new Field("level", INT, "", 0, -1), new Field("current_level_boosts", INT, "", 0, -1), new Field("boosts", INT, "", 0, -1), new Field("gift_boosts", INT, "", 1, 4), new Field("next_level_boosts", INT, "", 1, 0), new Field("premium_audience", OBJECT, "StatsPercentValue", 1, 1), new Field("boost_url", STRING, "", 0, -1), new Field("prepaid_giveaways", VECTOR, "PrepaidGiveaway", 1, 3), new Field("my_boost_slots", VECTOR, "INT", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x496f379c),
            new Spec(0x496f379c, "updateBotInlineQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("query", STRING, "", 0, -1), new Field("geo", OBJECT, "GeoPoint", 1, 0), new Field("peer_type", OBJECT, "InlineQueryPeerType", 1, 1), new Field("offset", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x49748553),
            new Spec(0x49748553, "inputStickerSetEmojiChannelDefaultStatuses", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x49a6549c),
            new Spec(0x49a6549c, "mediaAreaWeather", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("emoji", STRING, "", 0, -1), new Field("temperature_c", DOUBLE, "", 0, -1), new Field("color", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x49b30240),
            new Spec(0x49b30240, "help.getTimezonesList", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x49b92a26),
            new Spec(0x49b92a26, "todoList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("others_can_append", TRUE, "", 1, 0), new Field("others_can_complete", TRUE, "", 1, 1), new Field("title", OBJECT, "TextWithEntities", 0, -1), new Field("list", VECTOR, "TodoItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x49e9528f),
            new Spec(0x49e9528f, "messages.getChats", new Field[] { new Field("id", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4a162433),
            new Spec(0x4a162433, "starGiftAttributeIdPattern", new Field[] { new Field("document_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4a27eb2d),
            new Spec(0x4a27eb2d, "statsGraphAsync", new Field[] { new Field("token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4a4ff172),
            new Spec(0x4a4ff172, "readParticipantDate", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4a5f5bd9),
            new Spec(0x4a5f5bd9, "inputInvoiceStarGiftTransfer", new Field[] { new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1), new Field("to_id", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4a8bfe80),
            new Spec(0x4a8bfe80, "messageActionChatJoinedViaCommunity", new Field[] { new Field("community_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4a95e84e),
            new Spec(0x4a95e84e, "inputNotifyChats", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4a992157),
            new Spec(0x4a992157, "inputStickeredMediaPhoto", new Field[] { new Field("id", OBJECT, "InputPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4aa83913),
            new Spec(0x4aa83913, "aicompose.createTone", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("display_author", TRUE, "", 1, 0), new Field("emoji_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("prompt", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4afe8f6d),
            new Spec(0x4afe8f6d, "updates.differenceTooLong", new Field[] { new Field("pts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4b00e066),
            new Spec(0x4b00e066, "account.updateBusinessWorkHours", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("business_work_hours", OBJECT, "BusinessWorkHours", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x4b09ebbc),
            new Spec(0x4b09ebbc, "storage.fileMov", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4b0c8c0f),
            new Spec(0x4b0c8c0f, "messages.reportEncryptedSpam", new Field[] { new Field("peer", OBJECT, "InputEncryptedChat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4b12327b),
            new Spec(0x4b12327b, "channels.updatePaidMessagesPrice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("broadcast_messages_allowed", TRUE, "", 1, 0), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("send_paid_messages_stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4b3e14d6),
            new Spec(0x4b3e14d6, "boost", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("gift", TRUE, "", 1, 1), new Field("giveaway", TRUE, "", 1, 2), new Field("unclaimed", TRUE, "", 1, 3), new Field("id", STRING, "", 0, -1), new Field("user_id", LONG, "", 1, 0), new Field("giveaway_msg_id", INT, "", 1, 2), new Field("date", INT, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("used_gift_slug", STRING, "", 1, 4), new Field("multiplier", INT, "", 1, 5), new Field("stars", LONG, "", 1, 6) }));
        BY_ID.put(Integer.valueOf(0x4b425864),
            new Spec(0x4b425864, "inputBotInlineMessageGame", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x4b7d786a),
            new Spec(0x4b7d786a, "pollAnswer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("text", OBJECT, "TextWithEntities", 0, -1), new Field("option", BYTES, "", 0, -1), new Field("media", OBJECT, "MessageMedia", 1, 0), new Field("added_by", OBJECT, "Peer", 1, 1), new Field("date", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x4b9e22a0),
            new Spec(0x4b9e22a0, "reactionNotificationsFromAll", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4ba3a95a),
            new Spec(0x4ba3a95a, "messageReactor", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("top", TRUE, "", 1, 0), new Field("my", TRUE, "", 1, 1), new Field("anonymous", TRUE, "", 1, 2), new Field("peer_id", OBJECT, "Peer", 1, 3), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4bbb8f01),
            new Spec(0x4bbb8f01, "updateEditEphemeralMessage", new Field[] { new Field("message", OBJECT, "EphemeralMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4bc89693),
            new Spec(0x4bc89693, "wallet.tonConnectChallenge", new Field[] { new Field("challenge", BYTES, "", 0, -1), new Field("event_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4bff8ea0),
            new Spec(0x4bff8ea0, "account.authorizations", new Field[] { new Field("authorization_ttl_days", INT, "", 0, -1), new Field("authorizations", VECTOR, "Authorization", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4c1ef10e),
            new Spec(0x4c1ef10e, "wallet.nftAttribute", new Field[] { new Field("trait_type", STRING, "", 0, -1), new Field("value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4c2a5d62),
            new Spec(0x4c2a5d62, "textSpoiler", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4c3e069d),
            new Spec(0x4c3e069d, "account.autoSaveSettings", new Field[] { new Field("users_settings", OBJECT, "AutoSaveSettings", 0, -1), new Field("chats_settings", OBJECT, "AutoSaveSettings", 0, -1), new Field("broadcasts_settings", OBJECT, "AutoSaveSettings", 0, -1), new Field("exceptions", VECTOR, "AutoSaveException", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4c4537c8),
            new Spec(0x4c4537c8, "messages.composedRichMessageWithAI", new Field[] { new Field("result", OBJECT, "RichMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4c4e743f),
            new Spec(0x4c4e743f, "messageEntityCashtag", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4c9409f6),
            new Spec(0x4c9409f6, "account.declinePasswordReset", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4d22ff98),
            new Spec(0x4d22ff98, "webViewResultUrl", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("fullsize", TRUE, "", 1, 1), new Field("fullscreen", TRUE, "", 1, 2), new Field("same_origin", TRUE, "", 1, 3), new Field("query_id", LONG, "", 1, 0), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4d392343),
            new Spec(0x4d392343, "help.getInviteText", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4d4bd46a),
            new Spec(0x4d4bd46a, "profileTabGifts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4d6deea5),
            new Spec(0x4d6deea5, "updateShortChatMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("out", TRUE, "", 1, 1), new Field("mentioned", TRUE, "", 1, 4), new Field("media_unread", TRUE, "", 1, 5), new Field("silent", TRUE, "", 1, 13), new Field("id", INT, "", 0, -1), new Field("from_id", LONG, "", 0, -1), new Field("chat_id", LONG, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("fwd_from", OBJECT, "MessageFwdHeader", 1, 2), new Field("via_bot_id", LONG, "", 1, 11), new Field("reply_to", OBJECT, "MessageReplyHeader", 1, 3), new Field("entities", VECTOR, "MessageEntity", 1, 7), new Field("ttl_period", INT, "", 1, 25) }));
        BY_ID.put(Integer.valueOf(0x4d712f2e),
            new Spec(0x4d712f2e, "updateBotCommands", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("commands", VECTOR, "BotCommand", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4d818d5d),
            new Spec(0x4d818d5d, "inputInvoiceStarGiftUpgrade", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("keep_original_details", TRUE, "", 1, 0), new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4d8a0299),
            new Spec(0x4d8a0299, "botInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_preview_medias", TRUE, "", 1, 6), new Field("user_id", LONG, "", 1, 0), new Field("description", STRING, "", 1, 1), new Field("description_photo", OBJECT, "Photo", 1, 4), new Field("description_document", OBJECT, "Document", 1, 5), new Field("commands", VECTOR, "BotCommand", 1, 2), new Field("menu_button", OBJECT, "BotMenuButton", 1, 3), new Field("privacy_policy_url", STRING, "", 1, 7), new Field("app_settings", OBJECT, "BotAppSettings", 1, 8), new Field("verifier_settings", OBJECT, "BotVerifierSettings", 1, 9) }));
        BY_ID.put(Integer.valueOf(0x4dafc503),
            new Spec(0x4dafc503, "stickers.suggestShortName", new Field[] { new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4dba4501),
            new Spec(0x4dba4501, "account.takeout", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4dbe9226),
            new Spec(0x4dbe9226, "inputPrivacyKeySavedMusic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4dc5085f),
            new Spec(0x4dc5085f, "messages.deleteSavedHistory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("parent_peer", OBJECT, "InputPeer", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_date", INT, "", 1, 2), new Field("max_date", INT, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x4dd3a7f6),
            new Spec(0x4dd3a7f6, "account.verifyPhone", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("phone_code", STRING, "", 0, -1) }));
    }

    private static void init4() {
        BY_ID.put(Integer.valueOf(0x4e4df4bb),
            new Spec(0x4e4df4bb, "messageFwdHeader", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("imported", TRUE, "", 1, 7), new Field("saved_out", TRUE, "", 1, 11), new Field("from_id", OBJECT, "Peer", 1, 0), new Field("from_name", STRING, "", 1, 5), new Field("date", INT, "", 0, -1), new Field("channel_post", INT, "", 1, 2), new Field("post_author", STRING, "", 1, 3), new Field("saved_from_peer", OBJECT, "Peer", 1, 4), new Field("saved_from_msg_id", INT, "", 1, 4), new Field("saved_from_id", OBJECT, "Peer", 1, 8), new Field("saved_from_name", STRING, "", 1, 9), new Field("saved_date", INT, "", 1, 10), new Field("psa_type", STRING, "", 1, 6) }));
        BY_ID.put(Integer.valueOf(0x4e5f810d),
            new Spec(0x4e5f810d, "payments.paymentResult", new Field[] { new Field("updates", OBJECT, "Updates", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4e7085ea),
            new Spec(0x4e7085ea, "starGiftAttributePattern", new Field[] { new Field("name", STRING, "", 0, -1), new Field("document", OBJECT, "Document", 0, -1), new Field("rarity", OBJECT, "StarGiftAttributeRarity", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4e80a379),
            new Spec(0x4e80a379, "updateStarsBalance", new Field[] { new Field("balance", OBJECT, "StarsAmount", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4e90bfd6),
            new Spec(0x4e90bfd6, "updateMessageID", new Field[] { new Field("id", INT, "", 0, -1), new Field("random_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4e9963b2),
            new Spec(0x4e9963b2, "messages.getEmojiKeywordsLanguages", new Field[] { new Field("lang_codes", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4ea4c80f),
            new Spec(0x4ea4c80f, "account.getConnectedBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4ea9b3bf),
            new Spec(0x4ea9b3bf, "payments.getStarsStatus", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("ton", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4f11bae1),
            new Spec(0x4f11bae1, "userProfilePhotoEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4f1ebf24),
            new Spec(0x4f1ebf24, "smsjobs.finishJob", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("job_id", STRING, "", 0, -1), new Field("error", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x4f4456d3),
            new Spec(0x4f4456d3, "pageBlockPullquote", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("caption", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4f47a016),
            new Spec(0x4f47a016, "messages.setDefaultReaction", new Field[] { new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4f58a237),
            new Spec(0x4f58a237, "buttonTypeRequestPeer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("button_id", INT, "", 0, -1), new Field("peer_type", OBJECT, "RequestPeerType", 0, -1), new Field("max_quantity", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4f96cb18),
            new Spec(0x4f96cb18, "inputPrivacyKeyStatusTimestamp", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4fa417f2),
            new Spec(0x4fa417f2, "inputBotInlineResultGame", new Field[] { new Field("id", STRING, "", 0, -1), new Field("short_name", STRING, "", 0, -1), new Field("send_message", OBJECT, "InputBotInlineMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4facb138),
            new Spec(0x4facb138, "messages.hidePeerSettingsBar", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4fc81d6e),
            new Spec(0x4fc81d6e, "account.savedMusicIdsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x4fcba9c8),
            new Spec(0x4fcba9c8, "messages.archivedStickers", new Field[] { new Field("count", INT, "", 0, -1), new Field("sets", VECTOR, "StickerSetCovered", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4fdc5ea7),
            new Spec(0x4fdc5ea7, "payments.canPurchaseStore", new Field[] { new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x4fdd3430),
            new Spec(0x4fdd3430, "keyboardButtonStyle", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bg_primary", TRUE, "", 1, 0), new Field("bg_danger", TRUE, "", 1, 1), new Field("bg_success", TRUE, "", 1, 2), new Field("icon", LONG, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x4fddbee7),
            new Spec(0x4fddbee7, "payments.updateStarGiftCollection", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("collection_id", INT, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("delete_stargift", VECTOR, "InputSavedStarGift", 1, 1), new Field("add_stargift", VECTOR, "InputSavedStarGift", 1, 2), new Field("order", VECTOR, "InputSavedStarGift", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x500377f9),
            new Spec(0x500377f9, "phone.leaveGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("source", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50077589),
            new Spec(0x50077589, "bots.checkDownloadFileParams", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("file_name", STRING, "", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x500e6dfa),
            new Spec(0x500e6dfa, "privacyKeyChatInvite", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x501569cf),
            new Spec(0x501569cf, "messages.getRichMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x502f92f7),
            new Spec(0x502f92f7, "messageActionInviteToGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("users", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x504aa18f),
            new Spec(0x504aa18f, "updateSentPhoneCode", new Field[] { new Field("sent_code", OBJECT, "auth.SentCode", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5057c497),
            new Spec(0x5057c497, "messages.uploadEncryptedFile", new Field[] { new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("file", OBJECT, "InputEncryptedFile", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5060a3f4),
            new Spec(0x5060a3f4, "messageActionSetChatWallPaper", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("same", TRUE, "", 1, 0), new Field("for_both", TRUE, "", 1, 1), new Field("wallpaper", OBJECT, "WallPaper", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50a04e45),
            new Spec(0x50a04e45, "account.privacyRules", new Field[] { new Field("rules", VECTOR, "PrivacyRule", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50a38e0e),
            new Spec(0x50a38e0e, "updateWalletTonConnectSession", new Field[] { new Field("session", OBJECT, "TonConnectSession", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50ca4de1),
            new Spec(0x50ca4de1, "phoneCallDiscarded", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("need_rating", TRUE, "", 1, 2), new Field("need_debug", TRUE, "", 1, 3), new Field("video", TRUE, "", 1, 6), new Field("id", LONG, "", 0, -1), new Field("reason", OBJECT, "PhoneCallDiscardReason", 1, 0), new Field("duration", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x50cc03d3),
            new Spec(0x50cc03d3, "webPageAttributeStickerSet", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("emojis", TRUE, "", 1, 0), new Field("text_color", TRUE, "", 1, 1), new Field("stickers", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50cd067c),
            new Spec(0x50cd067c, "stats.storyStats", new Field[] { new Field("views_graph", OBJECT, "StatsGraph", 0, -1), new Field("reactions_by_emotion_graph", OBJECT, "StatsGraph", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50f24105),
            new Spec(0x50f24105, "channels.toggleUsername", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("username", STRING, "", 0, -1), new Field("active", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x50f5c392),
            new Spec(0x50f5c392, "inputMessagesFilterVoice", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x512fe446),
            new Spec(0x512fe446, "payments.uniqueStarGiftValueInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("last_sale_on_fragment", TRUE, "", 1, 1), new Field("value_is_average", TRUE, "", 1, 6), new Field("currency", STRING, "", 0, -1), new Field("value", LONG, "", 0, -1), new Field("initial_sale_date", INT, "", 0, -1), new Field("initial_sale_stars", LONG, "", 0, -1), new Field("initial_sale_price", LONG, "", 0, -1), new Field("last_sale_date", INT, "", 1, 0), new Field("last_sale_price", LONG, "", 1, 0), new Field("floor_price", LONG, "", 1, 2), new Field("average_price", LONG, "", 1, 3), new Field("listed_count", INT, "", 1, 4), new Field("fragment_listed_count", INT, "", 1, 5), new Field("fragment_listed_url", STRING, "", 1, 5) }));
        BY_ID.put(Integer.valueOf(0x514519e2),
            new Spec(0x514519e2, "dialogPeerFolder", new Field[] { new Field("folder_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x514e999d),
            new Spec(0x514e999d, "messages.getInlineBotResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("geo_point", OBJECT, "InputGeoPoint", 1, 0), new Field("query", STRING, "", 0, -1), new Field("offset", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x518ad0b7),
            new Spec(0x518ad0b7, "auth.initPasskeyLogin", new Field[] { new Field("api_id", INT, "", 0, -1), new Field("api_hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x519524ea),
            new Spec(0x519524ea, "textHashtag", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x51e6ee4f),
            new Spec(0x51e6ee4f, "storyItemDeleted", new Field[] { new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x52029342),
            new Spec(0x52029342, "help.getCdnConfig", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x522d5a7d),
            new Spec(0x522d5a7d, "help.getAppUpdate", new Field[] { new Field("source", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x523da4eb),
            new Spec(0x523da4eb, "reactionPaid", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x52564893),
            new Spec(0x52564893, "sendMessageRichMessageDraftAction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_stop", TRUE, "", 1, 0), new Field("keep_on_stop", TRUE, "", 1, 1), new Field("random_id", LONG, "", 0, -1), new Field("rich_message", OBJECT, "RichMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5275dfdd),
            new Spec(0x5275dfdd, "wallet.getUserAddresses", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force", TRUE, "", 1, 0), new Field("id", VECTOR, "InputUser", 0, -1), new Field("addresses", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x527d22eb),
            new Spec(0x527d22eb, "emailVerifyPurposeLoginChange", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x528a0677),
            new Spec(0x528a0677, "storage.fileMp3", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x52928bca),
            new Spec(0x52928bca, "chatReactionsAll", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("allow_custom", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x52d8ccd9),
            new Spec(0x52d8ccd9, "messageMediaDocument", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("nopremium", TRUE, "", 1, 3), new Field("spoiler", TRUE, "", 1, 4), new Field("video", TRUE, "", 1, 6), new Field("round", TRUE, "", 1, 7), new Field("voice", TRUE, "", 1, 8), new Field("document", OBJECT, "Document", 1, 0), new Field("alt_documents", VECTOR, "Document", 1, 5), new Field("video_cover", OBJECT, "Photo", 1, 9), new Field("video_timestamp", INT, "", 1, 10), new Field("ttl_seconds", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x5334759c),
            new Spec(0x5334759c, "help.premiumPromo", new Field[] { new Field("status_text", STRING, "", 0, -1), new Field("status_entities", VECTOR, "MessageEntity", 0, -1), new Field("video_sections", VECTOR, "STRING", 0, -1), new Field("videos", VECTOR, "Document", 0, -1), new Field("period_options", VECTOR, "PremiumSubscriptionOption", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5353e5a7),
            new Spec(0x5353e5a7, "auth.sentCodeTypeCall", new Field[] { new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x53577479),
            new Spec(0x53577479, "account.getNotifyExceptions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("compare_sound", TRUE, "", 1, 1), new Field("compare_stories", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputNotifyPeer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x535f779d),
            new Spec(0x535f779d, "statsGroupTopInviter", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("invitations", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x53618bce),
            new Spec(0x53618bce, "messages.requestAppWebView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("write_allowed", TRUE, "", 1, 0), new Field("compact", TRUE, "", 1, 7), new Field("fullscreen", TRUE, "", 1, 8), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("app", OBJECT, "InputBotApp", 0, -1), new Field("start_param", STRING, "", 1, 1), new Field("theme_params", OBJECT, "DataJSON", 1, 2), new Field("platform", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5366c915),
            new Spec(0x5366c915, "phoneCallEmpty", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5367e5be),
            new Spec(0x5367e5be, "inputSecureFile", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x53909779),
            new Spec(0x53909779, "channelAdminLogEventActionToggleSlowMode", new Field[] { new Field("prev_value", INT, "", 0, -1), new Field("new_value", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x53b22baf),
            new Spec(0x53b22baf, "messages.searchResultsPositions", new Field[] { new Field("count", INT, "", 0, -1), new Field("positions", VECTOR, "SearchResultsPosition", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x53bc0020),
            new Spec(0x53bc0020, "account.deleteAutoSaveExceptions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x53e6f1ec),
            new Spec(0x53e6f1ec, "updateDeleteQuickReply", new Field[] { new Field("shortcut_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x53f3ce5a),
            new Spec(0x53f3ce5a, "inputInlineButtonTypeUserProfile", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x541a1d1a),
            new Spec(0x541a1d1a, "userStatusLastWeek", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("by_me", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x54236209),
            new Spec(0x54236209, "starsGiveawayWinnersOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("default", TRUE, "", 1, 0), new Field("users", INT, "", 0, -1), new Field("per_user_stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x548a30f5),
            new Spec(0x548a30f5, "account.getPassword", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5492e5ee),
            new Spec(0x5492e5ee, "account.resolveBusinessChatLink", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x54b56617),
            new Spec(0x54b56617, "webPageAttributeTheme", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("documents", VECTOR, "Document", 1, 0), new Field("settings", OBJECT, "ThemeSettings", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x54c01850),
            new Spec(0x54c01850, "updateChatDefaultBannedRights", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("default_banned_rights", OBJECT, "ChatBannedRights", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x55188a2e),
            new Spec(0x55188a2e, "channelAdminLogEventActionChangeAbout", new Field[] { new Field("prev_value", STRING, "", 0, -1), new Field("new_value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x55451fa9),
            new Spec(0x55451fa9, "phone.getCallConfig", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5559481d),
            new Spec(0x5559481d, "messages.sendEncryptedFile", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("data", BYTES, "", 0, -1), new Field("file", OBJECT, "InputEncryptedFile", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x55a5bb66),
            new Spec(0x55a5bb66, "messages.receivedQueue", new Field[] { new Field("max_qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x55b41fd6),
            new Spec(0x55b41fd6, "account.registerPasskey", new Field[] { new Field("credential", OBJECT, "InputPasskeyCredential", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x55fb0996),
            new Spec(0x55fb0996, "messages.getPersonalChannelHistory", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56022f4d),
            new Spec(0x56022f4d, "updateLangPack", new Field[] { new Field("difference", OBJECT, "LangPackDifference", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x560f8935),
            new Spec(0x560f8935, "messages.sentEncryptedMessage", new Field[] { new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x564edaeb),
            new Spec(0x564edaeb, "stories.albumsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x564fe691),
            new Spec(0x564fe691, "updateLoginToken", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x565251e2),
            new Spec(0x565251e2, "starGiftAttributeModel", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("crafted", TRUE, "", 1, 0), new Field("name", STRING, "", 0, -1), new Field("document", OBJECT, "Document", 0, -1), new Field("rarity", OBJECT, "StarGiftAttributeRarity", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56655768),
            new Spec(0x56655768, "account.getWebBrowserSettings", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x566decd0),
            new Spec(0x566decd0, "channels.editTitle", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x566fe7cd),
            new Spec(0x566fe7cd, "updateDeleteQuickReplyMessages", new Field[] { new Field("shortcut_id", INT, "", 0, -1), new Field("messages", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56730bcc),
            new Spec(0x56730bcc, "null", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5680e342),
            new Spec(0x5680e342, "phone.startScheduledGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56987bd5),
            new Spec(0x56987bd5, "messages.deleteRevokedExportedChatInvites", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("admin_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56d6a247),
            new Spec(0x56d6a247, "channelAdminLogEventActionToggleGroupCallSetting", new Field[] { new Field("join_muted", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56da0b3f),
            new Spec(0x56da0b3f, "account.getAutoDownloadSettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x56dbfcf8),
            new Spec(0x56dbfcf8, "updateDeleteEphemeralMessages", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("ids", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56e0d474),
            new Spec(0x56e0d474, "messageMediaGeo", new Field[] { new Field("geo", OBJECT, "GeoPoint", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56e59f9c),
            new Spec(0x56e59f9c, "auth.checkPaidAuth", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("form_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x56e9f0e4),
            new Spec(0x56e9f0e4, "inputMessagesFilterPhotoVideo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x56fddf88),
            new Spec(0x56fddf88, "p_q_inner_data_temp_dc", new Field[] { new Field("pq", STRING, "", 0, -1), new Field("p", STRING, "", 0, -1), new Field("q", STRING, "", 0, -1), new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce", INT256, "", 0, -1), new Field("dc", INT, "", 0, -1), new Field("expires_in", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x570d6f6f),
            new Spec(0x570d6f6f, "messages.getWebPagePreview", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x5719bacc),
            new Spec(0x5719bacc, "inputPrivacyKeyProfilePhoto", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x571d2742),
            new Spec(0x571d2742, "updateReadFeaturedStickers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5725e40a),
            new Spec(0x5725e40a, "cdnConfig", new Field[] { new Field("public_keys", VECTOR, "CdnPublicKey", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x574b617f),
            new Spec(0x574b617f, "inputPageBlockMap", new Field[] { new Field("geo", OBJECT, "InputGeoPoint", 0, -1), new Field("zoom", INT, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x575e1f8c),
            new Spec(0x575e1f8c, "phone.saveDefaultGroupCallJoinAs", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("join_as", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5774ca74),
            new Spec(0x5774ca74, "stories.getStoriesByID", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5784d3e1),
            new Spec(0x5784d3e1, "messages.getMessagesViews", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1), new Field("increment", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5787686d),
            new Spec(0x5787686d, "mediaAreaStarGift", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5796e780),
            new Spec(0x5796e780, "channelAdminLogEventActionChangePeerColor", new Field[] { new Field("prev_value", OBJECT, "PeerColor", 0, -1), new Field("new_value", OBJECT, "PeerColor", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x57adc690),
            new Spec(0x57adc690, "phoneCallDiscardReasonHangup", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x57bbd166),
            new Spec(0x57bbd166, "stories.activateStealthMode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("past", TRUE, "", 1, 0), new Field("future", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x57de635e),
            new Spec(0x57de635e, "messageActionSuggestProfilePhoto", new Field[] { new Field("photo", OBJECT, "Photo", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x57e28221),
            new Spec(0x57e28221, "account.contentSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("sensitive_enabled", TRUE, "", 1, 0), new Field("sensitive_can_change", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x57e2f66c),
            new Spec(0x57e2f66c, "inputMessagesFilterEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x57f17692),
            new Spec(0x57f17692, "messages.getArchivedStickers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("masks", TRUE, "", 1, 0), new Field("emojis", TRUE, "", 1, 1), new Field("offset_id", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5806b4ec),
            new Spec(0x5806b4ec, "channelAdminLogEventActionParticipantEditRank", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("prev_rank", STRING, "", 0, -1), new Field("new_rank", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5821a5dc),
            new Spec(0x5821a5dc, "stories.getPinnedStories", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x582464e3),
            new Spec(0x582464e3, "tonConnectNextEventId", new Field[] { new Field("event_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5869a553),
            new Spec(0x5869a553, "payments.getConnectedStarRefBots", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset_date", INT, "", 1, 2), new Field("offset_link", STRING, "", 1, 2), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x58707d28),
            new Spec(0x58707d28, "channelAdminLogEventActionCreateTopic", new Field[] { new Field("topic", OBJECT, "ForumTopic", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5881323a),
            new Spec(0x5881323a, "inputReplyToStory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("story_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x58943ee2),
            new Spec(0x58943ee2, "messages.setTyping", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("action", OBJECT, "SendMessageAction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x58bbcb50),
            new Spec(0x58bbcb50, "messages.sendPaidReaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("private", OBJECT, "PaidReactionPrivacy", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x58d6b376),
            new Spec(0x58d6b376, "account.toggleUsername", new Field[] { new Field("username", STRING, "", 0, -1), new Field("active", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x58dbcab8),
            new Spec(0x58dbcab8, "inputReportReasonSpam", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x58e4a740),
            new Spec(0x58e4a740, "rpc_drop_answer", new Field[] { new Field("req_msg_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x58e63f6d),
            new Spec(0x58e63f6d, "channels.editLocation", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("address", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x59080c20),
            new Spec(0x59080c20, "pageBlockMath", new Field[] { new Field("source", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x59511722),
            new Spec(0x59511722, "peerUser", new Field[] { new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x59ae2b16),
            new Spec(0x59ae2b16, "messages.deleteScheduledMessages", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x59d78fc5),
            new Spec(0x59d78fc5, "stories.storyViewsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("views_count", INT, "", 0, -1), new Field("forwards_count", INT, "", 0, -1), new Field("reactions_count", INT, "", 0, -1), new Field("views", VECTOR, "StoryView", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x59e65335),
            new Spec(0x59e65335, "messages.emojiGameUnavailable", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x59ead627),
            new Spec(0x59ead627, "phone.setCallRating", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_initiative", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("rating", INT, "", 0, -1), new Field("comment", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x59ffdb31),
            new Spec(0x59ffdb31, "ephemeral.welcomeMessagesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5a0a066d),
            new Spec(0x5a0a066d, "businessIntro", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("sticker", OBJECT, "Document", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x5a17b5e5),
            new Spec(0x5a17b5e5, "inputEncryptedFile", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5a4fcce5),
            new Spec(0x5a4fcce5, "inputPrivacyValueAllowBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5a50fca4),
            new Spec(0x5a50fca4, "channelAdminLogEventActionExportedInviteDelete", new Field[] { new Field("invite", OBJECT, "ExportedChatInvite", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5a592a6c),
            new Spec(0x5a592a6c, "help.configSimple", new Field[] { new Field("date", INT, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("rules", VECTOR, "AccessPointRule", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5a686d7c),
            new Spec(0x5a686d7c, "chatInviteAlready", new Field[] { new Field("chat", OBJECT, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5a6d7395),
            new Spec(0x5a6d7395, "messages.reportMessagesDelivery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("push", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5af4c73a),
            new Spec(0x5af4c73a, "phone.getGroupCallStreamRtmpUrl", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("live_story", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("revoke", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5b11125a),
            new Spec(0x5b11125a, "baseThemeArctic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5b118126),
            new Spec(0x5b118126, "messages.readFeaturedStickers", new Field[] { new Field("id", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5b934f9d),
            new Spec(0x5b934f9d, "inputChannelFromMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("channel_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5bb98608),
            new Spec(0x5bb98608, "updatePinnedChannelMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("channel_id", LONG, "", 0, -1), new Field("messages", VECTOR, "INT", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5bd0ee50),
            new Spec(0x5bd0ee50, "messages.deleteChat", new Field[] { new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5c003cef),
            new Spec(0x5c003cef, "messages.editQuickReplyShortcut", new Field[] { new Field("shortcut_id", INT, "", 0, -1), new Field("shortcut", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5c467992),
            new Spec(0x5c467992, "inputNotifyForumTopic", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5c9d3702),
            new Spec(0x5c9d3702, "chatInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel", TRUE, "", 1, 0), new Field("broadcast", TRUE, "", 1, 1), new Field("public", TRUE, "", 1, 2), new Field("megagroup", TRUE, "", 1, 3), new Field("request_needed", TRUE, "", 1, 6), new Field("verified", TRUE, "", 1, 7), new Field("scam", TRUE, "", 1, 8), new Field("fake", TRUE, "", 1, 9), new Field("can_refulfill_subscription", TRUE, "", 1, 11), new Field("title", STRING, "", 0, -1), new Field("about", STRING, "", 1, 5), new Field("photo", OBJECT, "Photo", 0, -1), new Field("participants_count", INT, "", 0, -1), new Field("participants", VECTOR, "User", 1, 4), new Field("color", INT, "", 0, -1), new Field("subscription_pricing", OBJECT, "StarsSubscriptionPricing", 1, 10), new Field("subscription_form_id", LONG, "", 1, 12), new Field("bot_verification", OBJECT, "BotVerification", 1, 13) }));
        BY_ID.put(Integer.valueOf(0x5c9ff4d6),
            new Spec(0x5c9ff4d6, "payments.getStarGiftAuctionState", new Field[] { new Field("auction", OBJECT, "InputStarGiftAuction", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5cc761bd),
            new Spec(0x5cc761bd, "emojiKeywordsDifference", new Field[] { new Field("lang_code", STRING, "", 0, -1), new Field("from_version", INT, "", 0, -1), new Field("version", INT, "", 0, -1), new Field("keywords", VECTOR, "EmojiKeyword", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5cd3709d),
            new Spec(0x5cd3709d, "inlineButtonTypeGame", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5ce14175),
            new Spec(0x5ce14175, "popularContact", new Field[] { new Field("client_id", LONG, "", 0, -1), new Field("importers", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5cf09635),
            new Spec(0x5cf09635, "messages.getSavedGifs", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5d20bae8),
            new Spec(0x5d20bae8, "messageActionChangeCommunity", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("community_id", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x5d75a138),
            new Spec(0x5d75a138, "updates.differenceEmpty", new Field[] { new Field("date", INT, "", 0, -1), new Field("seq", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5d8d353b),
            new Spec(0x5d8d353b, "channelAdminLogEventActionPinTopic", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("prev_topic", OBJECT, "ForumTopic", 1, 0), new Field("new_topic", OBJECT, "ForumTopic", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x5da674b7),
            new Spec(0x5da674b7, "botAppNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5dab1af4),
            new Spec(0x5dab1af4, "exportedMessageLink", new Field[] { new Field("link", STRING, "", 0, -1), new Field("html", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5dc60f03),
            new Spec(0x5dc60f03, "messages.checkHistoryImportPeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5dd69e12),
            new Spec(0x5dd69e12, "contacts.getContacts", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5dee78b0),
            new Spec(0x5dee78b0, "account.setMainProfileTab", new Field[] { new Field("tab", OBJECT, "ProfileTab", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5e002502),
            new Spec(0x5e002502, "auth.sentCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("type", OBJECT, "auth.SentCodeType", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("next_type", OBJECT, "auth.CodeType", 1, 1), new Field("timeout", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x5e0589f1),
            new Spec(0x5e0589f1, "starsGiftOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("extended", TRUE, "", 1, 1), new Field("stars", LONG, "", 0, -1), new Field("store_product", STRING, "", 1, 0), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5e0fb7b9),
            new Spec(0x5e0fb7b9, "messages.historyImportParsed", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pm", TRUE, "", 1, 0), new Field("group", TRUE, "", 1, 1), new Field("title", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x5e2ad36e),
            new Spec(0x5e2ad36e, "rpc_answer_unknown", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5e437ed9),
            new Spec(0x5e437ed9, "account.disablePeerConnectedBot", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5e477b25),
            new Spec(0x5e477b25, "channelAdminLogEventActionChangeProfilePeerColor", new Field[] { new Field("prev_value", OBJECT, "PeerColor", 0, -1), new Field("new_value", OBJECT, "PeerColor", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5e5259b6),
            new Spec(0x5e5259b6, "stories.updateAlbum", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("album_id", INT, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("delete_stories", VECTOR, "INT", 1, 1), new Field("add_stories", VECTOR, "INT", 1, 2), new Field("order", VECTOR, "INT", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x5ec4be43),
            new Spec(0x5ec4be43, "inlineQueryPeerTypeMegagroup", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5f150144),
            new Spec(0x5f150144, "stats.getMessagePublicForwards", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5f206716),
            new Spec(0x5f206716, "messages.messagesSlice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inexact", TRUE, "", 1, 1), new Field("count", INT, "", 0, -1), new Field("next_rate", INT, "", 1, 0), new Field("offset_id_offset", INT, "", 1, 2), new Field("search_flood", OBJECT, "SearchPostsFlood", 1, 3), new Field("messages", VECTOR, "Message", 0, -1), new Field("topics", VECTOR, "ForumTopic", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5f2178c3),
            new Spec(0x5f2178c3, "account.confirmPhone", new Field[] { new Field("phone_code_hash", STRING, "", 0, -1), new Field("phone_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5f2d1df2),
            new Spec(0x5f2d1df2, "premiumSubscriptionOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("current", TRUE, "", 1, 1), new Field("can_purchase_upgrade", TRUE, "", 1, 2), new Field("transaction", STRING, "", 1, 3), new Field("months", INT, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("bot_url", STRING, "", 0, -1), new Field("store_product", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x5f3b8a00),
            new Spec(0x5f3b8a00, "requestPeerTypeUser", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot", BOOL, "", 1, 0), new Field("premium", BOOL, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x5f5c95f1),
            new Spec(0x5f5c95f1, "channelAdminLogEventActionTogglePreHistoryHidden", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x5f91eb5b),
            new Spec(0x5f91eb5b, "messages.quickRepliesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x5fb224d5),
            new Spec(0x5fb224d5, "chatAdminRights", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("change_info", TRUE, "", 1, 0), new Field("post_messages", TRUE, "", 1, 1), new Field("edit_messages", TRUE, "", 1, 2), new Field("delete_messages", TRUE, "", 1, 3), new Field("ban_users", TRUE, "", 1, 4), new Field("invite_users", TRUE, "", 1, 5), new Field("pin_messages", TRUE, "", 1, 7), new Field("add_admins", TRUE, "", 1, 9), new Field("anonymous", TRUE, "", 1, 10), new Field("manage_call", TRUE, "", 1, 11), new Field("other", TRUE, "", 1, 12), new Field("manage_topics", TRUE, "", 1, 13), new Field("post_stories", TRUE, "", 1, 14), new Field("edit_stories", TRUE, "", 1, 15), new Field("delete_stories", TRUE, "", 1, 16), new Field("manage_direct_messages", TRUE, "", 1, 17), new Field("manage_ranks", TRUE, "", 1, 18), new Field("manage_linked_peers", TRUE, "", 1, 19), new Field("manage_welcome_messages", TRUE, "", 1, 20) }));
        BY_ID.put(Integer.valueOf(0x5ff58f20),
            new Spec(0x5ff58f20, "payments.launchPrepaidGiveaway", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("giveaway_id", LONG, "", 0, -1), new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60073674),
            new Spec(0x60073674, "account.deleteBusinessChatLink", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6010c534),
            new Spec(0x6010c534, "messages.foundStickersNotModified", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("next_offset", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x60297dec),
            new Spec(0x60297dec, "messages.updateSavedReactionTag", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1), new Field("title", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x60331907),
            new Spec(0x60331907, "messages.reorderQuickReplies", new Field[] { new Field("order", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60469778),
            new Spec(0x60469778, "req_pq", new Field[] { new Field("nonce", INT128, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60682812),
            new Spec(0x60682812, "starsTransactionPeerAds", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6090d6d5),
            new Spec(0x6090d6d5, "storyReaction", new Field[] { new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60a79c79),
            new Spec(0x60a79c79, "channelAdminLogEventActionToggleSignatureProfiles", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60bccb0d),
            new Spec(0x60bccb0d, "walletOwnershipProof", new Field[] { new Field("timestamp", INT, "", 0, -1), new Field("signature", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60eaefa1),
            new Spec(0x60eaefa1, "payments.toggleChatStarGiftNotifications", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("enabled", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60ed4229),
            new Spec(0x60ed4229, "account.toggleWebBrowserSettingsException", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("delete", TRUE, "", 1, 1), new Field("open_external_browser", BOOL, "", 1, 0), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60f67660),
            new Spec(0x60f67660, "premium.getBoostsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("gifts", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x60fe3294),
            new Spec(0x60fe3294, "draftMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 1), new Field("invert_media", TRUE, "", 1, 6), new Field("reply_to", OBJECT, "InputReplyTo", 1, 4), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 3), new Field("media", OBJECT, "InputMedia", 1, 5), new Field("date", INT, "", 0, -1), new Field("effect", LONG, "", 1, 7), new Field("suggested_post", OBJECT, "SuggestedPost", 1, 8), new Field("rich_message", OBJECT, "RichMessage", 1, 9) }));
        BY_ID.put(Integer.valueOf(0x6126a43c),
            new Spec(0x6126a43c, "messages.searchGlobal", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("broadcasts_only", TRUE, "", 1, 1), new Field("groups_only", TRUE, "", 1, 2), new Field("users_only", TRUE, "", 1, 3), new Field("folder_id", INT, "", 1, 0), new Field("community", OBJECT, "InputChannel", 1, 4), new Field("q", STRING, "", 0, -1), new Field("filter", OBJECT, "MessagesFilter", 0, -1), new Field("min_date", INT, "", 0, -1), new Field("max_date", INT, "", 0, -1), new Field("offset_rate", INT, "", 0, -1), new Field("offset_peer", OBJECT, "InputPeer", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x61695cb0),
            new Spec(0x61695cb0, "chatInvitePeek", new Field[] { new Field("chat", OBJECT, "Chat", 0, -1), new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x616f7fe8),
            new Spec(0x616f7fe8, "inputStorePaymentGiftPremium", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x61ca29d3),
            new Spec(0x61ca29d3, "messages.chatInviteJoinResultWebView", new Field[] { new Field("bot_id", LONG, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x61e3f854),
            new Spec(0x61e3f854, "help.getAppConfig", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x61f0d4c7),
            new Spec(0x61f0d4c7, "encryptedChat", new Field[] { new Field("id", INT, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1), new Field("g_a_or_b", BYTES, "", 0, -1), new Field("key_fingerprint", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x621d5fa0),
            new Spec(0x621d5fa0, "stats.loadAsyncGraph", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("token", STRING, "", 0, -1), new Field("x", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x623a8fa0),
            new Spec(0x623a8fa0, "urlAuthResultAccepted", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("url", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x628c9224),
            new Spec(0x628c9224, "missingInvitee", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("premium_would_allow_invite", TRUE, "", 1, 0), new Field("premium_required_for_pm", TRUE, "", 1, 1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x628cbc6f),
            new Spec(0x628cbc6f, "sendMessageChooseContactAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x629f1980),
            new Spec(0x629f1980, "auth.loginToken", new Field[] { new Field("expires", INT, "", 0, -1), new Field("token", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x62ba04d9),
            new Spec(0x62ba04d9, "updateNewChannelMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x62d350c9),
            new Spec(0x62d350c9, "destroy_session_none", new Field[] { new Field("session_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x62d6b459),
            new Spec(0x62d6b459, "msgs_ack", new Field[] { new Field("msg_ids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x62d706b8),
            new Spec(0x62d706b8, "users.users", new Field[] { new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x62dc8b48),
            new Spec(0x62dc8b48, "inputFileStoryDocument", new Field[] { new Field("id", OBJECT, "InputDocument", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6319d612),
            new Spec(0x6319d612, "documentAttributeSticker", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("mask", TRUE, "", 1, 1), new Field("alt", STRING, "", 0, -1), new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("mask_coords", OBJECT, "MaskCoords", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x6334ee9a),
            new Spec(0x6334ee9a, "inlineQueryPeerTypeBroadcast", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x635b4c09),
            new Spec(0x635b4c09, "updateChannel", new Field[] { new Field("channel_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x635fe375),
            new Spec(0x635fe375, "phoneConnectionWebrtc", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("turn", TRUE, "", 1, 0), new Field("stun", TRUE, "", 1, 1), new Field("id", LONG, "", 0, -1), new Field("ip", STRING, "", 0, -1), new Field("ipv6", STRING, "", 0, -1), new Field("port", INT, "", 0, -1), new Field("username", STRING, "", 0, -1), new Field("password", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x63a440dc),
            new Spec(0x63a440dc, "inputWalletNew", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x63c3dd0a),
            new Spec(0x63c3dd0a, "stories.stories", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("stories", VECTOR, "StoryItem", 0, -1), new Field("pinned_to_top", VECTOR, "INT", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x63c66506),
            new Spec(0x63c66506, "messages.getMessages", new Field[] { new Field("id", VECTOR, "InputMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x63ca67aa),
            new Spec(0x63ca67aa, "pageListItemBlocks", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("checkbox", TRUE, "", 1, 0), new Field("checked", TRUE, "", 1, 1), new Field("blocks", VECTOR, "PageBlock", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x63cacf26),
            new Spec(0x63cacf26, "account.autoDownloadSettings", new Field[] { new Field("low", OBJECT, "AutoDownloadSettings", 0, -1), new Field("medium", OBJECT, "AutoDownloadSettings", 0, -1), new Field("high", OBJECT, "AutoDownloadSettings", 0, -1) }));
    }

    private static void init5() {
        BY_ID.put(Integer.valueOf(0x640f82b8),
            new Spec(0x640f82b8, "messages.getMaskStickers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6410a5d2),
            new Spec(0x6410a5d2, "stickerSetCovered", new Field[] { new Field("set", OBJECT, "StickerSet", 0, -1), new Field("cover", OBJECT, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64199744),
            new Spec(0x64199744, "secureFileEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x64407ea7),
            new Spec(0x64407ea7, "monoForumDialog", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unread_mark", TRUE, "", 1, 3), new Field("nopaid_messages_exception", TRUE, "", 1, 4), new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_message", INT, "", 0, -1), new Field("read_inbox_max_id", INT, "", 0, -1), new Field("read_outbox_max_id", INT, "", 0, -1), new Field("unread_count", INT, "", 0, -1), new Field("unread_reactions_count", INT, "", 0, -1), new Field("draft", OBJECT, "DraftMessage", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x644f15c0),
            new Spec(0x644f15c0, "auth.initFirebasePnvLogin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("except_ids", VECTOR, "LONG", 1, 0), new Field("api_id", INT, "", 0, -1), new Field("api_hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64600527),
            new Spec(0x64600527, "inputDialogPeerFolder", new Field[] { new Field("folder_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64642db3),
            new Spec(0x64642db3, "channelAdminLogEventActionParticipantSubExtend", new Field[] { new Field("prev_participant", OBJECT, "ChannelParticipant", 0, -1), new Field("new_participant", OBJECT, "ChannelParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x646e1097),
            new Spec(0x646e1097, "account.toggleConnectedBotPaused", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("paused", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64780b14),
            new Spec(0x64780b14, "messages.getFeaturedStickers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64bd0306),
            new Spec(0x64bd0306, "inputEncryptedFileUploaded", new Field[] { new Field("id", LONG, "", 0, -1), new Field("parts", INT, "", 0, -1), new Field("md5_checksum", STRING, "", 0, -1), new Field("key_fingerprint", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64e475c2),
            new Spec(0x64e475c2, "messageEntityEmail", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64f36dfc),
            new Spec(0x64f36dfc, "channelAdminLogEventActionToggleAntiSpam", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x64ff9fd5),
            new Spec(0x64ff9fd5, "messages.chats", new Field[] { new Field("chats", VECTOR, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x652e4400),
            new Spec(0x652e4400, "account.createTheme", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("document", OBJECT, "InputDocument", 1, 2), new Field("settings", VECTOR, "InputThemeSettings", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x653db63d),
            new Spec(0x653db63d, "chatlists.editExportedInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("chatlist", OBJECT, "InputChatlist", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("title", STRING, "", 1, 1), new Field("peers", VECTOR, "InputPeer", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x65427b82),
            new Spec(0x65427b82, "privacyValueAllowAll", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x65899777),
            new Spec(0x65899777, "userStatusLastMonth", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("by_me", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x658b7188),
            new Spec(0x658b7188, "messages.getDefaultHistoryTTL", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6592a1a7),
            new Spec(0x6592a1a7, "chatForbidden", new Field[] { new Field("id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x65a0fa4d),
            new Spec(0x65a0fa4d, "pageBlockCollage", new Field[] { new Field("items", VECTOR, "PageBlock", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x65ad71dc),
            new Spec(0x65ad71dc, "account.getMultiWallPapers", new Field[] { new Field("wallpapers", VECTOR, "InputWallPaper", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x65efe954),
            new Spec(0x65efe954, "community", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("left", TRUE, "", 1, 2), new Field("min", TRUE, "", 1, 12), new Field("flags2", FLAGWORD, "", 0, -1), new Field("collapsed_in_dialogs", TRUE, "", 2, 20), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 1, 13), new Field("title", STRING, "", 0, -1), new Field("photo", OBJECT, "ChatPhoto", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_rights", OBJECT, "ChatAdminRights", 1, 14), new Field("default_banned_rights", OBJECT, "ChatBannedRights", 1, 18) }));
        BY_ID.put(Integer.valueOf(0x65f00ce3),
            new Spec(0x65f00ce3, "inputInvoiceStars", new Field[] { new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x661d4037),
            new Spec(0x661d4037, "chatReactionsSome", new Field[] { new Field("reactions", VECTOR, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6628562c),
            new Spec(0x6628562c, "account.updateStatus", new Field[] { new Field("offline", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6643b654),
            new Spec(0x6643b654, "client_DH_inner_data", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("retry_id", LONG, "", 0, -1), new Field("g_b", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x666220e9),
            new Spec(0x666220e9, "secureValueErrorFiles", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", VECTOR, "BYTES", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x66a08c7e),
            new Spec(0x66a08c7e, "account.updateConnectedBot", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("deleted", TRUE, "", 1, 1), new Field("rights", OBJECT, "BusinessBotRights", 1, 0), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("recipients", OBJECT, "InputBusinessBotRecipients", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x66a66a3b),
            new Spec(0x66a66a3b, "inputWalletImported", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("public_key", BYTES, "", 0, -1), new Field("anchor_public_key", BYTES, "", 1, 0), new Field("proof", OBJECT, "WalletOwnershipProof", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x66afa166),
            new Spec(0x66afa166, "help.deepLinkInfoEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x66b25953),
            new Spec(0x66b25953, "encryptedChatWaiting", new Field[] { new Field("id", INT, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x66b57b41),
            new Spec(0x66b57b41, "wallet.tonConnectClaimRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("declined", TRUE, "", 1, 1), new Field("session_id", LONG, "", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("app_request_id", STRING, "", 0, -1), new Field("challenge_answer", BYTES, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x66b91b70),
            new Spec(0x66b91b70, "help.editUserInfo", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x66cdafc4),
            new Spec(0x66cdafc4, "account.updateBusinessGreetingMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("message", OBJECT, "InputBusinessGreetingMessage", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x66d1670b),
            new Spec(0x66d1670b, "pageBlockBlockquote", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collapsed", TRUE, "", 1, 0), new Field("text", OBJECT, "RichText", 0, -1), new Field("caption", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x66e486fb),
            new Spec(0x66e486fb, "chatlists.hideChatlistUpdates", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6724abc4),
            new Spec(0x6724abc4, "textBold", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x67753ac8),
            new Spec(0x67753ac8, "groupCallParticipantVideo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("paused", TRUE, "", 1, 0), new Field("endpoint", STRING, "", 0, -1), new Field("source_groups", VECTOR, "GroupCallParticipantVideoSourceGroup", 0, -1), new Field("audio_source", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x67a3f0de),
            new Spec(0x67a3f0de, "messages.acceptUrlAuth", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("write_allowed", TRUE, "", 1, 0), new Field("share_phone_number", TRUE, "", 1, 3), new Field("peer", OBJECT, "InputPeer", 1, 1), new Field("msg_id", INT, "", 1, 1), new Field("button_id", INT, "", 1, 1), new Field("url", STRING, "", 1, 2), new Field("match_code", STRING, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x67a3ff2c),
            new Spec(0x67a3ff2c, "auth.importBotAuthorization", new Field[] { new Field("flags", INT, "", 0, -1), new Field("api_id", INT, "", 0, -1), new Field("api_hash", STRING, "", 0, -1), new Field("bot_auth_token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x67e731ad),
            new Spec(0x67e731ad, "pageBlockHeading3", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x67ed1f68),
            new Spec(0x67ed1f68, "account.confirmBotConnection", new Field[] { new Field("bot_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x682a41a9),
            new Spec(0x682a41a9, "pageBlockHeading6", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x682d2594),
            new Spec(0x682d2594, "account.resetWebAuthorizations", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x683b2c52),
            new Spec(0x683b2c52, "updatePinnedForumTopic", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("topic_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6847d0ab),
            new Spec(0x6847d0ab, "folders.editPeerFolders", new Field[] { new Field("folder_peers", VECTOR, "InputFolderPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x684d214e),
            new Spec(0x684d214e, "account.updateColor", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("for_profile", TRUE, "", 1, 1), new Field("color", OBJECT, "PeerColor", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x686c85a6),
            new Spec(0x686c85a6, "updatePinnedSavedDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("order", VECTOR, "DialogPeer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x6880b94d),
            new Spec(0x6880b94d, "messages.peerSettings", new Field[] { new Field("settings", OBJECT, "PeerSettings", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x688a30aa),
            new Spec(0x688a30aa, "updateNewStickerSet", new Field[] { new Field("stickerset", OBJECT, "messages.StickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x68cb6283),
            new Spec(0x68cb6283, "messageMediaStory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_mention", TRUE, "", 1, 1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("id", INT, "", 0, -1), new Field("story", OBJECT, "StoryItem", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x68f3e4eb),
            new Spec(0x68f3e4eb, "channels.toggleAntiSpam", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x691e9052),
            new Spec(0x691e9052, "updateInlineBotCallbackQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("msg_id", OBJECT, "InputBotInlineMessageID", 0, -1), new Field("chat_instance", LONG, "", 0, -1), new Field("data", BYTES, "", 1, 0), new Field("game_short_name", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x691f4360),
            new Spec(0x691f4360, "wallet.getExistingWaltBalance", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x69279795),
            new Spec(0x69279795, "inputSavedStarGiftUser", new Field[] { new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x692a5488),
            new Spec(0x692a5488, "pageButton", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("text", OBJECT, "RichText", 0, -1), new Field("type", OBJECT, "InlineButtonType", 0, -1), new Field("style", OBJECT, "RichButtonStyle", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x695c9e7c),
            new Spec(0x695c9e7c, "updateReadChannelDiscussionOutbox", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("top_msg_id", INT, "", 0, -1), new Field("read_max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x69b8c4bf),
            new Spec(0x69b8c4bf, "messageActionWalletTonConnectRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("accepted", TRUE, "", 1, 2), new Field("declined", TRUE, "", 1, 3), new Field("session_id", LONG, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("topic", STRING, "", 1, 0), new Field("trace_id", STRING, "", 1, 1), new Field("dapp_name", STRING, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x69d66c45),
            new Spec(0x69d66c45, "inputReplyToMonoForum", new Field[] { new Field("monoforum_peer_id", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x69da4557),
            new Spec(0x69da4557, "payments.getStarsTransactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inbound", TRUE, "", 1, 0), new Field("outbound", TRUE, "", 1, 1), new Field("ascending", TRUE, "", 1, 2), new Field("ton", TRUE, "", 1, 4), new Field("subscription_id", STRING, "", 1, 3), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x69ec56a3),
            new Spec(0x69ec56a3, "privacyKeyForwards", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x69ef72c4),
            new Spec(0x69ef72c4, "inputDialogPeerCommunity", new Field[] { new Field("community", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x69f59d69),
            new Spec(0x69f59d69, "messages.toggleBotInAttachMenu", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("write_allowed", TRUE, "", 1, 0), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x69f916f8),
            new Spec(0x69f916f8, "messageActionSuggestedPostRefund", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("payer_initiated", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x6a0d3206),
            new Spec(0x6a0d3206, "account.unregisterDevice", new Field[] { new Field("token_type", INT, "", 0, -1), new Field("token", STRING, "", 0, -1), new Field("other_uids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6a1dc4be),
            new Spec(0x6a1dc4be, "inputPhoneContact", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("client_id", LONG, "", 0, -1), new Field("phone", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("note", OBJECT, "TextWithEntities", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x6a3f8d65),
            new Spec(0x6a3f8d65, "messages.getAllDrafts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6a4afc38),
            new Spec(0x6a4afc38, "channelAdminLogEventActionChangeUsername", new Field[] { new Field("prev_value", STRING, "", 0, -1), new Field("new_value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6a4ee832),
            new Spec(0x6a4ee832, "help.deepLinkInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("update_app", TRUE, "", 1, 0), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x6a596502),
            new Spec(0x6a596502, "langpack.getLanguage", new Field[] { new Field("lang_pack", STRING, "", 0, -1), new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6a6e7854),
            new Spec(0x6a6e7854, "channels.toggleParticipantsHidden", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6a7e7366),
            new Spec(0x6a7e7366, "updatePeerSettings", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("settings", OBJECT, "PeerSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6aa3f6bd),
            new Spec(0x6aa3f6bd, "messages.getSearchResultsCalendar", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 2), new Field("filter", OBJECT, "MessagesFilter", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6ac3f2aa),
            new Spec(0x6ac3f2aa, "updateWalletState", new Field[] { new Field("state", OBJECT, "WalletState", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6b134e8e),
            new Spec(0x6b134e8e, "privacyValueAllowChatParticipants", new Field[] { new Field("chats", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6b39f4ec),
            new Spec(0x6b39f4ec, "payments.starGiftAuctionState", new Field[] { new Field("gift", OBJECT, "StarGift", 0, -1), new Field("state", OBJECT, "StarGiftAuctionState", 0, -1), new Field("user_state", OBJECT, "StarGiftAuctionUserState", 0, -1), new Field("timeout", INT, "", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6b7da746),
            new Spec(0x6b7da746, "premium.applyBoost", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("slots", VECTOR, "INT", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6ba2cbec),
            new Spec(0x6ba2cbec, "payments.getStarGiftAuctionAcquiredGifts", new Field[] { new Field("gift_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c0d8e23),
            new Spec(0x6c0d8e23, "updateBotStarsSubscription", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("canceled", TRUE, "", 1, 0), new Field("payment_failed", TRUE, "", 1, 1), new Field("restored", TRUE, "", 1, 2), new Field("user_id", LONG, "", 0, -1), new Field("payload", BYTES, "", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c207376),
            new Spec(0x6c207376, "payments.starsRevenueStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("top_hours_graph", OBJECT, "StatsGraph", 1, 0), new Field("revenue_graph", OBJECT, "StatsGraph", 0, -1), new Field("status", OBJECT, "StarsRevenueStatus", 0, -1), new Field("usd_rate", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c24f3dd),
            new Spec(0x6c24f3dd, "topPeerCategoryBotsGuestChat", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6c37c15c),
            new Spec(0x6c37c15c, "documentAttributeImageSize", new Field[] { new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c3f19b9),
            new Spec(0x6c3f19b9, "textFixed", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c47ac9f),
            new Spec(0x6c47ac9f, "langPackStringPluralized", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("key", STRING, "", 0, -1), new Field("zero_value", STRING, "", 1, 0), new Field("one_value", STRING, "", 1, 1), new Field("two_value", STRING, "", 1, 2), new Field("few_value", STRING, "", 1, 3), new Field("many_value", STRING, "", 1, 4), new Field("other_value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c5a5b37),
            new Spec(0x6c5a5b37, "account.saveWallPaper", new Field[] { new Field("wallpaper", OBJECT, "InputWallPaper", 0, -1), new Field("unsave", BOOL, "", 0, -1), new Field("settings", OBJECT, "WallPaperSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c5cf2a7),
            new Spec(0x6c5cf2a7, "messages.sendBotRequestedPeer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 1, 0), new Field("webapp_req_id", STRING, "", 1, 1), new Field("button_id", INT, "", 0, -1), new Field("requested_peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c750de1),
            new Spec(0x6c750de1, "messages.sendQuickReplyMessages", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("shortcut_id", INT, "", 0, -1), new Field("id", VECTOR, "INT", 0, -1), new Field("random_id", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c8e1e06),
            new Spec(0x6c8e1e06, "birthday", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("day", INT, "", 0, -1), new Field("month", INT, "", 0, -1), new Field("year", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x6c9ce8ed),
            new Spec(0x6c9ce8ed, "payments.starsStatus", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("balance", OBJECT, "StarsAmount", 0, -1), new Field("subscriptions", VECTOR, "StarsSubscription", 1, 1), new Field("subscriptions_next_offset", STRING, "", 1, 2), new Field("subscriptions_missing_balance", LONG, "", 1, 4), new Field("history", VECTOR, "StarsTransaction", 1, 3), new Field("next_offset", STRING, "", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6c9d0efe),
            new Spec(0x6c9d0efe, "aicompose.tones", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("tones", VECTOR, "AiComposeTone", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6cef8ac7),
            new Spec(0x6cef8ac7, "messageEntityBotCommand", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6d038b58),
            new Spec(0x6d038b58, "payments.getStarGiftUpgradeAttributes", new Field[] { new Field("gift_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6d5f77ee),
            new Spec(0x6d5f77ee, "baseThemeTinted", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6d640318),
            new Spec(0x6d640318, "pageBlockButtonRow", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("align_left", TRUE, "", 1, 0), new Field("align_center", TRUE, "", 1, 1), new Field("align_right", TRUE, "", 1, 2), new Field("buttons", VECTOR, "PageButton", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6dfa0622),
            new Spec(0x6dfa0622, "payments.botCancelStarsSubscription", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("restore", TRUE, "", 1, 0), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("charge_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6e153f16),
            new Spec(0x6e153f16, "messages.stickerSet", new Field[] { new Field("set", OBJECT, "StickerSet", 0, -1), new Field("packs", VECTOR, "StickerPack", 0, -1), new Field("keywords", VECTOR, "StickerKeyword", 0, -1), new Field("documents", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6e2be050),
            new Spec(0x6e2be050, "messages.getOnlines", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6e6fe51c),
            new Spec(0x6e6fe51c, "updateDialogPinned", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("folder_id", INT, "", 1, 1), new Field("peer", OBJECT, "DialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6e941a38),
            new Spec(0x6e941a38, "channelAdminLogEventActionChangeHistoryTTL", new Field[] { new Field("prev_value", INT, "", 0, -1), new Field("new_value", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6ebdff91),
            new Spec(0x6ebdff91, "fragment.collectibleInfo", new Field[] { new Field("purchase_date", INT, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("crypto_amount", LONG, "", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6ed02538),
            new Spec(0x6ed02538, "messageEntityUrl", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6efc5e81),
            new Spec(0x6efc5e81, "stories.allStories", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_more", TRUE, "", 1, 0), new Field("count", INT, "", 0, -1), new Field("state", STRING, "", 0, -1), new Field("peer_stories", VECTOR, "PeerStories", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("stealth_mode", OBJECT, "StoriesStealthMode", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f02f748),
            new Spec(0x6f02f748, "help.saveAppLog", new Field[] { new Field("events", VECTOR, "InputAppEvent", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f09ac31),
            new Spec(0x6f09ac31, "reportResultAddComment", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("optional", TRUE, "", 1, 0), new Field("option", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f0c34df),
            new Spec(0x6f0c34df, "notificationSoundNone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6f635b0d),
            new Spec(0x6f635b0d, "messageEntityHashtag", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f636302),
            new Spec(0x6f636302, "phone.getGroupCallStars", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f6f9c96),
            new Spec(0x6f6f9c96, "messages.getSavedDialogsByID", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("parent_peer", OBJECT, "InputPeer", 1, 1), new Field("ids", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f70dde1),
            new Spec(0x6f70dde1, "account.getBusinessChatLinks", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6f747657),
            new Spec(0x6f747657, "pageCaption", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("credit", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x6f7863f4),
            new Spec(0x6f7863f4, "updateRecentReactions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6f8b32aa),
            new Spec(0x6f8b32aa, "inputBusinessRecipients", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("existing_chats", TRUE, "", 1, 0), new Field("new_chats", TRUE, "", 1, 1), new Field("contacts", TRUE, "", 1, 2), new Field("non_contacts", TRUE, "", 1, 3), new Field("exclude_selected", TRUE, "", 1, 5), new Field("users", VECTOR, "InputUser", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x6fb4ad87),
            new Spec(0x6fb4ad87, "messages.emojiGroupsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x6fe1a881),
            new Spec(0x6fe1a881, "botCommandScopeChats", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x702a40e0),
            new Spec(0x702a40e0, "messages.getRecentLocations", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x70322949),
            new Spec(0x70322949, "messageMediaContact", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("vcard", STRING, "", 0, -1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7063c3db),
            new Spec(0x7063c3db, "updatePendingJoinRequests", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("requests_pending", INT, "", 0, -1), new Field("recent_requesters", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7084a7be),
            new Spec(0x7084a7be, "updateContactsReset", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x709b2405),
            new Spec(0x709b2405, "channelAdminLogEventActionEditMessage", new Field[] { new Field("prev_message", OBJECT, "Message", 0, -1), new Field("new_message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x70abc3fd),
            new Spec(0x70abc3fd, "pageBlockTitle", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x70b772a8),
            new Spec(0x70b772a8, "contacts.topPeers", new Field[] { new Field("categories", VECTOR, "TopPeerCategoryPeers", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x70c32edb),
            new Spec(0x70c32edb, "account.changePhone", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("phone_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x70c4fe03),
            new Spec(0x70c4fe03, "payments.paymentReceipt", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("provider_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "WebDocument", 1, 2), new Field("invoice", OBJECT, "Invoice", 0, -1), new Field("info", OBJECT, "PaymentRequestedInfo", 1, 0), new Field("shipping", OBJECT, "ShippingOption", 1, 1), new Field("tip_amount", LONG, "", 1, 3), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("credentials_title", STRING, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x711d692d),
            new Spec(0x711d692d, "recentStory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("live", TRUE, "", 1, 0), new Field("max_id", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x712e27fd),
            new Spec(0x712e27fd, "storiesStealthMode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("active_until_date", INT, "", 1, 0), new Field("cooldown_until_date", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x71777116),
            new Spec(0x71777116, "messageEntityDiffInsert", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7184603b),
            new Spec(0x7184603b, "emojiStatusCollectible", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collectible_id", LONG, "", 0, -1), new Field("document_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("pattern_document_id", LONG, "", 0, -1), new Field("center_color", INT, "", 0, -1), new Field("edge_color", INT, "", 0, -1), new Field("pattern_color", INT, "", 0, -1), new Field("text_color", INT, "", 0, -1), new Field("until", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x719c5c5e),
            new Spec(0x719c5c5e, "chatlists.deleteExportedInvite", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1), new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x71bd134c),
            new Spec(0x71bd134c, "dialogFolder", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 2), new Field("folder", OBJECT, "Folder", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_message", INT, "", 0, -1), new Field("unread_muted_peers_count", INT, "", 0, -1), new Field("unread_unmuted_peers_count", INT, "", 0, -1), new Field("unread_muted_messages_count", INT, "", 0, -1), new Field("unread_unmuted_messages_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x71e094f3),
            new Spec(0x71e094f3, "messages.dialogsSlice", new Field[] { new Field("count", INT, "", 0, -1), new Field("dialogs", VECTOR, "Dialog", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x71e4ea58),
            new Spec(0x71e4ea58, "reactionsNotifySettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("messages_notify_from", OBJECT, "ReactionNotificationsFrom", 1, 0), new Field("stories_notify_from", OBJECT, "ReactionNotificationsFrom", 1, 1), new Field("poll_votes_notify_from", OBJECT, "ReactionNotificationsFrom", 1, 2), new Field("sound", OBJECT, "NotificationSound", 0, -1), new Field("show_previews", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x71f276c4),
            new Spec(0x71f276c4, "disallowedGiftsSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("disallow_unlimited_stargifts", TRUE, "", 1, 0), new Field("disallow_limited_stargifts", TRUE, "", 1, 1), new Field("disallow_unique_stargifts", TRUE, "", 1, 2), new Field("disallow_premium_gifts", TRUE, "", 1, 3), new Field("disallow_stargifts_from_channels", TRUE, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x7206e458),
            new Spec(0x7206e458, "account.getThemes", new Field[] { new Field("format", STRING, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x72091c80),
            new Spec(0x72091c80, "inputWallPaperSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x725afbbc),
            new Spec(0x725afbbc, "contacts.resolveUsername", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("username", STRING, "", 0, -1), new Field("referer", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x725b04c3),
            new Spec(0x725b04c3, "updatesCombined", new Field[] { new Field("updates", VECTOR, "Update", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("date", INT, "", 0, -1), new Field("seq_start", INT, "", 0, -1), new Field("seq", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x728bed5a),
            new Spec(0x728bed5a, "walletTransactionPeerUnsupported", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x72a3158c),
            new Spec(0x72a3158c, "auth.codeTypeSms", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x72c64955),
            new Spec(0x72c64955, "profileTabMedia", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x72f0eaae),
            new Spec(0x72f0eaae, "inputDocumentEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7307544f),
            new Spec(0x7307544f, "requestedPeerChat", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("chat_id", LONG, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("photo", OBJECT, "Photo", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x7311ca11),
            new Spec(0x7311ca11, "webPageNotModified", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("cached_page_views", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x734f9721),
            new Spec(0x734f9721, "ephemeral.deleteAllWelcomeMessages", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x735787a8),
            new Spec(0x735787a8, "help.getCountriesList", new Field[] { new Field("lang_code", STRING, "", 0, -1), new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x73665bc2),
            new Spec(0x73665bc2, "account.getSecureValue", new Field[] { new Field("types", VECTOR, "SecureValueType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x736dcfea),
            new Spec(0x736dcfea, "communities.togglePeerLink", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("visible", TRUE, "", 1, 0), new Field("hidden", TRUE, "", 1, 1), new Field("deleted", TRUE, "", 1, 2), new Field("community", OBJECT, "InputChannel", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x73746f5c),
            new Spec(0x73746f5c, "messages.getExportedChatInvite", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("link", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x73783ffd),
            new Spec(0x73783ffd, "messages.editChatTitle", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x73924be0),
            new Spec(0x73924be0, "messageEntityPre", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("language", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x73a379eb),
            new Spec(0x73a379eb, "highScore", new Field[] { new Field("pos", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("score", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x73ada76b),
            new Spec(0x73ada76b, "messageActionStarGiftPurchaseOfferDeclined", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("expired", TRUE, "", 1, 0), new Field("gift", OBJECT, "StarGift", 0, -1), new Field("price", OBJECT, "StarsAmount", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x741cd3e3),
            new Spec(0x741cd3e3, "auth.codeTypeCall", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x742df0a1),
            new Spec(0x742df0a1, "wallet.getGaslessInfo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x744694e0),
            new Spec(0x744694e0, "textPlain", new Field[] { new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x74535f21),
            new Spec(0x74535f21, "messages.messagesNotModified", new Field[] { new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7488ce5b),
            new Spec(0x7488ce5b, "messages.getEmojiGroups", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x74ae4240),
            new Spec(0x74ae4240, "updates", new Field[] { new Field("updates", VECTOR, "Update", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("date", INT, "", 0, -1), new Field("seq", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x74aee3e0),
            new Spec(0x74aee3e0, "starsTonAmount", new Field[] { new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x74bf076b),
            new Spec(0x74bf076b, "payments.convertStarGift", new Field[] { new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x74cda504),
            new Spec(0x74cda504, "messagePeerVoteInputOption", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x74d8be99),
            new Spec(0x74d8be99, "updateSavedRingtones", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x74fae13a),
            new Spec(0x74fae13a, "chatlists.leaveChatlist", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1), new Field("peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x751f08fa),
            new Spec(0x751f08fa, "inputStorePaymentStarsGiveaway", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("only_new_subscribers", TRUE, "", 1, 0), new Field("winners_are_visible", TRUE, "", 1, 3), new Field("stars", LONG, "", 0, -1), new Field("boost_peer", OBJECT, "InputPeer", 0, -1), new Field("additional_peers", VECTOR, "InputPeer", 1, 1), new Field("countries_iso2", VECTOR, "STRING", 1, 2), new Field("prize_description", STRING, "", 1, 4), new Field("random_id", LONG, "", 0, -1), new Field("until_date", INT, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("users", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x751f3146),
            new Spec(0x751f3146, "textWithEntities", new Field[] { new Field("text", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7533a588),
            new Spec(0x7533a588, "botMenuButtonDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x75588b3f),
            new Spec(0x75588b3f, "inputClientProxy", new Field[] { new Field("address", STRING, "", 0, -1), new Field("port", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7573a4e9),
            new Spec(0x7573a4e9, "users.getSavedMusicByID", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1), new Field("documents", VECTOR, "InputDocument", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x75a3f765),
            new Spec(0x75a3f765, "bind_auth_key_inner", new Field[] { new Field("nonce", LONG, "", 0, -1), new Field("temp_auth_key_id", LONG, "", 0, -1), new Field("perm_auth_key_id", LONG, "", 0, -1), new Field("temp_session_id", LONG, "", 0, -1), new Field("expires_at", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x75b3b798),
            new Spec(0x75b3b798, "updateStory", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("story", OBJECT, "StoryItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x75c78e60),
            new Spec(0x75c78e60, "photoSize", new Field[] { new Field("type", STRING, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("size", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7600b9d3),
            new Spec(0x7600b9d3, "message", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("out", TRUE, "", 1, 1), new Field("mentioned", TRUE, "", 1, 4), new Field("media_unread", TRUE, "", 1, 5), new Field("silent", TRUE, "", 1, 13), new Field("post", TRUE, "", 1, 14), new Field("from_scheduled", TRUE, "", 1, 18), new Field("legacy", TRUE, "", 1, 19), new Field("edit_hide", TRUE, "", 1, 21), new Field("pinned", TRUE, "", 1, 24), new Field("noforwards", TRUE, "", 1, 26), new Field("invert_media", TRUE, "", 1, 27), new Field("flags2", FLAGWORD, "", 0, -1), new Field("offline", TRUE, "", 2, 1), new Field("video_processing_pending", TRUE, "", 2, 4), new Field("paid_suggested_post_stars", TRUE, "", 2, 8), new Field("paid_suggested_post_ton", TRUE, "", 2, 9), new Field("id", INT, "", 0, -1), new Field("from_id", OBJECT, "Peer", 1, 8), new Field("from_boosts_applied", INT, "", 1, 29), new Field("from_rank", STRING, "", 2, 12), new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("saved_peer_id", OBJECT, "Peer", 1, 28), new Field("fwd_from", OBJECT, "MessageFwdHeader", 1, 2), new Field("via_bot_id", LONG, "", 1, 11), new Field("via_business_bot_id", LONG, "", 2, 0), new Field("guestchat_via_from", OBJECT, "Peer", 2, 19), new Field("reply_to", OBJECT, "MessageReplyHeader", 1, 3), new Field("date", INT, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("media", OBJECT, "MessageMedia", 1, 9), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 6), new Field("entities", VECTOR, "MessageEntity", 1, 7), new Field("views", INT, "", 1, 10), new Field("forwards", INT, "", 1, 10), new Field("replies", OBJECT, "MessageReplies", 1, 23), new Field("edit_date", INT, "", 1, 15), new Field("post_author", STRING, "", 1, 16), new Field("grouped_id", LONG, "", 1, 17), new Field("reactions", OBJECT, "MessageReactions", 1, 20), new Field("restriction_reason", VECTOR, "RestrictionReason", 1, 22), new Field("ttl_period", INT, "", 1, 25), new Field("quick_reply_shortcut_id", INT, "", 1, 30), new Field("effect", LONG, "", 2, 2), new Field("factcheck", OBJECT, "FactCheck", 2, 3), new Field("report_delivery_until_date", INT, "", 2, 5), new Field("paid_message_stars", LONG, "", 2, 6), new Field("suggested_post", OBJECT, "SuggestedPost", 2, 7), new Field("schedule_repeat_period", INT, "", 2, 10), new Field("summary_from_language", STRING, "", 2, 11), new Field("rich_message", OBJECT, "RichMessage", 2, 13) }));
        BY_ID.put(Integer.valueOf(0x76141ebd),
            new Spec(0x76141ebd, "communityPeer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_view_history", TRUE, "", 1, 2), new Field("visible", BOOL, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x761e6af4),
            new Spec(0x761e6af4, "messageEntityBankCard", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x764cf810),
            new Spec(0x764cf810, "botInlineMessageMediaAuto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invert_media", TRUE, "", 1, 3), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x76768bed),
            new Spec(0x76768bed, "pageBlockDetails", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("open", TRUE, "", 1, 0), new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("title", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x767d61eb),
            new Spec(0x767d61eb, "help.peerColorProfileSet", new Field[] { new Field("palette_colors", VECTOR, "INT", 0, -1), new Field("bg_colors", VECTOR, "INT", 0, -1), new Field("story_colors", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x768e3aad),
            new Spec(0x768e3aad, "messages.availableReactions", new Field[] { new Field("hash", INT, "", 0, -1), new Field("reactions", VECTOR, "AvailableReaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7699f014),
            new Spec(0x7699f014, "updateMessagePollVote", new Field[] { new Field("poll_id", LONG, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("options", VECTOR, "BYTES", 0, -1), new Field("positions", VECTOR, "INT", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x76a6d327),
            new Spec(0x76a6d327, "messageEntityTextUrl", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x76a86270),
            new Spec(0x76a86270, "account.getBotBusinessConnection", new Field[] { new Field("connection_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x76f36233),
            new Spec(0x76f36233, "account.saveAutoDownloadSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("low", TRUE, "", 1, 0), new Field("high", TRUE, "", 1, 1), new Field("settings", OBJECT, "AutoDownloadSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x770416af),
            new Spec(0x770416af, "mediaAreaChannelPost", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("channel_id", LONG, "", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x771a4e66),
            new Spec(0x771a4e66, "starGiftAuctionState", new Field[] { new Field("version", INT, "", 0, -1), new Field("start_date", INT, "", 0, -1), new Field("end_date", INT, "", 0, -1), new Field("min_bid_amount", LONG, "", 0, -1), new Field("bid_levels", VECTOR, "AuctionBidLevel", 0, -1), new Field("top_bidders", VECTOR, "LONG", 0, -1), new Field("next_round_at", INT, "", 0, -1), new Field("last_gift_num", INT, "", 0, -1), new Field("gifts_left", INT, "", 0, -1), new Field("current_round", INT, "", 0, -1), new Field("total_rounds", INT, "", 0, -1), new Field("rounds", VECTOR, "StarGiftAuctionRound", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x77216192),
            new Spec(0x77216192, "messages.getAttachMenuBot", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7727a7d5),
            new Spec(0x7727a7d5, "account.getChannelDefaultEmojiStatuses", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x773f4e66),
            new Spec(0x773f4e66, "messageMediaPoll", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("poll", OBJECT, "Poll", 0, -1), new Field("results", OBJECT, "PollResults", 0, -1), new Field("attached_media", OBJECT, "MessageMedia", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x774278d4),
            new Spec(0x774278d4, "messageActionStarGiftPurchaseOffer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("accepted", TRUE, "", 1, 0), new Field("declined", TRUE, "", 1, 1), new Field("gift", OBJECT, "StarGift", 0, -1), new Field("price", OBJECT, "StarsAmount", 0, -1), new Field("expires_at", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x775d7244),
            new Spec(0x775d7244, "wallet.tonConnectNextEventId", new Field[] { new Field("session_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x77608b83),
            new Spec(0x77608b83, "keyboardButtonRow", new Field[] { new Field("buttons", VECTOR, "KeyboardButton", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x77744d4a),
            new Spec(0x77744d4a, "dialogFilterSuggested", new Field[] { new Field("filter", OBJECT, "DialogFilter", 0, -1), new Field("description", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7780bcb4),
            new Spec(0x7780bcb4, "groupCallDiscarded", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("duration", INT, "", 0, -1) }));
    }

    private static void init6() {
        BY_ID.put(Integer.valueOf(0x7781fe18),
            new Spec(0x7781fe18, "webPageAttributeAiComposeTone", new Field[] { new Field("emoji_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x778b5ab3),
            new Spec(0x778b5ab3, "bots.updateStarRefProgram", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("commission_permille", INT, "", 0, -1), new Field("duration_months", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x778d902f),
            new Spec(0x778d902f, "smsjobs.getSmsJob", new Field[] { new Field("job_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x779600f9),
            new Spec(0x779600f9, "inputMediaDocumentExternal", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 1), new Field("url", STRING, "", 0, -1), new Field("ttl_seconds", INT, "", 1, 0), new Field("video_cover", OBJECT, "InputPhoto", 1, 2), new Field("video_timestamp", INT, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x77b0e372),
            new Spec(0x77b0e372, "updateReadMonoForumInbox", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("saved_peer_id", OBJECT, "Peer", 0, -1), new Field("read_max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x77b15d1c),
            new Spec(0x77b15d1c, "stickerSetNoCovered", new Field[] { new Field("set", OBJECT, "StickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x77cdc9f1),
            new Spec(0x77cdc9f1, "inputPrivacyValueAllowPremium", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x77ced9d0),
            new Spec(0x77ced9d0, "channels.getParticipants", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("filter", OBJECT, "ChannelParticipantsFilter", 0, -1), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x77d01c3b),
            new Spec(0x77d01c3b, "contacts.importedContacts", new Field[] { new Field("imported", VECTOR, "ImportedContact", 0, -1), new Field("popular_invites", VECTOR, "PopularContact", 0, -1), new Field("retry_contacts", VECTOR, "LONG", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x780a0310),
            new Spec(0x780a0310, "help.termsOfService", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("popup", TRUE, "", 1, 0), new Field("id", OBJECT, "DataJSON", 0, -1), new Field("text", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 0, -1), new Field("min_age_confirm", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x78337739),
            new Spec(0x78337739, "messages.reorderStickerSets", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("masks", TRUE, "", 1, 0), new Field("emojis", TRUE, "", 1, 1), new Field("order", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x783f6b56),
            new Spec(0x783f6b56, "auth.firebasePnvSignUp", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_joined_notifications", TRUE, "", 1, 0), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x78499170),
            new Spec(0x78499170, "stories.getPeerMaxIDs", new Field[] { new Field("id", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x78515775),
            new Spec(0x78515775, "account.updateProfile", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("first_name", STRING, "", 1, 0), new Field("last_name", STRING, "", 1, 1), new Field("about", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x788464e1),
            new Spec(0x788464e1, "bots.setBotBroadcastDefaultAdminRights", new Field[] { new Field("admin_rights", OBJECT, "ChatAdminRights", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x788d7fe3),
            new Spec(0x788d7fe3, "users.getSavedMusic", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x78d4dec1),
            new Spec(0x78d4dec1, "updateShort", new Field[] { new Field("update", OBJECT, "Update", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x78fbf3a8),
            new Spec(0x78fbf3a8, "starGiftAttributeRarityEpic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7903e3d9),
            new Spec(0x7903e3d9, "messageReportOption", new Field[] { new Field("text", STRING, "", 0, -1), new Field("option", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x791451ed),
            new Spec(0x791451ed, "messages.setEncryptedTyping", new Field[] { new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("typing", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x794d486f),
            new Spec(0x794d486f, "wallet.nftItems", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("items", VECTOR, "wallet.NftItem", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x7998c914),
            new Spec(0x7998c914, "payments.sendStarsForm", new Field[] { new Field("form_id", LONG, "", 0, -1), new Field("invoice", OBJECT, "InputInvoice", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x79cb045d),
            new Spec(0x79cb045d, "server_DH_params_fail", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce_hash", INT128, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x79eb8cb3),
            new Spec(0x79eb8cb3, "account.webBrowserSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("open_external_browser", TRUE, "", 1, 0), new Field("display_close_button", TRUE, "", 1, 1), new Field("external_exceptions", VECTOR, "WebDomainException", 0, -1), new Field("inapp_exceptions", VECTOR, "WebDomainException", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x79f5d419),
            new Spec(0x79f5d419, "reactionEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7a0d7f42),
            new Spec(0x7a0d7f42, "messageActionGroupCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("duration", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x7a1e11d1),
            new Spec(0x7a1e11d1, "emojiList", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("document_id", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7a5fa236),
            new Spec(0x7a5fa236, "payments.getResaleStarGifts", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("sort_by_price", TRUE, "", 1, 1), new Field("sort_by_num", TRUE, "", 1, 2), new Field("for_craft", TRUE, "", 1, 4), new Field("stars_only", TRUE, "", 1, 5), new Field("attributes_hash", LONG, "", 1, 0), new Field("gift_id", LONG, "", 0, -1), new Field("attributes", VECTOR, "StarGiftAttributeId", 1, 3), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7a700873),
            new Spec(0x7a700873, "secureValueErrorFile", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7a777135),
            new Spec(0x7a777135, "phone.discardGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7a7c17a4),
            new Spec(0x7a7c17a4, "inputMessagesFilterRoundVoice", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7a7f2a15),
            new Spec(0x7a7f2a15, "account.resendPasswordEmail", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7a800e0a),
            new Spec(0x7a800e0a, "messageService", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("out", TRUE, "", 1, 1), new Field("mentioned", TRUE, "", 1, 4), new Field("media_unread", TRUE, "", 1, 5), new Field("reactions_are_possible", TRUE, "", 1, 9), new Field("silent", TRUE, "", 1, 13), new Field("post", TRUE, "", 1, 14), new Field("legacy", TRUE, "", 1, 19), new Field("id", INT, "", 0, -1), new Field("from_id", OBJECT, "Peer", 1, 8), new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("saved_peer_id", OBJECT, "Peer", 1, 28), new Field("reply_to", OBJECT, "MessageReplyHeader", 1, 3), new Field("date", INT, "", 0, -1), new Field("action", OBJECT, "MessageAction", 0, -1), new Field("reactions", OBJECT, "MessageReactions", 1, 20), new Field("ttl_period", INT, "", 1, 25) }));
        BY_ID.put(Integer.valueOf(0x7a8011e9),
            new Spec(0x7a8011e9, "onrampQuote", new Field[] { new Field("base_currency", STRING, "", 0, -1), new Field("base_amount", STRING, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("crypto_amount", STRING, "", 0, -1), new Field("crypto_price", STRING, "", 0, -1), new Field("fee_amount", STRING, "", 0, -1), new Field("extra_fee_amount", STRING, "", 0, -1), new Field("network_fee_amount", STRING, "", 0, -1), new Field("total_amount", STRING, "", 0, -1), new Field("payment_method", STRING, "", 0, -1), new Field("expires_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7a9abda9),
            new Spec(0x7a9abda9, "emojiGroup", new Field[] { new Field("title", STRING, "", 0, -1), new Field("icon_emoji_id", LONG, "", 0, -1), new Field("emoticons", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7ab58308),
            new Spec(0x7ab58308, "inputStarGiftAuctionSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7abe77ec),
            new Spec(0x7abe77ec, "ping", new Field[] { new Field("ping_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7adc669d),
            new Spec(0x7adc669d, "contacts.getContactIDs", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7b197dc8),
            new Spec(0x7b197dc8, "userStatusRecently", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("by_me", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x7b393160),
            new Spec(0x7b393160, "phone.inviteToGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("users", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7b560a0b),
            new Spec(0x7b560a0b, "starsTransactionPeerPlayMarket", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7b74ed71),
            new Spec(0x7b74ed71, "help.timezonesList", new Field[] { new Field("timezones", VECTOR, "Timezone", 0, -1), new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7b8def20),
            new Spec(0x7b8def20, "stories.exportStoryLink", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7b9e1801),
            new Spec(0x7b9e1801, "textCashtag", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7be2677e),
            new Spec(0x7be2677e, "onrampLimits", new Field[] { new Field("base_currency", STRING, "", 0, -1), new Field("base_min_amount", STRING, "", 0, -1), new Field("base_max_amount", STRING, "", 0, -1), new Field("crypto_min_amount", STRING, "", 0, -1), new Field("crypto_max_amount", STRING, "", 0, -1), new Field("payment_method", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7beafa85),
            new Spec(0x7beafa85, "communityPeerRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("visible", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("requested_by", LONG, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7bf6b15c),
            new Spec(0x7bf6b15c, "payments.paymentFormStars", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("form_id", LONG, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "WebDocument", 1, 5), new Field("invoice", OBJECT, "Invoice", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7bfbdefc),
            new Spec(0x7bfbdefc, "attachMenuPeerTypeBroadcast", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7c1079d6),
            new Spec(0x7c1079d6, "updateEphemeralBotCallbackQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("peer", OBJECT, "Peer", 1, 0), new Field("msg_id", INT, "", 0, -1), new Field("data", BYTES, "", 0, -1), new Field("chat_instance", LONG, "", 1, 1), new Field("message", OBJECT, "EphemeralMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7c2557c4),
            new Spec(0x7c2557c4, "stories.toggleAllStoriesHidden", new Field[] { new Field("hidden", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7c8fe7b6),
            new Spec(0x7c8fe7b6, "pageBlockVideo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("autoplay", TRUE, "", 1, 0), new Field("loop", TRUE, "", 1, 1), new Field("spoiler", TRUE, "", 1, 2), new Field("video_id", LONG, "", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7cb34d79),
            new Spec(0x7cb34d79, "updateBotChatInviteRequester", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("about", STRING, "", 0, -1), new Field("invite", OBJECT, "ExportedChatInvite", 0, -1), new Field("qts", INT, "", 0, -1), new Field("query_id", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x7cde641d),
            new Spec(0x7cde641d, "help.appConfigNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7d0444bb),
            new Spec(0x7d0444bb, "phone.createConferenceCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("muted", TRUE, "", 1, 0), new Field("video_stopped", TRUE, "", 1, 2), new Field("join", TRUE, "", 1, 3), new Field("random_id", INT, "", 0, -1), new Field("public_key", INT256, "", 1, 3), new Field("block", BYTES, "", 1, 3), new Field("params", OBJECT, "DataJSON", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x7d09c27e),
            new Spec(0x7d09c27e, "secureFile", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("size", LONG, "", 0, -1), new Field("dc_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("secret", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7d5bd1f0),
            new Spec(0x7d5bd1f0, "payments.starGiftAuctionAcquiredGifts", new Field[] { new Field("gifts", VECTOR, "StarGiftAuctionAcquiredGift", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7d6099dd),
            new Spec(0x7d6099dd, "securePlainPhone", new Field[] { new Field("phone", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7d627683),
            new Spec(0x7d627683, "updateSentStoryReaction", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("story_id", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7d6be90e),
            new Spec(0x7d6be90e, "attachMenuPeerTypeSameBotPM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7d748d04),
            new Spec(0x7d748d04, "dataJSON", new Field[] { new Field("data", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7d8375da),
            new Spec(0x7d8375da, "inputMediaUploadedPhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 2), new Field("live_photo", TRUE, "", 1, 3), new Field("file", OBJECT, "InputFile", 0, -1), new Field("stickers", VECTOR, "InputDocument", 1, 0), new Field("ttl_seconds", INT, "", 1, 1), new Field("video", OBJECT, "InputDocument", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x7d861a08),
            new Spec(0x7d861a08, "msg_resend_req", new Field[] { new Field("msg_ids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7da07ec9),
            new Spec(0x7da07ec9, "inputPeerSelf", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7dbf8673),
            new Spec(0x7dbf8673, "sponsoredMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("recommended", TRUE, "", 1, 5), new Field("can_report", TRUE, "", 1, 12), new Field("random_id", BYTES, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("photo", OBJECT, "Photo", 1, 6), new Field("media", OBJECT, "MessageMedia", 1, 14), new Field("color", OBJECT, "PeerColor", 1, 13), new Field("button_text", STRING, "", 0, -1), new Field("sponsor_info", STRING, "", 1, 7), new Field("additional_info", STRING, "", 1, 8), new Field("min_display_duration", INT, "", 1, 15), new Field("max_display_duration", INT, "", 1, 15) }));
        BY_ID.put(Integer.valueOf(0x7e1c1187),
            new Spec(0x7e1c1187, "messageActionStarGiftUnique", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("upgrade", TRUE, "", 1, 0), new Field("transferred", TRUE, "", 1, 1), new Field("saved", TRUE, "", 1, 2), new Field("refunded", TRUE, "", 1, 5), new Field("prepaid_upgrade", TRUE, "", 1, 11), new Field("assigned", TRUE, "", 1, 13), new Field("from_offer", TRUE, "", 1, 14), new Field("craft", TRUE, "", 1, 16), new Field("name_hidden", TRUE, "", 1, 17), new Field("gift", OBJECT, "StarGift", 0, -1), new Field("can_export_at", INT, "", 1, 3), new Field("transfer_stars", LONG, "", 1, 4), new Field("from_id", OBJECT, "Peer", 1, 6), new Field("peer", OBJECT, "Peer", 1, 7), new Field("saved_id", LONG, "", 1, 7), new Field("resale_amount", OBJECT, "StarsAmount", 1, 8), new Field("can_transfer_at", INT, "", 1, 9), new Field("can_resell_at", INT, "", 1, 10), new Field("drop_original_details_stars", LONG, "", 1, 12), new Field("can_craft_at", INT, "", 1, 15), new Field("message", OBJECT, "TextWithEntities", 1, 18) }));
        BY_ID.put(Integer.valueOf(0x7e58ee9c),
            new Spec(0x7e58ee9c, "messages.clearAllDrafts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7e6260d7),
            new Spec(0x7e6260d7, "textConcat", new Field[] { new Field("texts", VECTOR, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7e960193),
            new Spec(0x7e960193, "auth.resetLoginEmail", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7ed094a1),
            new Spec(0x7ed094a1, "messages.getOldFeaturedStickers", new Field[] { new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7ed23c57),
            new Spec(0x7ed23c57, "stories.getStoryViewsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("just_contacts", TRUE, "", 1, 0), new Field("reactions_first", TRUE, "", 1, 2), new Field("forwards_first", TRUE, "", 1, 3), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("q", STRING, "", 1, 1), new Field("id", INT, "", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7ed5348a),
            new Spec(0x7ed5348a, "payments.connectStarRefBot", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7ef0dd87),
            new Spec(0x7ef0dd87, "inputMessagesFilterUrl", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7f077ad9),
            new Spec(0x7f077ad9, "contacts.resolvedPeer", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f18176a),
            new Spec(0x7f18176a, "payments.transferStarGift", new Field[] { new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1), new Field("to_id", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f1d072f),
            new Spec(0x7f1d072f, "messages.rateTranscribedAudio", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("transcription_id", LONG, "", 0, -1), new Field("good", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f3b18ea),
            new Spec(0x7f3b18ea, "inputPeerEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x7f4b690a),
            new Spec(0x7f4b690a, "messages.readEncryptedHistory", new Field[] { new Field("peer", OBJECT, "InputEncryptedChat", 0, -1), new Field("max_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f5defa6),
            new Spec(0x7f5defa6, "messages.invitedUsers", new Field[] { new Field("updates", OBJECT, "Updates", 0, -1), new Field("missing_invitees", VECTOR, "MissingInvitee", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f648b67),
            new Spec(0x7f648b67, "searchResultPosition", new Field[] { new Field("msg_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("offset", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f6a1e22),
            new Spec(0x7f6a1e22, "channels.joinChannel", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7f891213),
            new Spec(0x7f891213, "updateWebPage", new Field[] { new Field("webpage", OBJECT, "WebPage", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7fcb13a8),
            new Spec(0x7fcb13a8, "messageActionChatEditPhoto", new Field[] { new Field("photo", OBJECT, "Photo", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7fd736b2),
            new Spec(0x7fd736b2, "stories.sendReaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("add_to_recent", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("story_id", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7fe7e815),
            new Spec(0x7fe7e815, "messages.hideChatJoinRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("approved", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x7fe91c14),
            new Spec(0x7fe91c14, "stats.messageStats", new Field[] { new Field("views_graph", OBJECT, "StatsGraph", 0, -1), new Field("reactions_by_emotion_graph", OBJECT, "StatsGraph", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x804361ea),
            new Spec(0x804361ea, "pageBlockAudio", new Field[] { new Field("audio_id", LONG, "", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x809ad9a6),
            new Spec(0x809ad9a6, "botInlineMessageMediaWebPage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invert_media", TRUE, "", 1, 3), new Field("force_large_media", TRUE, "", 1, 4), new Field("force_small_media", TRUE, "", 1, 5), new Field("manual", TRUE, "", 1, 7), new Field("safe", TRUE, "", 1, 8), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("url", STRING, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x809db6df),
            new Spec(0x809db6df, "msg_new_detailed_info", new Field[] { new Field("answer_msg_id", LONG, "", 0, -1), new Field("bytes", INT, "", 0, -1), new Field("status", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x80c99768),
            new Spec(0x80c99768, "inputMessagesFilterPhoneCalls", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("missed", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x80d26cc7),
            new Spec(0x80d26cc7, "emojiGroupGreeting", new Field[] { new Field("title", STRING, "", 0, -1), new Field("icon_emoji_id", LONG, "", 0, -1), new Field("emoticons", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x80e11a7f),
            new Spec(0x80e11a7f, "messageActionPhoneCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 2), new Field("call_id", LONG, "", 0, -1), new Field("reason", OBJECT, "PhoneCallDiscardReason", 1, 0), new Field("duration", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x80e851fd),
            new Spec(0x80e851fd, "payments.getOnrampLimits", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("base_currency", STRING, "", 0, -1), new Field("payment_method", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x80eb48af),
            new Spec(0x80eb48af, "groupCallStreamChannel", new Field[] { new Field("channel", INT, "", 0, -1), new Field("scale", INT, "", 0, -1), new Field("last_timestamp_ms", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x80ed747d),
            new Spec(0x80ed747d, "payments.assignAppStoreTransaction", new Field[] { new Field("receipt", BYTES, "", 0, -1), new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8107455c),
            new Spec(0x8107455c, "messages.toggleSuggestedPostApproval", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reject", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("schedule_date", INT, "", 1, 0), new Field("reject_comment", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x811ceab6),
            new Spec(0x811ceab6, "wallet.getTransactionsByIDs", new Field[] { new Field("id", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x811f854f),
            new Spec(0x811f854f, "account.sentEmailCode", new Field[] { new Field("email_pattern", STRING, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x81602d47),
            new Spec(0x81602d47, "autoSaveException", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("settings", OBJECT, "AutoSaveSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x81b6b00a),
            new Spec(0x81b6b00a, "messages.chatInviteImporters", new Field[] { new Field("count", INT, "", 0, -1), new Field("importers", VECTOR, "ChatInviteImporter", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x82006484),
            new Spec(0x82006484, "auth.sentCodeTypeMissedCall", new Field[] { new Field("prefix", STRING, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8216fba3),
            new Spec(0x8216fba3, "updateTheme", new Field[] { new Field("theme", OBJECT, "Theme", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8235057e),
            new Spec(0x8235057e, "messages.clickSponsoredMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("media", TRUE, "", 1, 0), new Field("fullscreen", TRUE, "", 1, 1), new Field("random_id", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x82574ae5),
            new Spec(0x82574ae5, "account.sendChangePhoneCode", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("settings", OBJECT, "CodeSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x826f8b60),
            new Spec(0x826f8b60, "messageEntityItalic", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x829d99da),
            new Spec(0x829d99da, "secureRequiredType", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("native_names", TRUE, "", 1, 0), new Field("selfie_required", TRUE, "", 1, 1), new Field("translation_required", TRUE, "", 1, 2), new Field("type", OBJECT, "SecureValueType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x82c9e290),
            new Spec(0x82c9e290, "messages.foundStickers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("next_offset", INT, "", 1, 0), new Field("hash", LONG, "", 0, -1), new Field("stickers", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x82d1f706),
            new Spec(0x82d1f706, "userProfilePhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_video", TRUE, "", 1, 0), new Field("personal", TRUE, "", 1, 2), new Field("photo_id", LONG, "", 0, -1), new Field("stripped_thumb", BYTES, "", 1, 1), new Field("dc_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x82f1e39f),
            new Spec(0x82f1e39f, "contacts.getSaved", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x830b9ae4),
            new Spec(0x830b9ae4, "notificationSoundLocal", new Field[] { new Field("title", STRING, "", 0, -1), new Field("data", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8317c0c3),
            new Spec(0x8317c0c3, "updateBotWebhookJSON", new Field[] { new Field("data", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x831a83a2),
            new Spec(0x831a83a2, "account.uploadRingtone", new Field[] { new Field("file", OBJECT, "InputFile", 0, -1), new Field("file_name", STRING, "", 0, -1), new Field("mime_type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x832175e0),
            new Spec(0x832175e0, "inputBusinessAwayMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("offline_only", TRUE, "", 1, 0), new Field("shortcut_id", INT, "", 0, -1), new Field("schedule", OBJECT, "BusinessAwayMessageSchedule", 0, -1), new Field("recipients", OBJECT, "InputBusinessRecipients", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x83268483),
            new Spec(0x83268483, "inputChatThemeEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x83281dbd),
            new Spec(0x83281dbd, "inputRichFileDocument", new Field[] { new Field("id", STRING, "", 0, -1), new Field("document", OBJECT, "InputDocument", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x833c0fac),
            new Spec(0x833c0fac, "inlineQueryPeerTypePM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8341ecc0),
            new Spec(0x8341ecc0, "channels.getLeftChannels", new Field[] { new Field("offset", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x83487af0),
            new Spec(0x83487af0, "updateChatUserTyping", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("from_id", OBJECT, "Peer", 0, -1), new Field("action", OBJECT, "SendMessageAction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x83c95aec),
            new Spec(0x83c95aec, "p_q_inner_data", new Field[] { new Field("pq", STRING, "", 0, -1), new Field("p", STRING, "", 0, -1), new Field("q", STRING, "", 0, -1), new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce", INT256, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x83d60fc2),
            new Spec(0x83d60fc2, "messageReplies", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("comments", TRUE, "", 1, 0), new Field("replies", INT, "", 0, -1), new Field("replies_pts", INT, "", 0, -1), new Field("recent_repliers", VECTOR, "Peer", 1, 1), new Field("channel_id", LONG, "", 1, 0), new Field("max_id", INT, "", 1, 2), new Field("read_max_id", INT, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x840649cf),
            new Spec(0x840649cf, "inputPrivacyValueAllowChatParticipants", new Field[] { new Field("chats", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x846f9e42),
            new Spec(0x846f9e42, "channels.sponsoredMessageReportResultChooseOption", new Field[] { new Field("title", STRING, "", 0, -1), new Field("options", VECTOR, "SponsoredMessageReportOption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8472478e),
            new Spec(0x8472478e, "chatlists.exportChatlistInvite", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1), new Field("title", STRING, "", 0, -1), new Field("peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84a02a0d),
            new Spec(0x84a02a0d, "messages.savedGifs", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("gifs", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84aa3a9c),
            new Spec(0x84aa3a9c, "payments.starGiftWithdrawalUrl", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84b88578),
            new Spec(0x84b88578, "messageActionPaidMessagesPrice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("broadcast_messages_allowed", TRUE, "", 1, 0), new Field("stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84be5b93),
            new Spec(0x84be5b93, "account.updateNotifySettings", new Field[] { new Field("peer", OBJECT, "InputNotifyPeer", 0, -1), new Field("settings", OBJECT, "InputPeerNotifySettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84c1fd4e),
            new Spec(0x84c1fd4e, "channels.deleteMessages", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84d19185),
            new Spec(0x84d19185, "messages.affectedMessages", new Field[] { new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x84f80814),
            new Spec(0x84f80814, "messages.getExtendedMedia", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8514bdda),
            new Spec(0x8514bdda, "contacts.toggleTopPeers", new Field[] { new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8525606f),
            new Spec(0x8525606f, "bots.editPreviewMedia", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("media", OBJECT, "InputMedia", 0, -1), new Field("new_media", OBJECT, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8535fbd9),
            new Spec(0x8535fbd9, "stories.reorderAlbums", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("order", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x857ebdb8),
            new Spec(0x857ebdb8, "messages.getPreparedInlineMessage", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x85c0f124),
            new Spec(0x85c0f124, "wallet.tonConnectPending", new Field[] { new Field("session", OBJECT, "TonConnectSession", 0, -1), new Field("requests", VECTOR, "TonConnectRequest", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x85dd99d1),
            new Spec(0x85dd99d1, "replyKeyboardMarkup", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("resize", TRUE, "", 1, 0), new Field("single_use", TRUE, "", 1, 1), new Field("selective", TRUE, "", 1, 2), new Field("persistent", TRUE, "", 1, 4), new Field("force_reply", TRUE, "", 1, 5), new Field("rows", VECTOR, "KeyboardButtonRow", 0, -1), new Field("placeholder", STRING, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x85e42301),
            new Spec(0x85e42301, "phoneCallDiscardReasonMissed", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x85f0a9cd),
            new Spec(0x85f0a9cd, "starGiftUnique", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("require_premium", TRUE, "", 1, 6), new Field("resale_ton_only", TRUE, "", 1, 7), new Field("theme_available", TRUE, "", 1, 9), new Field("burned", TRUE, "", 1, 14), new Field("crafted", TRUE, "", 1, 15), new Field("id", LONG, "", 0, -1), new Field("gift_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("num", INT, "", 0, -1), new Field("owner_id", OBJECT, "Peer", 1, 0), new Field("owner_name", STRING, "", 1, 1), new Field("owner_address", STRING, "", 1, 2), new Field("attributes", VECTOR, "StarGiftAttribute", 0, -1), new Field("availability_issued", INT, "", 0, -1), new Field("availability_total", INT, "", 0, -1), new Field("gift_address", STRING, "", 1, 3), new Field("resell_amount", VECTOR, "StarsAmount", 1, 4), new Field("released_by", OBJECT, "Peer", 1, 5), new Field("value_amount", LONG, "", 1, 8), new Field("value_currency", STRING, "", 1, 8), new Field("value_usd_amount", LONG, "", 1, 8), new Field("theme_peer", OBJECT, "Peer", 1, 10), new Field("peer_color", OBJECT, "PeerColor", 1, 11), new Field("host_id", OBJECT, "Peer", 1, 12), new Field("offer_min_stars", INT, "", 1, 13), new Field("craft_chance_permille", INT, "", 1, 16) }));
        BY_ID.put(Integer.valueOf(0x85fea03f),
            new Spec(0x85fea03f, "stickers.suggestedShortName", new Field[] { new Field("short_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x861cc8a0),
            new Spec(0x861cc8a0, "inputStickerSetShortName", new Field[] { new Field("short_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x86471d92),
            new Spec(0x86471d92, "securePasswordKdfAlgoSHA512", new Field[] { new Field("salt", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x864b2581),
            new Spec(0x864b2581, "messages.setChatAvailableReactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("available_reactions", OBJECT, "ChatReactions", 0, -1), new Field("reactions_limit", INT, "", 1, 0), new Field("paid_enabled", BOOL, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x8653febe),
            new Spec(0x8653febe, "stickers.addStickerToSet", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("sticker", OBJECT, "InputStickerSetItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x86872538),
            new Spec(0x86872538, "inputMessagePinned", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x868a2aa5),
            new Spec(0x868a2aa5, "secureValueErrorReverseSide", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x869d758f),
            new Spec(0x869d758f, "secureValueError", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("hash", BYTES, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x86a0765d),
            new Spec(0x86a0765d, "account.deleteWebBrowserSettingsExceptions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x86b40b08),
            new Spec(0x86b40b08, "replyKeyboardForceReply", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("single_use", TRUE, "", 1, 1), new Field("selective", TRUE, "", 1, 2), new Field("placeholder", STRING, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x86f8613c),
            new Spec(0x86f8613c, "premium.boostsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("boosts", VECTOR, "Boost", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x86fccf85),
            new Spec(0x86fccf85, "updateMoveStickerSetToTop", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("masks", TRUE, "", 1, 0), new Field("emojis", TRUE, "", 1, 1), new Field("stickerset", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8704f2bf),
            new Spec(0x8704f2bf, "ephemeral.reportMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("option", BYTES, "", 0, -1), new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x871fb939),
            new Spec(0x871fb939, "updateGeoLiveViewed", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8763d3e1),
            new Spec(0x8763d3e1, "chatParticipantsForbidden", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("chat_id", LONG, "", 0, -1), new Field("self_participant", OBJECT, "ChatParticipant", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x87704394),
            new Spec(0x87704394, "stickers.deleteStickerSet", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x879537f1),
            new Spec(0x879537f1, "contacts.resetSaved", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x87cf7f2f),
            new Spec(0x87cf7f2f, "photos.deletePhotos", new Field[] { new Field("id", VECTOR, "InputPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x87d0759e),
            new Spec(0x87d0759e, "help.countriesList", new Field[] { new Field("countries", VECTOR, "help.Country", 0, -1), new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x87e2f155),
            new Spec(0x87e2f155, "messageActionGiveawayResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("stars", TRUE, "", 1, 0), new Field("winners_count", INT, "", 0, -1), new Field("unclaimed_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x87e5dfe4),
            new Spec(0x87e5dfe4, "inputChatThemeUniqueGift", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x881fb94b),
            new Spec(0x881fb94b, "messages.emojiGroups", new Field[] { new Field("hash", INT, "", 0, -1), new Field("groups", VECTOR, "EmojiGroup", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x883a4108),
            new Spec(0x883a4108, "inputMediaPoll", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("poll", OBJECT, "Poll", 0, -1), new Field("correct_answers", VECTOR, "INT", 1, 0), new Field("attached_media", OBJECT, "InputMedia", 1, 3), new Field("solution", STRING, "", 1, 1), new Field("solution_entities", VECTOR, "MessageEntity", 1, 1), new Field("solution_media", OBJECT, "InputMedia", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8851e68e),
            new Spec(0x8851e68e, "account.createBusinessChatLink", new Field[] { new Field("link", OBJECT, "InputBusinessChatLink", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x889b59ef),
            new Spec(0x889b59ef, "messages.savedReactionTagsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x88bf9319),
            new Spec(0x88bf9319, "inputBotInlineResult", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", STRING, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("title", STRING, "", 1, 1), new Field("description", STRING, "", 1, 2), new Field("url", STRING, "", 1, 3), new Field("thumb", OBJECT, "InputWebDocument", 1, 4), new Field("content", OBJECT, "InputWebDocument", 1, 5), new Field("send_message", OBJECT, "InputBotInlineMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x88d37c56),
            new Spec(0x88d37c56, "messages.recentStickers", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("packs", VECTOR, "StickerPack", 0, -1), new Field("stickers", VECTOR, "Document", 0, -1), new Field("dates", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x88f27fbc),
            new Spec(0x88f27fbc, "sendMessageRecordRoundAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x88f8f21b),
            new Spec(0x88f8f21b, "paymentFormMethod", new Field[] { new Field("url", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x890c3d89),
            new Spec(0x890c3d89, "inputBotInlineMessageID", new Field[] { new Field("dc_id", INT, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x89137c0d),
            new Spec(0x89137c0d, "secureValueTypeBankStatement", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8935fc73),
            new Spec(0x8935fc73, "reactionCustomEmoji", new Field[] { new Field("document_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x89419521),
            new Spec(0x89419521, "chatlists.getChatlistUpdates", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x894cc99c),
            new Spec(0x894cc99c, "messages.requestUrlAuth", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 1, 1), new Field("msg_id", INT, "", 1, 1), new Field("button_id", INT, "", 1, 1), new Field("url", STRING, "", 1, 2), new Field("in_app_origin", STRING, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x8951abef),
            new Spec(0x8951abef, "updateNewAuthorization", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unconfirmed", TRUE, "", 1, 0), new Field("hash", LONG, "", 0, -1), new Field("date", INT, "", 1, 0), new Field("device", STRING, "", 1, 0), new Field("location", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x8953ad37),
            new Spec(0x8953ad37, "inputChatPhoto", new Field[] { new Field("id", OBJECT, "InputPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8999602d),
            new Spec(0x8999602d, "messages.clearRecentStickers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("attached", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x899fe31d),
            new Spec(0x899fe31d, "account.saveSecureValue", new Field[] { new Field("value", OBJECT, "InputSecureValue", 0, -1), new Field("secure_secret_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x89fdd778),
            new Spec(0x89fdd778, "inputMediaStory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8a2932f3),
            new Spec(0x8a2932f3, "payments.starGiftCollections", new Field[] { new Field("collections", VECTOR, "StarGiftCollection", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8a480e27),
            new Spec(0x8a480e27, "postInteractionCountersStory", new Field[] { new Field("story_id", INT, "", 0, -1), new Field("views", INT, "", 0, -1), new Field("forwards", INT, "", 0, -1), new Field("reactions", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8a53b014),
            new Spec(0x8a53b014, "messageMediaToDo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("todo", OBJECT, "TodoList", 0, -1), new Field("completions", VECTOR, "TodoCompletion", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x8a86659c),
            new Spec(0x8a86659c, "botInlineMessageMediaVenue", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("title", STRING, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("venue_id", STRING, "", 0, -1), new Field("venue_type", STRING, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8ac32801),
            new Spec(0x8ac32801, "inputPaymentCredentialsGooglePay", new Field[] { new Field("payment_token", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8ae5c97a),
            new Spec(0x8ae5c97a, "updateBotBusinessConnect", new Field[] { new Field("connection", OBJECT, "BotBusinessConnection", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8aeabec3),
            new Spec(0x8aeabec3, "secureData", new Field[] { new Field("data", BYTES, "", 0, -1), new Field("data_hash", BYTES, "", 0, -1), new Field("secret", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8af09dd2),
            new Spec(0x8af09dd2, "messages.foundStickerSets", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("sets", VECTOR, "StickerSetCovered", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8af94344),
            new Spec(0x8af94344, "contacts.resolvePhone", new Field[] { new Field("phone", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8b716587),
            new Spec(0x8b716587, "messages.reorderPinnedSavedDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force", TRUE, "", 1, 0), new Field("order", VECTOR, "InputDialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8b725fce),
            new Spec(0x8b725fce, "updatePaidReactionPrivacy", new Field[] { new Field("private", OBJECT, "PaidReactionPrivacy", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8b73e763),
            new Spec(0x8b73e763, "privacyValueDisallowAll", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8b883488),
            new Spec(0x8b883488, "secureValueTypeRentalAgreement", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8b9b4dae),
            new Spec(0x8b9b4dae, "account.getContentSettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8ba403e4),
            new Spec(0x8ba403e4, "requestedPeerChannel", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel_id", LONG, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("username", STRING, "", 1, 1), new Field("photo", OBJECT, "Photo", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8bba90e6),
            new Spec(0x8bba90e6, "messages.getMessagesReactions", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c05f1c9),
            new Spec(0x8c05f1c9, "help.supportName", new Field[] { new Field("name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c0f91fb),
            new Spec(0x8c0f91fb, "updateAiComposeTones", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8c10603f),
            new Spec(0x8c10603f, "inputGroupCallInviteMessage", new Field[] { new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c12f3a4),
            new Spec(0x8c12f3a4, "wallet.getNfts", new Field[] { new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c3410af),
            new Spec(0x8c3410af, "account.editBusinessChatLink", new Field[] { new Field("slug", STRING, "", 0, -1), new Field("link", OBJECT, "InputBusinessChatLink", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c4bfe5d),
            new Spec(0x8c4bfe5d, "messages.getOutboxReadDate", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
    }

    private static void init7() {
        BY_ID.put(Integer.valueOf(0x8c5006f8),
            new Spec(0x8c5006f8, "messages.markDialogUnread", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unread", TRUE, "", 1, 0), new Field("parent_peer", OBJECT, "InputPeer", 1, 1), new Field("peer", OBJECT, "InputDialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c5adfd9),
            new Spec(0x8c5adfd9, "chatInviteImporter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("requested", TRUE, "", 1, 0), new Field("via_chatlist", TRUE, "", 1, 3), new Field("user_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("about", STRING, "", 1, 2), new Field("approved_by", LONG, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x8c79b63c),
            new Spec(0x8c79b63c, "messagePeerReaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("big", TRUE, "", 1, 0), new Field("unread", TRUE, "", 1, 1), new Field("my", TRUE, "", 1, 2), new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c7f65e2),
            new Spec(0x8c7f65e2, "botInlineMessageText", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 0), new Field("invert_media", TRUE, "", 1, 3), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8c8219a8),
            new Spec(0x8c8219a8, "communities.togglePeerLinkRequestApproval", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reject", TRUE, "", 1, 0), new Field("community", OBJECT, "InputChannel", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c88c923),
            new Spec(0x8c88c923, "updateChannelUserTyping", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel_id", LONG, "", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("from_id", OBJECT, "Peer", 0, -1), new Field("action", OBJECT, "SendMessageAction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c92b098),
            new Spec(0x8c92b098, "businessWorkHours", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("open_now", TRUE, "", 1, 0), new Field("timezone_id", STRING, "", 0, -1), new Field("weekly_open", VECTOR, "BusinessWeeklyOpen", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8c9a88ac),
            new Spec(0x8c9a88ac, "messages.webPagePreview", new Field[] { new Field("media", OBJECT, "MessageMedia", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8ca60525),
            new Spec(0x8ca60525, "phone.deleteConferenceCallParticipants", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("only_left", TRUE, "", 1, 0), new Field("kick", TRUE, "", 1, 1), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("ids", VECTOR, "LONG", 0, -1), new Field("block", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8caa9a96),
            new Spec(0x8caa9a96, "updateBotPrecheckoutQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("payload", BYTES, "", 0, -1), new Field("info", OBJECT, "PaymentRequestedInfo", 1, 0), new Field("shipping_option_id", STRING, "", 1, 1), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8cc0d131),
            new Spec(0x8cc0d131, "msgs_all_info", new Field[] { new Field("msg_ids", VECTOR, "LONG", 0, -1), new Field("info", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8d3456d0),
            new Spec(0x8d3456d0, "stories.deleteAlbum", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("album_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8d52a951),
            new Spec(0x8d52a951, "auth.signIn", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("phone_code", STRING, "", 1, 0), new Field("email_verification", OBJECT, "EmailVerification", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x8d595cd6),
            new Spec(0x8d595cd6, "storyViews", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_viewers", TRUE, "", 1, 1), new Field("views_count", INT, "", 0, -1), new Field("forwards_count", INT, "", 1, 2), new Field("reactions", VECTOR, "ReactionCount", 1, 3), new Field("reactions_count", INT, "", 1, 4), new Field("recent_viewers", VECTOR, "LONG", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x8d78512a),
            new Spec(0x8d78512a, "communities.participantJoinedChats", new Field[] { new Field("creator_chat_ids", VECTOR, "LONG", 0, -1), new Field("joined_chat_ids", VECTOR, "LONG", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8d7ae6af),
            new Spec(0x8d7ae6af, "messages.composeRichMessageWithAI", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("proofread", TRUE, "", 1, 0), new Field("emojify", TRUE, "", 1, 3), new Field("text", OBJECT, "InputRichMessage", 1, 4), new Field("translate_to_lang", STRING, "", 1, 1), new Field("tone", OBJECT, "InputAiComposeTone", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8d7bdd61),
            new Spec(0x8d7bdd61, "toncenter.performApiRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("post", TRUE, "", 1, 0), new Field("endpoint", STRING, "", 0, -1), new Field("query", STRING, "", 1, 1), new Field("payload", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8d9692a3),
            new Spec(0x8d9692a3, "messages.getWebPage", new Field[] { new Field("url", STRING, "", 0, -1), new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8db33c4b),
            new Spec(0x8db33c4b, "reportResultReported", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8dca6aa5),
            new Spec(0x8dca6aa5, "photos.photos", new Field[] { new Field("photos", VECTOR, "Photo", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8e1a1775),
            new Spec(0x8e1a1775, "nearestDc", new Field[] { new Field("country", STRING, "", 0, -1), new Field("this_dc", INT, "", 0, -1), new Field("nearest_dc", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8e39261e),
            new Spec(0x8e39261e, "auth.requestFirebaseSms", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("safety_net_token", STRING, "", 1, 0), new Field("play_integrity_token", STRING, "", 1, 2), new Field("ios_push_secret", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x8e3ca7ee),
            new Spec(0x8e3ca7ee, "secureValueTypeEmail", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x8e48a188),
            new Spec(0x8e48a188, "auth.dropTempAuthKeys", new Field[] { new Field("except_auth_keys", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8e51b4c1),
            new Spec(0x8e51b4c1, "payments.checkGiftCode", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8e5e9873),
            new Spec(0x8e5e9873, "updateDcOptions", new Field[] { new Field("dc_options", VECTOR, "DcOption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8ea464b6),
            new Spec(0x8ea464b6, "statsGraph", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("json", OBJECT, "DataJSON", 0, -1), new Field("zoom_token", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x8ecf0511),
            new Spec(0x8ecf0511, "messages.botPreparedInlineMessage", new Field[] { new Field("id", STRING, "", 0, -1), new Field("expire_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8ef3eab0),
            new Spec(0x8ef3eab0, "account.initTakeoutSession", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("contacts", TRUE, "", 1, 0), new Field("message_users", TRUE, "", 1, 1), new Field("message_chats", TRUE, "", 1, 2), new Field("message_megagroups", TRUE, "", 1, 3), new Field("message_channels", TRUE, "", 1, 4), new Field("files", TRUE, "", 1, 5), new Field("file_max_size", LONG, "", 1, 5) }));
        BY_ID.put(Integer.valueOf(0x8ef8ecc0),
            new Spec(0x8ef8ecc0, "messages.setGameScore", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("edit_message", TRUE, "", 1, 0), new Field("force", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("score", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8f079643),
            new Spec(0x8f079643, "channelAdminLogEventActionStopPoll", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8f34b2f5),
            new Spec(0x8f34b2f5, "botBusinessConnection", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("disabled", TRUE, "", 1, 1), new Field("connection_id", STRING, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("dc_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("rights", OBJECT, "BusinessBotRights", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x8f9e6898),
            new Spec(0x8f9e6898, "stories.sendStory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 2), new Field("noforwards", TRUE, "", 1, 4), new Field("fwd_modified", TRUE, "", 1, 7), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("media", OBJECT, "InputMedia", 0, -1), new Field("media_areas", VECTOR, "MediaArea", 1, 5), new Field("caption", STRING, "", 1, 0), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("privacy_rules", VECTOR, "InputPrivacyRule", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("period", INT, "", 1, 3), new Field("fwd_from_id", OBJECT, "InputPeer", 1, 6), new Field("fwd_from_story", INT, "", 1, 6), new Field("albums", VECTOR, "INT", 1, 8), new Field("music", OBJECT, "InputDocument", 1, 9) }));
        BY_ID.put(Integer.valueOf(0x8fb53057),
            new Spec(0x8fb53057, "phone.joinGroupCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("muted", TRUE, "", 1, 0), new Field("video_stopped", TRUE, "", 1, 2), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("join_as", OBJECT, "InputPeer", 0, -1), new Field("invite_hash", STRING, "", 1, 1), new Field("public_key", INT256, "", 1, 3), new Field("block", BYTES, "", 1, 3), new Field("params", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8fb86b41),
            new Spec(0x8fb86b41, "payments.sendStarGiftOffer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("price", OBJECT, "StarsAmount", 0, -1), new Field("duration", INT, "", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("allow_paid_stars", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x8fd4c4d8),
            new Spec(0x8fd4c4d8, "document", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("mime_type", STRING, "", 0, -1), new Field("size", LONG, "", 0, -1), new Field("thumbs", VECTOR, "PhotoSize", 1, 0), new Field("video_thumbs", VECTOR, "VideoSize", 1, 1), new Field("dc_id", INT, "", 0, -1), new Field("attributes", VECTOR, "DocumentAttribute", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8fde504f),
            new Spec(0x8fde504f, "inputThemeSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("message_colors_animated", TRUE, "", 1, 2), new Field("base_theme", OBJECT, "BaseTheme", 0, -1), new Field("accent_color", INT, "", 0, -1), new Field("outbox_accent_color", INT, "", 1, 3), new Field("message_colors", VECTOR, "INT", 1, 0), new Field("wallpaper", OBJECT, "InputWallPaper", 1, 1), new Field("wallpaper_settings", OBJECT, "WallPaperSettings", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x8fdf1920),
            new Spec(0x8fdf1920, "account.confirmPasswordEmail", new Field[] { new Field("code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8ff2d5f0),
            new Spec(0x8ff2d5f0, "pageListOrderedItemBlocks", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("checkbox", TRUE, "", 1, 0), new Field("checked", TRUE, "", 1, 1), new Field("num", STRING, "", 1, 2), new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("value", INT, "", 1, 3), new Field("type", STRING, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x8ffa9a1f),
            new Spec(0x8ffa9a1f, "pageBlockSubtitle", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x8ffacae1),
            new Spec(0x8ffacae1, "messages.setChatWallPaper", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("for_both", TRUE, "", 1, 3), new Field("revert", TRUE, "", 1, 4), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("wallpaper", OBJECT, "InputWallPaper", 1, 0), new Field("settings", OBJECT, "WallPaperSettings", 1, 2), new Field("id", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x90110467),
            new Spec(0x90110467, "inputPrivacyValueDisallowUsers", new Field[] { new Field("users", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9015e101),
            new Spec(0x9015e101, "updateShortSentMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("out", TRUE, "", 1, 1), new Field("id", INT, "", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("media", OBJECT, "MessageMedia", 1, 9), new Field("entities", VECTOR, "MessageEntity", 1, 7), new Field("ttl_period", INT, "", 1, 25) }));
        BY_ID.put(Integer.valueOf(0x9021ab67),
            new Spec(0x9021ab67, "stickers.createStickerSet", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("masks", TRUE, "", 1, 0), new Field("emojis", TRUE, "", 1, 5), new Field("text_color", TRUE, "", 1, 6), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("title", STRING, "", 0, -1), new Field("short_name", STRING, "", 0, -1), new Field("thumb", OBJECT, "InputDocument", 1, 2), new Field("stickers", VECTOR, "InputStickerSetItem", 0, -1), new Field("software", STRING, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x903bcf59),
            new Spec(0x903bcf59, "aicompose.updateTone", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("tone", OBJECT, "InputAiComposeTone", 0, -1), new Field("display_author", BOOL, "", 1, 0), new Field("emoji_id", LONG, "", 1, 1), new Field("title", STRING, "", 1, 2), new Field("prompt", STRING, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x904ac7c7),
            new Spec(0x904ac7c7, "messageEntityFormattedDate", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("relative", TRUE, "", 1, 0), new Field("short_time", TRUE, "", 1, 1), new Field("long_time", TRUE, "", 1, 2), new Field("short_date", TRUE, "", 1, 3), new Field("long_date", TRUE, "", 1, 4), new Field("day_of_week", TRUE, "", 1, 5), new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x904dd49c),
            new Spec(0x904dd49c, "updateBotChatBoost", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("boost", OBJECT, "Boost", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9077c9ac),
            new Spec(0x9077c9ac, "wallet.exportSecretPhrase", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("password", OBJECT, "InputCheckPasswordSRP", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x9083670b),
            new Spec(0x9083670b, "storyViewPublicForward", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("blocked", TRUE, "", 1, 0), new Field("blocked_my_stories_from", TRUE, "", 1, 1), new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x908c0407),
            new Spec(0x908c0407, "inputBotAppShortName", new Field[] { new Field("bot_id", OBJECT, "InputUser", 0, -1), new Field("short_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x909c3f94),
            new Spec(0x909c3f94, "paymentRequestedInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("name", STRING, "", 1, 0), new Field("phone", STRING, "", 1, 1), new Field("email", STRING, "", 1, 2), new Field("shipping_address", OBJECT, "PostAddress", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x90a6ca84),
            new Spec(0x90a6ca84, "messageEmpty", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", INT, "", 0, -1), new Field("peer_id", OBJECT, "Peer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x90c467d1),
            new Spec(0x90c467d1, "account.emojiStatuses", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("statuses", VECTOR, "EmojiStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x90c894b5),
            new Spec(0x90c894b5, "users.setSecureValueErrors", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1), new Field("errors", VECTOR, "SecureValueError", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x90d7adfa),
            new Spec(0x90d7adfa, "messages.composedMessageWithAI", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("result_text", OBJECT, "TextWithEntities", 0, -1), new Field("diff_text", OBJECT, "TextWithEntities", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x91006707),
            new Spec(0x91006707, "channels.createChannel", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("broadcast", TRUE, "", 1, 0), new Field("megagroup", TRUE, "", 1, 1), new Field("for_import", TRUE, "", 1, 3), new Field("forum", TRUE, "", 1, 5), new Field("title", STRING, "", 0, -1), new Field("about", STRING, "", 0, -1), new Field("geo_point", OBJECT, "InputGeoPoint", 1, 2), new Field("address", STRING, "", 1, 2), new Field("ttl_period", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0x9156982a),
            new Spec(0x9156982a, "upload.getFileHashes", new Field[] { new Field("location", OBJECT, "InputFileLocation", 0, -1), new Field("offset", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x915860ae),
            new Spec(0x915860ae, "account.getDefaultGroupPhotoEmojis", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x91cd32a8),
            new Spec(0x91cd32a8, "photos.getUserPhotos", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("offset", INT, "", 0, -1), new Field("max_id", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x91dc3f31),
            new Spec(0x91dc3f31, "upload.getCdnFileHashes", new Field[] { new Field("file_token", BYTES, "", 0, -1), new Field("offset", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x922e55a9),
            new Spec(0x922e55a9, "emailVerificationCode", new Field[] { new Field("code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x922e6e10),
            new Spec(0x922e6e10, "updateReadChannelInbox", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("folder_id", INT, "", 1, 0), new Field("channel_id", LONG, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("still_unread_count", INT, "", 0, -1), new Field("pts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x925ec9ea),
            new Spec(0x925ec9ea, "bots.setBotGroupDefaultAdminRights", new Field[] { new Field("admin_rights", OBJECT, "ChatAdminRights", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x928e7b55),
            new Spec(0x928e7b55, "wallet.userAddresses", new Field[] { new Field("addresses", VECTOR, "WalletUserAddress", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9299359f),
            new Spec(0x9299359f, "http_wait", new Field[] { new Field("max_delay", INT, "", 0, -1), new Field("wait_after", INT, "", 0, -1), new Field("max_wait", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x92a72876),
            new Spec(0x92a72876, "messageActionGameScore", new Field[] { new Field("game_id", LONG, "", 0, -1), new Field("score", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x92b4494c),
            new Spec(0x92b4494c, "messages.searchEmojiStickerSets", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exclude_featured", TRUE, "", 1, 0), new Field("q", STRING, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x92ceddd4),
            new Spec(0x92ceddd4, "messages.createChat", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("users", VECTOR, "InputUser", 0, -1), new Field("title", STRING, "", 0, -1), new Field("ttl_period", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x92f6e797),
            new Spec(0x92f6e797, "ephemeral.deleteMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 1, 0), new Field("receiver_id", OBJECT, "InputUser", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x93037e20),
            new Spec(0x93037e20, "stats.publicForwards", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("forwards", VECTOR, "PublicForward", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9308ce1b),
            new Spec(0x9308ce1b, "account.resetPassword", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9325705a),
            new Spec(0x9325705a, "storyAlbum", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("album_id", INT, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("icon_photo", OBJECT, "Photo", 1, 0), new Field("icon_video", OBJECT, "Document", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x9329ea33),
            new Spec(0x9329ea33, "messageActionGramTransfer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("comment_encrypted", TRUE, "", 1, 1), new Field("amount", LONG, "", 0, -1), new Field("peer_address", STRING, "", 0, -1), new Field("transaction_id", STRING, "", 0, -1), new Field("comment", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x933ca597),
            new Spec(0x933ca597, "webDomainException", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("domain", STRING, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("favicon", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x9342ca07),
            new Spec(0x9342ca07, "messages.getBotCallbackAnswer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("game", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("data", BYTES, "", 1, 0), new Field("password", OBJECT, "InputCheckPasswordSRP", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x9375341e),
            new Spec(0x9375341e, "updateSavedGifs", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x93773344),
            new Spec(0x93773344, "communities.getPeerLinkRequests", new Field[] { new Field("community", OBJECT, "InputChannel", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x93773ff5),
            new Spec(0x93773ff5, "inlineButtonTypeSwitchInline", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("same_peer", TRUE, "", 1, 0), new Field("query", STRING, "", 0, -1), new Field("peer_types", VECTOR, "InlineQueryPeerType", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x93b31848),
            new Spec(0x93b31848, "messageActionRequestedPeerSentMe", new Field[] { new Field("button_id", INT, "", 0, -1), new Field("peers", VECTOR, "RequestedPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x93bd878d),
            new Spec(0x93bd878d, "chatlists.chatlistUpdates", new Field[] { new Field("missing_peers", VECTOR, "Peer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x93bf667f),
            new Spec(0x93bf667f, "attachMenuBotsBot", new Field[] { new Field("bot", OBJECT, "AttachMenuBot", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x93c3e27e),
            new Spec(0x93c3e27e, "availableEffect", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("premium_required", TRUE, "", 1, 2), new Field("id", LONG, "", 0, -1), new Field("emoticon", STRING, "", 0, -1), new Field("static_icon_id", LONG, "", 1, 0), new Field("effect_sticker_id", LONG, "", 0, -1), new Field("effect_animation_id", LONG, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x93cc1f32),
            new Spec(0x93cc1f32, "help.countriesListNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x947a12df),
            new Spec(0x947a12df, "payments.resaleStarGifts", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("gifts", VECTOR, "StarGift", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("attributes", VECTOR, "StarGiftAttribute", 1, 1), new Field("attributes_hash", LONG, "", 1, 1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("counters", VECTOR, "StarGiftAttributeCounter", 1, 2), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9493ff32),
            new Spec(0x9493ff32, "messages.sentEncryptedFile", new Field[] { new Field("date", INT, "", 0, -1), new Field("file", OBJECT, "EncryptedFile", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x94a495c3),
            new Spec(0x94a495c3, "messages.getQuickReplyMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("shortcut_id", INT, "", 0, -1), new Field("id", VECTOR, "INT", 1, 0), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x94bd38ed),
            new Spec(0x94bd38ed, "messageActionPinMessage", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x94c65c76),
            new Spec(0x94c65c76, "contacts.setBlocked", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("my_stories_from", TRUE, "", 1, 0), new Field("id", VECTOR, "InputPeer", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x94ce852a),
            new Spec(0x94ce852a, "starsGiveawayOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("extended", TRUE, "", 1, 0), new Field("default", TRUE, "", 1, 1), new Field("stars", LONG, "", 0, -1), new Field("yearly_boosts", INT, "", 0, -1), new Field("store_product", STRING, "", 1, 2), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("winners", VECTOR, "StarsGiveawayWinnersOption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x94d42ee7),
            new Spec(0x94d42ee7, "channelMessagesFilterEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x952dc143),
            new Spec(0x952dc143, "walletTransaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("incoming", TRUE, "", 1, 0), new Field("gasless", TRUE, "", 1, 1), new Field("failed", TRUE, "", 1, 2), new Field("key_change", TRUE, "", 1, 5), new Field("comment_encrypted", TRUE, "", 1, 6), new Field("id", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("fee", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("peer", OBJECT, "WalletTransactionPeer", 0, -1), new Field("comment", STRING, "", 1, 3), new Field("tx_hash", STRING, "", 1, 4), new Field("nft", OBJECT, "wallet.NftItem", 1, 7) }));
        BY_ID.put(Integer.valueOf(0x957b50fb),
            new Spec(0x957b50fb, "account.password", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_recovery", TRUE, "", 1, 0), new Field("has_secure_values", TRUE, "", 1, 1), new Field("has_password", TRUE, "", 1, 2), new Field("current_algo", OBJECT, "PasswordKdfAlgo", 1, 2), new Field("srp_B", BYTES, "", 1, 2), new Field("srp_id", LONG, "", 1, 2), new Field("hint", STRING, "", 1, 3), new Field("email_unconfirmed_pattern", STRING, "", 1, 4), new Field("new_algo", OBJECT, "PasswordKdfAlgo", 0, -1), new Field("new_secure_algo", OBJECT, "SecurePasswordKdfAlgo", 0, -1), new Field("secure_random", BYTES, "", 0, -1), new Field("pending_reset_date", INT, "", 1, 5), new Field("login_email_pattern", STRING, "", 1, 6) }));
        BY_ID.put(Integer.valueOf(0x95ac5ce4),
            new Spec(0x95ac5ce4, "auth.importLoginToken", new Field[] { new Field("token", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x95c5346b),
            new Spec(0x95c5346b, "walletState", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("backup_enabled", TRUE, "", 1, 0), new Field("can_export_phrase", TRUE, "", 1, 1), new Field("can_enable_backup", TRUE, "", 1, 2), new Field("address", STRING, "", 0, -1), new Field("public_key", BYTES, "", 0, -1), new Field("balance", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x95d2ac92),
            new Spec(0x95d2ac92, "messageActionChannelCreate", new Field[] { new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x95ddcf69),
            new Spec(0x95ddcf69, "messageActionSuggestedPostSuccess", new Field[] { new Field("price", OBJECT, "StarsAmount", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x95e3fbef),
            new Spec(0x95e3fbef, "messageActionChatDeletePhoto", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x95f2bfe4),
            new Spec(0x95f2bfe4, "starsTransactionPeerUnsupported", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x95f389b1),
            new Spec(0x95f389b1, "payments.savedStarGifts", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("chat_notifications_enabled", BOOL, "", 1, 1), new Field("gifts", VECTOR, "SavedStarGift", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x95fcd1d6),
            new Spec(0x95fcd1d6, "botApp", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("short_name", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "Photo", 0, -1), new Field("document", OBJECT, "Document", 1, 0), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9609a51c),
            new Spec(0x9609a51c, "inputMessagesFilterPhotos", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x96151fed),
            new Spec(0x96151fed, "privacyKeyProfilePhoto", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x96537bd7),
            new Spec(0x96537bd7, "dialogFilterChatlist", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_my_invites", TRUE, "", 1, 26), new Field("title_noanimate", TRUE, "", 1, 28), new Field("id", INT, "", 0, -1), new Field("title", OBJECT, "TextWithEntities", 0, -1), new Field("emoticon", STRING, "", 1, 25), new Field("color", INT, "", 1, 27), new Field("pinned_peers", VECTOR, "InputPeer", 0, -1), new Field("include_peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9664f57f),
            new Spec(0x9664f57f, "inputMediaEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x966e2dbf),
            new Spec(0x966e2dbf, "poll", new Field[] { new Field("id", LONG, "", 0, -1), new Field("flags", FLAGWORD, "", 0, -1), new Field("closed", TRUE, "", 1, 0), new Field("public_voters", TRUE, "", 1, 1), new Field("multiple_choice", TRUE, "", 1, 2), new Field("quiz", TRUE, "", 1, 3), new Field("open_answers", TRUE, "", 1, 6), new Field("revoting_disabled", TRUE, "", 1, 7), new Field("shuffle_answers", TRUE, "", 1, 8), new Field("hide_results_until_close", TRUE, "", 1, 9), new Field("creator", TRUE, "", 1, 10), new Field("subscribers_only", TRUE, "", 1, 11), new Field("question", OBJECT, "TextWithEntities", 0, -1), new Field("answers", VECTOR, "PollAnswer", 0, -1), new Field("close_period", INT, "", 1, 4), new Field("close_date", INT, "", 1, 5), new Field("countries_iso2", VECTOR, "STRING", 1, 12), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x967a462e),
            new Spec(0x967a462e, "inputWallPaperNoFile", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9686cb50),
            new Spec(0x9686cb50, "textDiff", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("old_text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x96929a85),
            new Spec(0x96929a85, "inputBotInlineMessageMediaGeo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("heading", INT, "", 1, 0), new Field("period", INT, "", 1, 1), new Field("proximity_notification_radius", INT, "", 1, 3), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x96d074fd),
            new Spec(0x96d074fd, "emailVerificationApple", new Field[] { new Field("token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x96e6cd81),
            new Spec(0x96e6cd81, "channels.editBanned", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1), new Field("banned_rights", OBJECT, "ChatBannedRights", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x970708cc),
            new Spec(0x970708cc, "help.timezonesListNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9709b1c2),
            new Spec(0x9709b1c2, "bots.reorderUsernames", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("order", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x971fa843),
            new Spec(0x971fa843, "inputMediaGeoLive", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("stopped", TRUE, "", 1, 0), new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("heading", INT, "", 1, 2), new Field("period", INT, "", 1, 1), new Field("proximity_notification_radius", INT, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x972dabbf),
            new Spec(0x972dabbf, "starGiftAuctionStateFinished", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("start_date", INT, "", 0, -1), new Field("end_date", INT, "", 0, -1), new Field("average_price", LONG, "", 0, -1), new Field("listed_count", INT, "", 1, 0), new Field("fragment_listed_count", INT, "", 1, 1), new Field("fragment_listed_url", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x973478b6),
            new Spec(0x973478b6, "contacts.getTopPeers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("correspondents", TRUE, "", 1, 0), new Field("bots_pm", TRUE, "", 1, 1), new Field("bots_inline", TRUE, "", 1, 2), new Field("phone_calls", TRUE, "", 1, 3), new Field("forward_users", TRUE, "", 1, 4), new Field("forward_chats", TRUE, "", 1, 5), new Field("groups", TRUE, "", 1, 10), new Field("channels", TRUE, "", 1, 15), new Field("bots_app", TRUE, "", 1, 16), new Field("bots_guestchat", TRUE, "", 1, 17), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9738bb15),
            new Spec(0x9738bb15, "channels.toggleViewForumAsMessages", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x974392f2),
            new Spec(0x974392f2, "phone.toggleGroupCallSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reset_invite_hash", TRUE, "", 1, 1), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("join_muted", BOOL, "", 1, 0), new Field("messages_enabled", BOOL, "", 1, 2), new Field("send_paid_messages_stars", LONG, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x97e8bebe),
            new Spec(0x97e8bebe, "notificationSoundDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9801d2f7),
            new Spec(0x9801d2f7, "documentAttributeHasStickers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x981b91dd),
            new Spec(0x981b91dd, "payments.getStarGiftCollections", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9852d6d2),
            new Spec(0x9852d6d2, "botCommand", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("ephemeral", TRUE, "", 1, 0), new Field("command", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9852f9c6),
            new Spec(0x9852f9c6, "documentAttributeAudio", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("voice", TRUE, "", 1, 10), new Field("duration", INT, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("performer", STRING, "", 1, 1), new Field("waveform", BYTES, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x9857ad07),
            new Spec(0x9857ad07, "auth.finishPasskeyLogin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("credential", OBJECT, "InputPasskeyCredential", 0, -1), new Field("from_dc_id", INT, "", 1, 0), new Field("from_auth_key_id", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x985d3abb),
            new Spec(0x985d3abb, "updateChannelParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_chatlist", TRUE, "", 1, 3), new Field("channel_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("actor_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("prev_participant", OBJECT, "ChannelParticipant", 1, 0), new Field("new_participant", OBJECT, "ChannelParticipant", 1, 1), new Field("invite", OBJECT, "ExportedChatInvite", 1, 2), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x98613ebf),
            new Spec(0x98613ebf, "passkey", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", STRING, "", 0, -1), new Field("name", STRING, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("software_emoji_id", LONG, "", 1, 0), new Field("last_usage_date", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x98657f0d),
            new Spec(0x98657f0d, "page", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("part", TRUE, "", 1, 0), new Field("rtl", TRUE, "", 1, 1), new Field("v2", TRUE, "", 1, 2), new Field("url", STRING, "", 0, -1), new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("photos", VECTOR, "Photo", 0, -1), new Field("documents", VECTOR, "Document", 0, -1), new Field("views", INT, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0x9880f658),
            new Spec(0x9880f658, "inputCheckPasswordEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x98986c0d),
            new Spec(0x98986c0d, "inputInvoicePremiumGiftCode", new Field[] { new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1), new Field("option", OBJECT, "PremiumGiftCodeOption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9898ad73),
            new Spec(0x9898ad73, "smsjobs.leave", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x98a3a840),
            new Spec(0x98a3a840, "joinChatBotResultQueued", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x98d5ea1d),
            new Spec(0x98d5ea1d, "payments.connectedStarRefBots", new Field[] { new Field("count", INT, "", 0, -1), new Field("connected_bots", VECTOR, "ConnectedBotStarRef", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x98e037bb),
            new Spec(0x98e037bb, "account.sendVerifyEmailCode", new Field[] { new Field("purpose", OBJECT, "EmailVerifyPurpose", 0, -1), new Field("email", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x98e0d697),
            new Spec(0x98e0d697, "messageActionGeoProximityReached", new Field[] { new Field("from_id", OBJECT, "Peer", 0, -1), new Field("to_id", OBJECT, "Peer", 0, -1), new Field("distance", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x98f6ac75),
            new Spec(0x98f6ac75, "help.promoDataEmpty", new Field[] { new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9961bcb4),
            new Spec(0x9961bcb4, "inputInlineButtonTypeUrlAuth", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("request_write_access", TRUE, "", 1, 0), new Field("fwd_text", STRING, "", 1, 1), new Field("url", STRING, "", 0, -1), new Field("bot", OBJECT, "InputUser", 1, 2) }));
        BY_ID.put(Integer.valueOf(0x99622c0c),
            new Spec(0x99622c0c, "peerNotifySettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("show_previews", BOOL, "", 1, 0), new Field("silent", BOOL, "", 1, 1), new Field("mute_until", INT, "", 1, 2), new Field("ios_sound", OBJECT, "NotificationSound", 1, 3), new Field("android_sound", OBJECT, "NotificationSound", 1, 4), new Field("other_sound", OBJECT, "NotificationSound", 1, 5), new Field("stories_muted", BOOL, "", 1, 6), new Field("stories_hide_sender", BOOL, "", 1, 7), new Field("stories_ios_sound", OBJECT, "NotificationSound", 1, 8), new Field("stories_android_sound", OBJECT, "NotificationSound", 1, 9), new Field("stories_other_sound", OBJECT, "NotificationSound", 1, 10) }));
        BY_ID.put(Integer.valueOf(0x9967ad0f),
            new Spec(0x9967ad0f, "communities.toggleParticipantBanned", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unban", TRUE, "", 1, 0), new Field("community", OBJECT, "InputChannel", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x997275b5),
            new Spec(0x997275b5, "boolTrue", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x998ab009),
            new Spec(0x998ab009, "messages.getSavedHistory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("parent_peer", OBJECT, "InputPeer", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_date", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x998d6636),
            new Spec(0x998d6636, "account.savedMusicIds", new Field[] { new Field("ids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x99a48f23),
            new Spec(0x99a48f23, "secureValueTypeInternalPassport", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x99c1d49d),
            new Spec(0x99c1d49d, "jsonObject", new Field[] { new Field("value", VECTOR, "JSONObjectValue", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x99e3806a),
            new Spec(0x99e3806a, "secureValueTypePassportRegistration", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x99e41707),
            new Spec(0x99e41707, "wallet.proofChallenge", new Field[] { new Field("payload", STRING, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("domain", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x99ea331d),
            new Spec(0x99ea331d, "starGiftUpgradePrice", new Field[] { new Field("date", INT, "", 0, -1), new Field("upgrade_stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a0b48b8),
            new Spec(0x9a0b48b8, "inputInvoiceStarGiftPrepaidUpgrade", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a23af21),
            new Spec(0x9a23af21, "account.resolvedBusinessChatLinks", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a35e999),
            new Spec(0x9a35e999, "peerStories", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("max_read_id", INT, "", 1, 0), new Field("stories", VECTOR, "StoryItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a3bfd99),
            new Spec(0x9a3bfd99, "messages.highScores", new Field[] { new Field("scores", VECTOR, "HighScore", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a3d8c6d),
            new Spec(0x9a3d8c6d, "account.themes", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("themes", VECTOR, "Theme", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a422c20),
            new Spec(0x9a422c20, "updateRecentStickers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9a5c33e5),
            new Spec(0x9a5c33e5, "account.passwordSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("email", STRING, "", 1, 0), new Field("secure_settings", OBJECT, "SecureSecretSettings", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x9a75a1ef),
            new Spec(0x9a75a1ef, "stories.togglePinned", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1), new Field("pinned", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a868f80),
            new Spec(0x9a868f80, "contacts.getBlocked", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("my_stories_from", TRUE, "", 1, 0), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9a98ad68),
            new Spec(0x9a98ad68, "channels.editAdmin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("admin_rights", OBJECT, "ChatAdminRights", 0, -1), new Field("rank", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x9a9d77e0),
            new Spec(0x9a9d77e0, "prepaidStarsGiveaway", new Field[] { new Field("id", LONG, "", 0, -1), new Field("stars", LONG, "", 0, -1), new Field("quantity", INT, "", 0, -1), new Field("boosts", INT, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9ab0feaf),
            new Spec(0x9ab0feaf, "channels.channelParticipants", new Field[] { new Field("count", INT, "", 0, -1), new Field("participants", VECTOR, "ChannelParticipant", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9adf82fe),
            new Spec(0x9adf82fe, "account.updateWebBrowserSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("open_external_browser", TRUE, "", 1, 0), new Field("display_close_button", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x9ae228e2),
            new Spec(0x9ae228e2, "premium.myBoosts", new Field[] { new Field("my_boosts", VECTOR, "MyBoost", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9ae91519),
            new Spec(0x9ae91519, "channels.restrictSponsoredMessages", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("restricted", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9b00622b),
            new Spec(0x9b00622b, "inputRichFilePhoto", new Field[] { new Field("id", STRING, "", 0, -1), new Field("photo", OBJECT, "InputPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9b2754a8),
            new Spec(0x9b2754a8, "upload.reuploadCdnFile", new Field[] { new Field("file_token", BYTES, "", 0, -1), new Field("request_token", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9b5ae7f9),
            new Spec(0x9b5ae7f9, "stories.getAllReadPeerStories", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9b69e34b),
            new Spec(0x9b69e34b, "messageEntityPhone", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9b89f93a),
            new Spec(0x9b89f93a, "inputReportReasonCopyright", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9b9240a6),
            new Spec(0x9b9240a6, "updateBotWebhookJSONQuery", new Field[] { new Field("query_id", LONG, "", 0, -1), new Field("data", OBJECT, "DataJSON", 0, -1), new Field("timeout", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9baa9647),
            new Spec(0x9baa9647, "channels.deleteHistory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("for_everyone", TRUE, "", 1, 0), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("max_id", INT, "", 0, -1) }));
    }

    private static void init8() {
        BY_ID.put(Integer.valueOf(0x9bad6414),
            new Spec(0x9bad6414, "aiComposeToneDefault", new Field[] { new Field("tone", STRING, "", 0, -1), new Field("emoji_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9bed434d),
            new Spec(0x9bed434d, "inputWebDocument", new Field[] { new Field("url", STRING, "", 0, -1), new Field("size", INT, "", 0, -1), new Field("mime_type", STRING, "", 0, -1), new Field("attributes", VECTOR, "DocumentAttribute", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9beee140),
            new Spec(0x9beee140, "buttonTypeRequestGeoLocation", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9bf8bb95),
            new Spec(0x9bf8bb95, "textStrike", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9c4e7e8b),
            new Spec(0x9c4e7e8b, "messageEntityUnderline", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9c60eb28),
            new Spec(0x9c60eb28, "bots.getBotMenuButton", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9c7f2f10),
            new Spec(0x9c7f2f10, "messages.getSearchResultsPositions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 2), new Field("filter", OBJECT, "MessagesFilter", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9c9abcb1),
            new Spec(0x9c9abcb1, "payments.getStarGiftUpgradePreview", new Field[] { new Field("gift_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9cb9b2ec),
            new Spec(0x9cb9b2ec, "walletStateEmpty", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creating", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x9cc123c7),
            new Spec(0x9cc123c7, "phoneConnection", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("tcp", TRUE, "", 1, 0), new Field("id", LONG, "", 0, -1), new Field("ip", STRING, "", 0, -1), new Field("ipv6", STRING, "", 0, -1), new Field("port", INT, "", 0, -1), new Field("peer_tag", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9cd4eaf9),
            new Spec(0x9cd4eaf9, "account.getPasswordSettings", new Field[] { new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9cd81144),
            new Spec(0x9cd81144, "messages.chatsSlice", new Field[] { new Field("count", INT, "", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9cdf08cd),
            new Spec(0x9cdf08cd, "help.getSupport", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9d04af9b),
            new Spec(0x9d04af9b, "statsGroupTopPoster", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("messages", INT, "", 0, -1), new Field("avg_chars", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9d1dbd26),
            new Spec(0x9d1dbd26, "phone.groupCallStars", new Field[] { new Field("total_stars", LONG, "", 0, -1), new Field("top_donors", VECTOR, "GroupCallDonor", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9d2216e0),
            new Spec(0x9d2216e0, "updateGroupCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("live_story", TRUE, "", 1, 2), new Field("peer", OBJECT, "Peer", 1, 1), new Field("call", OBJECT, "GroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9d2a81e3),
            new Spec(0x9d2a81e3, "secureValueTypePersonalDetails", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9d2eac97),
            new Spec(0x9d2eac97, "textMath", new Field[] { new Field("source", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9d6b13b0),
            new Spec(0x9d6b13b0, "starGiftCollection", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collection_id", INT, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("icon", OBJECT, "Document", 1, 0), new Field("gifts_count", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9d84f3db),
            new Spec(0x9d84f3db, "inputStickerSetThumb", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("thumb_version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9da1cd6c),
            new Spec(0x9da1cd6c, "messageActionPollAppendAnswer", new Field[] { new Field("answer", OBJECT, "PollAnswer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9da9403b),
            new Spec(0x9da9403b, "messages.getRecentStickers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("attached", TRUE, "", 1, 0), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9ddb347c),
            new Spec(0x9ddb347c, "updateBotNewBusinessMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("connection_id", STRING, "", 0, -1), new Field("message", OBJECT, "Message", 0, -1), new Field("reply_to_message", OBJECT, "Message", 1, 0), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9de7a269),
            new Spec(0x9de7a269, "inputStickerSetID", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9dfeefb4),
            new Spec(0x9dfeefb4, "messages.clearRecentReactions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9e6b131a),
            new Spec(0x9e6b131a, "account.updateBusinessLocation", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo_point", OBJECT, "InputGeoPoint", 1, 1), new Field("address", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0x9e727aad),
            new Spec(0x9e727aad, "phone.groupCall", new Field[] { new Field("call", OBJECT, "GroupCall", 0, -1), new Field("participants", VECTOR, "GroupCallParticipant", 0, -1), new Field("participants_next_offset", STRING, "", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9e84bc99),
            new Spec(0x9e84bc99, "updateReadHistoryInbox", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("folder_id", INT, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_msg_id", INT, "", 1, 1), new Field("max_id", INT, "", 0, -1), new Field("still_unread_count", INT, "", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9e8fa6d3),
            new Spec(0x9e8fa6d3, "messages.favedStickersNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9eb51445),
            new Spec(0x9eb51445, "messages.setDefaultHistoryTTL", new Field[] { new Field("period", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9ec20908),
            new Spec(0x9ec20908, "new_session_created", new Field[] { new Field("first_msg_id", LONG, "", 0, -1), new Field("unique_id", LONG, "", 0, -1), new Field("server_salt", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9ec44f93),
            new Spec(0x9ec44f93, "messages.readReactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 1) }));
        BY_ID.put(Integer.valueOf(0x9ec7863d),
            new Spec(0x9ec7863d, "inputReportReasonPersonalDetails", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9ec8c6a8),
            new Spec(0x9ec8c6a8, "onrampMethodAvailability", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("available", TRUE, "", 1, 0), new Field("payment_method", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9eddf188),
            new Spec(0x9eddf188, "inputMessagesFilterDocument", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9f071957),
            new Spec(0x9f071957, "messages.availableReactionsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9f07c728),
            new Spec(0x9f07c728, "account.getContactSignUpNotification", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9f120418),
            new Spec(0x9f120418, "chatBannedRights", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("view_messages", TRUE, "", 1, 0), new Field("send_messages", TRUE, "", 1, 1), new Field("send_media", TRUE, "", 1, 2), new Field("send_stickers", TRUE, "", 1, 3), new Field("send_gifs", TRUE, "", 1, 4), new Field("send_games", TRUE, "", 1, 5), new Field("send_inline", TRUE, "", 1, 6), new Field("embed_links", TRUE, "", 1, 7), new Field("send_polls", TRUE, "", 1, 8), new Field("change_info", TRUE, "", 1, 10), new Field("invite_users", TRUE, "", 1, 15), new Field("pin_messages", TRUE, "", 1, 17), new Field("manage_topics", TRUE, "", 1, 18), new Field("send_photos", TRUE, "", 1, 19), new Field("send_videos", TRUE, "", 1, 20), new Field("send_roundvideos", TRUE, "", 1, 21), new Field("send_audios", TRUE, "", 1, 22), new Field("send_voices", TRUE, "", 1, 23), new Field("send_docs", TRUE, "", 1, 24), new Field("send_plain", TRUE, "", 1, 25), new Field("edit_rank", TRUE, "", 1, 26), new Field("send_reactions", TRUE, "", 1, 27), new Field("manage_linked_peers", TRUE, "", 1, 28), new Field("until_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9f2221c9),
            new Spec(0x9f2221c9, "inputWebFileGeoPointLocation", new Field[] { new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("zoom", INT, "", 0, -1), new Field("scale", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9f2504e4),
            new Spec(0x9f2504e4, "starGiftAttributeBackdrop", new Field[] { new Field("name", STRING, "", 0, -1), new Field("backdrop_id", INT, "", 0, -1), new Field("center_color", INT, "", 0, -1), new Field("edge_color", INT, "", 0, -1), new Field("pattern_color", INT, "", 0, -1), new Field("text_color", INT, "", 0, -1), new Field("rarity", OBJECT, "StarGiftAttributeRarity", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9f27d26e),
            new Spec(0x9f27d26e, "profileTabMusic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9f812b08),
            new Spec(0x9f812b08, "updateMonoForumNoPaidException", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exception", TRUE, "", 1, 0), new Field("channel_id", LONG, "", 0, -1), new Field("saved_peer_id", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9f84f49e),
            new Spec(0x9f84f49e, "messageMediaUnsupported", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9fab0d1a),
            new Spec(0x9fab0d1a, "auth.resetAuthorizations", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9fbab604),
            new Spec(0x9fbab604, "messageActionHistoryClear", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9fbbf1f7),
            new Spec(0x9fbbf1f7, "phoneCallDiscardReasonMigrateConferenceCall", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9fc00e65),
            new Spec(0x9fc00e65, "inputMessagesFilterVideo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0x9fc55fde),
            new Spec(0x9fc55fde, "inputMediaTodo", new Field[] { new Field("todo", OBJECT, "TodoList", 0, -1) }));
        BY_ID.put(Integer.valueOf(0x9fd40bd8),
            new Spec(0x9fd40bd8, "notifyPeer", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa0058751),
            new Spec(0xa0058751, "payments.paymentForm", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_save_credentials", TRUE, "", 1, 2), new Field("password_missing", TRUE, "", 1, 3), new Field("form_id", LONG, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "WebDocument", 1, 5), new Field("invoice", OBJECT, "Invoice", 0, -1), new Field("provider_id", LONG, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("native_provider", STRING, "", 1, 4), new Field("native_params", OBJECT, "DataJSON", 1, 4), new Field("additional_methods", VECTOR, "PaymentFormMethod", 1, 6), new Field("saved_info", OBJECT, "PaymentRequestedInfo", 1, 0), new Field("saved_credentials", VECTOR, "PaymentSavedCredentials", 1, 1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa00e67d6),
            new Spec(0xa00e67d6, "theme", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("default", TRUE, "", 1, 1), new Field("for_chat", TRUE, "", 1, 5), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("document", OBJECT, "Document", 1, 2), new Field("settings", VECTOR, "ThemeSettings", 1, 3), new Field("emoticon", STRING, "", 1, 6), new Field("installs_count", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xa00f32b0),
            new Spec(0xa00f32b0, "messages.editChatParticipantRank", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1), new Field("rank", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa02a982e),
            new Spec(0xa02a982e, "updateBotDeleteBusinessMessage", new Field[] { new Field("connection_id", STRING, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("messages", VECTOR, "INT", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa03e5b85),
            new Spec(0xa03e5b85, "replyKeyboardHide", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("selective", TRUE, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xa04e8d3a),
            new Spec(0xa04e8d3a, "channelFull", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_view_participants", TRUE, "", 1, 3), new Field("can_set_username", TRUE, "", 1, 6), new Field("can_set_stickers", TRUE, "", 1, 7), new Field("hidden_prehistory", TRUE, "", 1, 10), new Field("can_set_location", TRUE, "", 1, 16), new Field("has_scheduled", TRUE, "", 1, 19), new Field("can_view_stats", TRUE, "", 1, 20), new Field("blocked", TRUE, "", 1, 22), new Field("flags2", FLAGWORD, "", 0, -1), new Field("can_delete_channel", TRUE, "", 2, 0), new Field("antispam", TRUE, "", 2, 1), new Field("participants_hidden", TRUE, "", 2, 2), new Field("translations_disabled", TRUE, "", 2, 3), new Field("stories_pinned_available", TRUE, "", 2, 5), new Field("view_forum_as_messages", TRUE, "", 2, 6), new Field("restricted_sponsored", TRUE, "", 2, 11), new Field("can_view_revenue", TRUE, "", 2, 12), new Field("paid_media_allowed", TRUE, "", 2, 14), new Field("can_view_stars_revenue", TRUE, "", 2, 15), new Field("paid_reactions_available", TRUE, "", 2, 16), new Field("stargifts_available", TRUE, "", 2, 19), new Field("paid_messages_available", TRUE, "", 2, 20), new Field("has_welcome_messages", TRUE, "", 2, 24), new Field("id", LONG, "", 0, -1), new Field("about", STRING, "", 0, -1), new Field("participants_count", INT, "", 1, 0), new Field("admins_count", INT, "", 1, 1), new Field("kicked_count", INT, "", 1, 2), new Field("banned_count", INT, "", 1, 2), new Field("online_count", INT, "", 1, 13), new Field("read_inbox_max_id", INT, "", 0, -1), new Field("read_outbox_max_id", INT, "", 0, -1), new Field("unread_count", INT, "", 0, -1), new Field("chat_photo", OBJECT, "Photo", 0, -1), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1), new Field("exported_invite", OBJECT, "ExportedChatInvite", 1, 23), new Field("bot_info", VECTOR, "BotInfo", 0, -1), new Field("migrated_from_chat_id", LONG, "", 1, 4), new Field("migrated_from_max_id", INT, "", 1, 4), new Field("pinned_msg_id", INT, "", 1, 5), new Field("stickerset", OBJECT, "StickerSet", 1, 8), new Field("available_min_id", INT, "", 1, 9), new Field("folder_id", INT, "", 1, 11), new Field("linked_chat_id", LONG, "", 1, 14), new Field("location", OBJECT, "ChannelLocation", 1, 15), new Field("slowmode_seconds", INT, "", 1, 17), new Field("slowmode_next_send_date", INT, "", 1, 18), new Field("stats_dc", INT, "", 1, 12), new Field("pts", INT, "", 0, -1), new Field("call", OBJECT, "InputGroupCall", 1, 21), new Field("ttl_period", INT, "", 1, 24), new Field("pending_suggestions", VECTOR, "STRING", 1, 25), new Field("groupcall_default_join_as", OBJECT, "Peer", 1, 26), new Field("theme_emoticon", STRING, "", 1, 27), new Field("requests_pending", INT, "", 1, 28), new Field("recent_requesters", VECTOR, "LONG", 1, 28), new Field("default_send_as", OBJECT, "Peer", 1, 29), new Field("available_reactions", OBJECT, "ChatReactions", 1, 30), new Field("reactions_limit", INT, "", 2, 13), new Field("stories", OBJECT, "PeerStories", 2, 4), new Field("wallpaper", OBJECT, "WallPaper", 2, 7), new Field("boosts_applied", INT, "", 2, 8), new Field("boosts_unrestrict", INT, "", 2, 9), new Field("emojiset", OBJECT, "StickerSet", 2, 10), new Field("bot_verification", OBJECT, "BotVerification", 2, 17), new Field("stargifts_count", INT, "", 2, 18), new Field("send_paid_messages_stars", LONG, "", 2, 21), new Field("main_tab", OBJECT, "ProfileTab", 2, 22), new Field("guard_bot_id", LONG, "", 2, 23) }));
        BY_ID.put(Integer.valueOf(0xa0624cf7),
            new Spec(0xa0624cf7, "businessBotRights", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reply", TRUE, "", 1, 0), new Field("read_messages", TRUE, "", 1, 1), new Field("delete_sent_messages", TRUE, "", 1, 2), new Field("delete_received_messages", TRUE, "", 1, 3), new Field("edit_name", TRUE, "", 1, 4), new Field("edit_bio", TRUE, "", 1, 5), new Field("edit_profile_photo", TRUE, "", 1, 6), new Field("edit_username", TRUE, "", 1, 7), new Field("view_gifts", TRUE, "", 1, 8), new Field("sell_gifts", TRUE, "", 1, 9), new Field("change_gift_settings", TRUE, "", 1, 10), new Field("transfer_and_upgrade_gifts", TRUE, "", 1, 11), new Field("transfer_stars", TRUE, "", 1, 12), new Field("manage_stories", TRUE, "", 1, 13) }));
        BY_ID.put(Integer.valueOf(0xa098d6af),
            new Spec(0xa098d6af, "help.passportConfig", new Field[] { new Field("hash", INT, "", 0, -1), new Field("countries_langs", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa0ab6cc6),
            new Spec(0xa0ab6cc6, "channels.getParticipant", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa0b80cf8),
            new Spec(0xa0b80cf8, "messages.deleteParticipantReactions", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa0ba4f17),
            new Spec(0xa0ba4f17, "payments.starGiftCollectionsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa0d0744b),
            new Spec(0xa0d0744b, "secureValueTypeIdentityCard", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa0f4cb4f),
            new Spec(0xa0f4cb4f, "messages.getDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exclude_pinned", TRUE, "", 1, 0), new Field("folder_id", INT, "", 1, 1), new Field("offset_date", INT, "", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("offset_peer", OBJECT, "InputPeer", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa1144770),
            new Spec(0xa1144770, "secureValueErrorTranslationFile", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa12aefff),
            new Spec(0xa12aefff, "botVerifierSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_modify_custom_description", TRUE, "", 1, 1), new Field("icon", LONG, "", 0, -1), new Field("company", STRING, "", 0, -1), new Field("custom_description", OBJECT, "TextWithEntities", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa1405817),
            new Spec(0xa1405817, "messages.sendScreenshotNotification", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 0, -1), new Field("random_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa15f8513),
            new Spec(0xa15f8513, "tonConnectRequest", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("session_id", LONG, "", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("body", BYTES, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("topic", STRING, "", 1, 0), new Field("trace_id", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xa187d66f),
            new Spec(0xa187d66f, "sendMessageRecordVideoAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa1974d72),
            new Spec(0xa1974d72, "payments.getUniqueStarGift", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa1b70815),
            new Spec(0xa1b70815, "bots.getBotRecommendations", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa20db0e5),
            new Spec(0xa20db0e5, "updateDeleteMessages", new Field[] { new Field("messages", VECTOR, "INT", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa2185cab),
            new Spec(0xa2185cab, "messages.deleteChatUser", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoke_history", TRUE, "", 1, 0), new Field("chat_id", LONG, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa2197cf6),
            new Spec(0xa2197cf6, "payments.createOnrampSession", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("payment_method", STRING, "", 1, 0), new Field("base_currency", STRING, "", 1, 1), new Field("base_amount", STRING, "", 1, 2), new Field("memo", STRING, "", 1, 3), new Field("theme", STRING, "", 1, 4), new Field("success_return_url", STRING, "", 1, 5), new Field("fail_return_url", STRING, "", 1, 6), new Field("crypto_amount", STRING, "", 1, 7) }));
        BY_ID.put(Integer.valueOf(0xa229dd06),
            new Spec(0xa229dd06, "updateConfig", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa22cbd96),
            new Spec(0xa22cbd96, "chatInviteExported", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoked", TRUE, "", 1, 0), new Field("permanent", TRUE, "", 1, 5), new Field("request_needed", TRUE, "", 1, 6), new Field("link", STRING, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("start_date", INT, "", 1, 4), new Field("expire_date", INT, "", 1, 1), new Field("usage_limit", INT, "", 1, 2), new Field("usage", INT, "", 1, 3), new Field("requested", INT, "", 1, 7), new Field("subscription_expired", INT, "", 1, 10), new Field("title", STRING, "", 1, 8), new Field("subscription_pricing", OBJECT, "StarsSubscriptionPricing", 1, 9) }));
        BY_ID.put(Integer.valueOf(0xa24de717),
            new Spec(0xa24de717, "messages.checkedHistoryImportPeer", new Field[] { new Field("confirm_text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa26156c0),
            new Spec(0xa26156c0, "textCustomEmoji", new Field[] { new Field("document_id", LONG, "", 0, -1), new Field("alt", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa26a7fa5),
            new Spec(0xa26a7fa5, "account.updateBusinessAwayMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("message", OBJECT, "InputBusinessAwayMessage", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa2875319),
            new Spec(0xa2875319, "messages.migrateChat", new Field[] { new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa29cd42c),
            new Spec(0xa29cd42c, "messages.getSuggestedDialogFilters", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa2a5371e),
            new Spec(0xa2a5371e, "peerChannel", new Field[] { new Field("channel_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa2a5594d),
            new Spec(0xa2a5594d, "bots.getPreviewMedias", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa2b5a3f6),
            new Spec(0xa2b5a3f6, "messages.getExportedChatInvites", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoked", TRUE, "", 1, 3), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("admin_id", OBJECT, "InputUser", 0, -1), new Field("offset_date", INT, "", 1, 2), new Field("offset_link", STRING, "", 1, 2), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa2c0cf74),
            new Spec(0xa2c0cf74, "account.deleteAccount", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reason", STRING, "", 0, -1), new Field("password", OBJECT, "InputCheckPasswordSRP", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa2c0f695),
            new Spec(0xa2c0f695, "profileTabGifs", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa2e214a4),
            new Spec(0xa2e214a4, "inputCollectiblePhone", new Field[] { new Field("phone", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa319e569),
            new Spec(0xa319e569, "payments.getSavedStarGifts", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exclude_unsaved", TRUE, "", 1, 0), new Field("exclude_saved", TRUE, "", 1, 1), new Field("exclude_unlimited", TRUE, "", 1, 2), new Field("exclude_unique", TRUE, "", 1, 4), new Field("sort_by_value", TRUE, "", 1, 5), new Field("exclude_upgradable", TRUE, "", 1, 7), new Field("exclude_unupgradable", TRUE, "", 1, 8), new Field("peer_color_available", TRUE, "", 1, 9), new Field("exclude_hosted", TRUE, "", 1, 10), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("collection_id", INT, "", 1, 6), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa36396e5),
            new Spec(0xa36396e5, "stories.createAlbum", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("title", STRING, "", 0, -1), new Field("stories", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa384b779),
            new Spec(0xa384b779, "receivedNotifyMessage", new Field[] { new Field("id", INT, "", 0, -1), new Field("flags", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa388a368),
            new Spec(0xa388a368, "payments.starGiftsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa3b54985),
            new Spec(0xa3b54985, "channelParticipantsKicked", new Field[] { new Field("q", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa3d1cb80),
            new Spec(0xa3d1cb80, "reactionCount", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("chosen_order", INT, "", 1, 0), new Field("reaction", OBJECT, "Reaction", 0, -1), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa416ac81),
            new Spec(0xa416ac81, "auth.sentCodeTypeSmsWord", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("beginning", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa423bb51),
            new Spec(0xa423bb51, "messages.editInlineBotMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 1), new Field("invert_media", TRUE, "", 1, 16), new Field("id", OBJECT, "InputBotInlineMessageID", 0, -1), new Field("message", STRING, "", 1, 11), new Field("media", OBJECT, "InputMedia", 1, 14), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("entities", VECTOR, "MessageEntity", 1, 3), new Field("rich_message", OBJECT, "InputRichMessage", 1, 23) }));
        BY_ID.put(Integer.valueOf(0xa437c3ed),
            new Spec(0xa437c3ed, "wallPaper", new Field[] { new Field("id", LONG, "", 0, -1), new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("default", TRUE, "", 1, 1), new Field("pattern", TRUE, "", 1, 3), new Field("dark", TRUE, "", 1, 4), new Field("access_hash", LONG, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("document", OBJECT, "Document", 0, -1), new Field("settings", OBJECT, "WallPaperSettings", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xa438619d),
            new Spec(0xa438619d, "inlineButtonTypeDisabled", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa43ad8b7),
            new Spec(0xa43ad8b7, "rpc_answer_dropped", new Field[] { new Field("msg_id", LONG, "", 0, -1), new Field("seq_no", INT, "", 0, -1), new Field("bytes", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa43f30cc),
            new Spec(0xa43f30cc, "messageActionChatDeleteUser", new Field[] { new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa44f3ef6),
            new Spec(0xa44f3ef6, "pageBlockMap", new Field[] { new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("zoom", INT, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa455de90),
            new Spec(0xa455de90, "messages.exportChatInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("legacy_revoke_permanent", TRUE, "", 1, 2), new Field("request_needed", TRUE, "", 1, 3), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("expire_date", INT, "", 1, 0), new Field("usage_limit", INT, "", 1, 1), new Field("title", STRING, "", 1, 4), new Field("subscription_pricing", OBJECT, "StarsSubscriptionPricing", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xa477288f),
            new Spec(0xa477288f, "updateGroupCallChainBlocks", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("sub_chain_id", INT, "", 0, -1), new Field("blocks", VECTOR, "BYTES", 0, -1), new Field("next_offset", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa486b761),
            new Spec(0xa486b761, "privacyKeyAbout", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa4a79376),
            new Spec(0xa4a79376, "updateReadMonoForumOutbox", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("saved_peer_id", OBJECT, "Peer", 0, -1), new Field("read_max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa4bcc6fe),
            new Spec(0xa4bcc6fe, "updates.channelDifferenceTooLong", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("final", TRUE, "", 1, 0), new Field("timeout", INT, "", 1, 1), new Field("dialog", OBJECT, "Dialog", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa4dd4c08),
            new Spec(0xa4dd4c08, "inputPrivacyKeyForwards", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa5273abf),
            new Spec(0xa5273abf, "phone.editGroupCallParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1), new Field("muted", BOOL, "", 1, 0), new Field("volume", INT, "", 1, 1), new Field("raise_hand", BOOL, "", 1, 2), new Field("video_stopped", BOOL, "", 1, 3), new Field("video_paused", BOOL, "", 1, 4), new Field("presentation_paused", BOOL, "", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xa5491dea),
            new Spec(0xa5491dea, "auth.sentCodeTypeSetUpEmailRequired", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("apple_signin_allowed", TRUE, "", 1, 0), new Field("google_signin_allowed", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xa556dac8),
            new Spec(0xa556dac8, "stories.readStories", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa56a8b60),
            new Spec(0xa56a8b60, "stories.getChatsToSend", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa56c2a3e),
            new Spec(0xa56c2a3e, "updates.state", new Field[] { new Field("pts", INT, "", 0, -1), new Field("qts", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("seq", INT, "", 0, -1), new Field("unread_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa575739d),
            new Spec(0xa575739d, "emojiURL", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa57a7dad),
            new Spec(0xa57a7dad, "auth.importAuthorization", new Field[] { new Field("id", LONG, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa584b019),
            new Spec(0xa584b019, "updateStarsRevenueStatus", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("status", OBJECT, "StarsRevenueStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa5866b41),
            new Spec(0xa5866b41, "messages.editChatDefaultBannedRights", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("banned_rights", OBJECT, "ChatBannedRights", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa59b102f),
            new Spec(0xa59b102f, "account.updatePasswordSettings", new Field[] { new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1), new Field("new_settings", OBJECT, "account.PasswordInputSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa5a356f9),
            new Spec(0xa5a356f9, "account.sendVerifyPhoneCode", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("settings", OBJECT, "CodeSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa5b45e2b),
            new Spec(0xa5b45e2b, "textDate", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("relative", TRUE, "", 1, 0), new Field("short_time", TRUE, "", 1, 1), new Field("long_time", TRUE, "", 1, 2), new Field("short_date", TRUE, "", 1, 3), new Field("long_date", TRUE, "", 1, 4), new Field("day_of_week", TRUE, "", 1, 5), new Field("text", OBJECT, "RichText", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa5d0514d),
            new Spec(0xa5d0514d, "payments.getStarGiftActiveAuctions", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa5d72105),
            new Spec(0xa5d72105, "updateDialogFilterOrder", new Field[] { new Field("order", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa5eec345),
            new Spec(0xa5eec345, "messages.translateText", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 1, 0), new Field("id", VECTOR, "INT", 1, 0), new Field("text", VECTOR, "TextWithEntities", 1, 1), new Field("to_lang", STRING, "", 0, -1), new Field("tone", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xa60ab9ce),
            new Spec(0xa60ab9ce, "account.getDefaultBackgroundEmojis", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa614d034),
            new Spec(0xa614d034, "account.updateBusinessIntro", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("intro", OBJECT, "InputBusinessIntro", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa6341782),
            new Spec(0xa6341782, "messages.discussionMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("max_id", INT, "", 1, 0), new Field("read_inbox_max_id", INT, "", 1, 1), new Field("read_outbox_max_id", INT, "", 1, 2), new Field("unread_count", INT, "", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa63859ec),
            new Spec(0xa63859ec, "communities.create", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hidden", TRUE, "", 1, 1), new Field("title", STRING, "", 0, -1), new Field("about", STRING, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa6437ef6),
            new Spec(0xa6437ef6, "stats.getStoryPublicForwards", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa663e830),
            new Spec(0xa663e830, "communities.getJoinedCommunities", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa6751e66),
            new Spec(0xa6751e66, "inputStorePaymentPremiumSubscription", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("restore", TRUE, "", 1, 0), new Field("upgrade", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xa676a322),
            new Spec(0xa676a322, "inputMessageID", new Field[] { new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa677244f),
            new Spec(0xa677244f, "auth.sendCode", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("api_id", INT, "", 0, -1), new Field("api_hash", STRING, "", 0, -1), new Field("settings", OBJECT, "CodeSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa69dae02),
            new Spec(0xa69dae02, "dh_gen_fail", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce_hash3", INT128, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa6b1e39a),
            new Spec(0xa6b1e39a, "chatlists.joinChatlistInvite", new Field[] { new Field("slug", STRING, "", 0, -1), new Field("peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa6bb795d),
            new Spec(0xa6bb795d, "wallet.getTransactionsByMsgHash", new Field[] { new Field("msg_hash", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa6edbffd),
            new Spec(0xa6edbffd, "inputBotInlineMessageMediaContact", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("phone_number", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("vcard", STRING, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xa6f8f452),
            new Spec(0xa6f8f452, "webAuthorization", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("domain", STRING, "", 0, -1), new Field("browser", STRING, "", 0, -1), new Field("platform", STRING, "", 0, -1), new Field("date_created", INT, "", 0, -1), new Field("date_active", INT, "", 0, -1), new Field("ip", STRING, "", 0, -1), new Field("region", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa731e257),
            new Spec(0xa731e257, "messages.toggleDialogPin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputDialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa74ece2d),
            new Spec(0xa74ece2d, "smsjobs.join", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa76a5392),
            new Spec(0xa76a5392, "stickers.setStickerSetThumb", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("thumb", OBJECT, "InputDocument", 1, 0), new Field("thumb_document_id", LONG, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xa7848924),
            new Spec(0xa7848924, "updateUserName", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("usernames", VECTOR, "Username", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa7eff811),
            new Spec(0xa7eff811, "bad_msg_notification", new Field[] { new Field("bad_msg_id", LONG, "", 0, -1), new Field("bad_msg_seqno", INT, "", 0, -1), new Field("error_code", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa7ffb56e),
            new Spec(0xa7ffb56e, "wallet.tonConnectGetSessions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa8008cd8),
            new Spec(0xa8008cd8, "encryptedFile", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("size", LONG, "", 0, -1), new Field("dc_id", INT, "", 0, -1), new Field("key_fingerprint", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa80f51e4),
            new Spec(0xa80f51e4, "messageActionGiveawayLaunch", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("stars", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa8406ca9),
            new Spec(0xa8406ca9, "topPeerCategoryForwardUsers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa850a693),
            new Spec(0xa850a693, "channels.reportAntiSpamFalsePositive", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa85bd1c2),
            new Spec(0xa85bd1c2, "messages.editChatAdmin", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("is_admin", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8718dc5),
            new Spec(0xa8718dc5, "pageBlockEmbed", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("full_width", TRUE, "", 1, 0), new Field("allow_scrolling", TRUE, "", 1, 3), new Field("url", STRING, "", 1, 1), new Field("html", STRING, "", 1, 2), new Field("poster_photo_id", LONG, "", 1, 4), new Field("w", INT, "", 1, 5), new Field("h", INT, "", 1, 5), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8763ab5),
            new Spec(0xa8763ab5, "inputMediaDocument", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 2), new Field("id", OBJECT, "InputDocument", 0, -1), new Field("video_cover", OBJECT, "InputPhoto", 1, 3), new Field("video_timestamp", INT, "", 1, 4), new Field("ttl_seconds", INT, "", 1, 0), new Field("query", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xa87b0a1c),
            new Spec(0xa87b0a1c, "inputPeerUserFromMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8830a83),
            new Spec(0xa8830a83, "wallet.getTransactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inbound", TRUE, "", 1, 0), new Field("outbound", TRUE, "", 1, 1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8852491),
            new Spec(0xa8852491, "messageMediaPaidMedia", new Field[] { new Field("stars_amount", LONG, "", 0, -1), new Field("extended_media", VECTOR, "MessageExtendedMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8a3c699),
            new Spec(0xa8a3c699, "messageActionGiftTon", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("crypto_amount", LONG, "", 0, -1), new Field("transaction_id", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xa8ae1cac),
            new Spec(0xa8ae1cac, "updateWalletGaslessInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("available", TRUE, "", 1, 0), new Field("left", INT, "", 0, -1), new Field("reset_at", INT, "", 0, -1), new Field("min_amount", LONG, "", 0, -1), new Field("relayer_address", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8d864a7),
            new Spec(0xa8d864a7, "inputBotInlineResultPhoto", new Field[] { new Field("id", STRING, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("photo", OBJECT, "InputPhoto", 0, -1), new Field("send_message", OBJECT, "InputBotInlineMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa8fb1981),
            new Spec(0xa8fb1981, "updates.differenceSlice", new Field[] { new Field("new_messages", VECTOR, "Message", 0, -1), new Field("new_encrypted_messages", VECTOR, "EncryptedMessage", 0, -1), new Field("other_updates", VECTOR, "Update", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("intermediate_state", OBJECT, "updates.State", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa920bd7a),
            new Spec(0xa920bd7a, "inputBotAppID", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa927fec5),
            new Spec(0xa927fec5, "messages.inactiveChats", new Field[] { new Field("dates", VECTOR, "INT", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa929597a),
            new Spec(0xa929597a, "account.getAuthorizationForm", new Field[] { new Field("bot_id", LONG, "", 0, -1), new Field("scope", STRING, "", 0, -1), new Field("public_key", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa937c7be),
            new Spec(0xa937c7be, "inputSendMessageRichMessageDraftAction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_stop", TRUE, "", 1, 0), new Field("keep_on_stop", TRUE, "", 1, 1), new Field("random_id", LONG, "", 0, -1), new Field("rich_message", OBJECT, "InputRichMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa9478a1a),
            new Spec(0xa9478a1a, "channelParticipantSelf", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_request", TRUE, "", 1, 0), new Field("user_id", LONG, "", 0, -1), new Field("inviter_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("subscription_until_date", INT, "", 1, 1), new Field("rank", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xa99fca4f),
            new Spec(0xa99fca4f, "upload.cdnFile", new Field[] { new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xa9d6db1f),
            new Spec(0xa9d6db1f, "urlAuthResultDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xa9f55f95),
            new Spec(0xa9f55f95, "p_q_inner_data_dc", new Field[] { new Field("pq", STRING, "", 0, -1), new Field("p", STRING, "", 0, -1), new Field("q", STRING, "", 0, -1), new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("new_nonce", INT256, "", 0, -1), new Field("dc", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaa073beb),
            new Spec(0xaa073beb, "messageMediaGiveaway", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("only_new_subscribers", TRUE, "", 1, 0), new Field("winners_are_visible", TRUE, "", 1, 2), new Field("channels", VECTOR, "LONG", 0, -1), new Field("countries_iso2", VECTOR, "STRING", 1, 1), new Field("prize_description", STRING, "", 1, 3), new Field("quantity", INT, "", 0, -1), new Field("months", INT, "", 1, 4), new Field("stars", LONG, "", 1, 5), new Field("until_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaa0cd9e4),
            new Spec(0xaa0cd9e4, "sendMessageUploadDocumentAction", new Field[] { new Field("progress", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaa2769ed),
            new Spec(0xaa2769ed, "bots.sendCustomRequest", new Field[] { new Field("custom_method", STRING, "", 0, -1), new Field("params", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaa472651),
            new Spec(0xaa472651, "dialogFilter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("contacts", TRUE, "", 1, 0), new Field("non_contacts", TRUE, "", 1, 1), new Field("groups", TRUE, "", 1, 2), new Field("broadcasts", TRUE, "", 1, 3), new Field("bots", TRUE, "", 1, 4), new Field("exclude_muted", TRUE, "", 1, 11), new Field("exclude_read", TRUE, "", 1, 12), new Field("exclude_archived", TRUE, "", 1, 13), new Field("title_noanimate", TRUE, "", 1, 28), new Field("id", INT, "", 0, -1), new Field("title", OBJECT, "TextWithEntities", 0, -1), new Field("emoticon", STRING, "", 1, 25), new Field("color", INT, "", 1, 27), new Field("pinned_peers", VECTOR, "InputPeer", 0, -1), new Field("include_peers", VECTOR, "InputPeer", 0, -1), new Field("exclude_peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaa5f789c),
            new Spec(0xaa5f789c, "stories.storyReactionsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("reactions", VECTOR, "StoryReaction", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xaa963b05),
            new Spec(0xaa963b05, "storage.fileUnknown", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xaac7b717),
            new Spec(0xaac7b717, "auth.signUp", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_joined_notifications", TRUE, "", 1, 0), new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaacfff84),
            new Spec(0xaacfff84, "buttonTypeRequestPoll", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("quiz", BOOL, "", 1, 0) }));
    }

    private static void init9() {
        BY_ID.put(Integer.valueOf(0xab03c6d9),
            new Spec(0xab03c6d9, "auth.sentCodeTypeFlashCall", new Field[] { new Field("pattern", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xab0f6b1e),
            new Spec(0xab0f6b1e, "updatePhoneCall", new Field[] { new Field("phone_call", OBJECT, "PhoneCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xab339c00),
            new Spec(0xab339c00, "profileTabFiles", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xab42441a),
            new Spec(0xab42441a, "stats.getBroadcastStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xab661b5b),
            new Spec(0xab661b5b, "topPeerCategoryBotsPM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xab7ec0a0),
            new Spec(0xab7ec0a0, "encryptedChatEmpty", new Field[] { new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xab83b33a),
            new Spec(0xab83b33a, "wallet.getState", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xabbbd346),
            new Spec(0xabbbd346, "messages.summarizeText", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("to_lang", STRING, "", 1, 0), new Field("tone", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xabcfa9fd),
            new Spec(0xabcfa9fd, "help.getPeerProfileColors", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xabd59201),
            new Spec(0xabd59201, "aicompose.getTones", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac072444),
            new Spec(0xac072444, "updateStarGiftCraftFail", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xac1f1fcd),
            new Spec(0xac1f1fcd, "messageActionPaidMessagesRefunded", new Field[] { new Field("count", INT, "", 0, -1), new Field("stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac21d3ce),
            new Spec(0xac21d3ce, "updateBotMessageReaction", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("actor", OBJECT, "Peer", 0, -1), new Field("old_reactions", VECTOR, "Reaction", 0, -1), new Field("new_reactions", VECTOR, "Reaction", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac5c1af7),
            new Spec(0xac5c1af7, "businessLocation", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo_point", OBJECT, "GeoPoint", 1, 0), new Field("address", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac6a83aa),
            new Spec(0xac6a83aa, "textAutoUrl", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac806d61),
            new Spec(0xac806d61, "stories.getAlbumStories", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("album_id", INT, "", 0, -1), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac81bbde),
            new Spec(0xac81bbde, "messages.toggleSavedDialogPin", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputDialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac8505a5),
            new Spec(0xac8505a5, "messages.deletePollAnswer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("option", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xac8dfe19),
            new Spec(0xac8dfe19, "toncenter.apiResponse", new Field[] { new Field("response", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaca9fd2e),
            new Spec(0xaca9fd2e, "invokeWithTakeout", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("takeout_id", LONG, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xacfa1a7e),
            new Spec(0xacfa1a7e, "inputMessageCallbackQuery", new Field[] { new Field("id", INT, "", 0, -1), new Field("query_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xad01d61d),
            new Spec(0xad01d61d, "authorization", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("current", TRUE, "", 1, 0), new Field("official_app", TRUE, "", 1, 1), new Field("password_pending", TRUE, "", 1, 2), new Field("encrypted_requests_disabled", TRUE, "", 1, 3), new Field("call_requests_disabled", TRUE, "", 1, 4), new Field("unconfirmed", TRUE, "", 1, 5), new Field("hash", LONG, "", 0, -1), new Field("device_model", STRING, "", 0, -1), new Field("platform", STRING, "", 0, -1), new Field("system_version", STRING, "", 0, -1), new Field("api_id", INT, "", 0, -1), new Field("app_name", STRING, "", 0, -1), new Field("app_version", STRING, "", 0, -1), new Field("date_created", INT, "", 0, -1), new Field("date_active", INT, "", 0, -1), new Field("ip", STRING, "", 0, -1), new Field("country", STRING, "", 0, -1), new Field("region", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xad0fa15c),
            new Spec(0xad0fa15c, "messages.saveDraft", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 1), new Field("invert_media", TRUE, "", 1, 6), new Field("reply_to", OBJECT, "InputReplyTo", 1, 4), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 3), new Field("media", OBJECT, "InputMedia", 1, 5), new Field("effect", LONG, "", 1, 7), new Field("suggested_post", OBJECT, "SuggestedPost", 1, 8), new Field("rich_message", OBJECT, "InputRichMessage", 1, 9) }));
        BY_ID.put(Integer.valueOf(0xad253d78),
            new Spec(0xad253d78, "codeSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("allow_flashcall", TRUE, "", 1, 0), new Field("current_number", TRUE, "", 1, 1), new Field("allow_app_hash", TRUE, "", 1, 4), new Field("allow_missed_call", TRUE, "", 1, 5), new Field("allow_firebase", TRUE, "", 1, 7), new Field("unknown_number", TRUE, "", 1, 9), new Field("logout_tokens", VECTOR, "BYTES", 1, 6), new Field("token", STRING, "", 1, 8), new Field("app_sandbox", BOOL, "", 1, 8) }));
        BY_ID.put(Integer.valueOf(0xad2e1cd8),
            new Spec(0xad2e1cd8, "account.authorizationForm", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("required_types", VECTOR, "SecureRequiredType", 0, -1), new Field("values", VECTOR, "SecureValue", 0, -1), new Field("errors", VECTOR, "SecureValueError", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("privacy_policy_url", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xad399cee),
            new Spec(0xad399cee, "channels.setBoostsToUnblockRestrictions", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("boosts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xad5648e8),
            new Spec(0xad5648e8, "payments.deleteStarGiftCollection", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("collection_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xad628cc8),
            new Spec(0xad628cc8, "messageExtendedMediaPreview", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("w", INT, "", 1, 0), new Field("h", INT, "", 1, 0), new Field("thumb", OBJECT, "PhotoSize", 1, 1), new Field("video_duration", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xad798849),
            new Spec(0xad798849, "channels.sponsoredMessageReportResultReported", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xad8c9a23),
            new Spec(0xad8c9a23, "channels.getMessages", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("id", VECTOR, "InputMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xadbb0f94),
            new Spec(0xadbb0f94, "invokeWithReCaptcha", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("token", STRING, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xadcbbcda),
            new Spec(0xadcbbcda, "account.getAutoSaveSettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xadec6ebe),
            new Spec(0xadec6ebe, "help.peerColorOption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hidden", TRUE, "", 1, 0), new Field("color_id", INT, "", 0, -1), new Field("colors", OBJECT, "help.PeerColorSet", 1, 1), new Field("dark_colors", OBJECT, "help.PeerColorSet", 1, 2), new Field("channel_min_level", INT, "", 1, 3), new Field("group_min_level", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xadf44ee3),
            new Spec(0xadf44ee3, "inputReportReasonChildAbuse", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xae152a69),
            new Spec(0xae152a69, "joinChatBotResultApproved", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xae168909),
            new Spec(0xae168909, "channelAdminLogEventActionDeleteTopic", new Field[] { new Field("topic", OBJECT, "ForumTopic", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xae1e508d),
            new Spec(0xae1e508d, "storage.filePdf", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xae3f101d),
            new Spec(0xae3f101d, "updatePeerWallpaper", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("wallpaper_overridden", TRUE, "", 1, 1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("wallpaper", OBJECT, "WallPaper", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xae500895),
            new Spec(0xae500895, "future_salts", new Field[] { new Field("req_msg_id", LONG, "", 0, -1), new Field("now", INT, "", 0, -1), new Field("salts", VECTOR, "future_salt", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xae59db5f),
            new Spec(0xae59db5f, "stories.deleteStories", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaeaf9e74),
            new Spec(0xaeaf9e74, "updateSavedDialogPinned", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("peer", OBJECT, "DialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaeb00b34),
            new Spec(0xaeb00b34, "messages.getFullChat", new Field[] { new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaed0cbd9),
            new Spec(0xaed0cbd9, "payments.exportedInvoice", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaed6dbb2),
            new Spec(0xaed6dbb2, "maskCoords", new Field[] { new Field("n", INT, "", 0, -1), new Field("x", DOUBLE, "", 0, -1), new Field("y", DOUBLE, "", 0, -1), new Field("zoom", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaed6e4f5),
            new Spec(0xaed6e4f5, "payments.upgradeStarGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("keep_original_details", TRUE, "", 1, 0), new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaee69d68),
            new Spec(0xaee69d68, "inputPrivacyKeyVoiceMessages", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xaef6abbc),
            new Spec(0xaef6abbc, "payments.starGiftActiveAuctions", new Field[] { new Field("auctions", VECTOR, "StarGiftActiveAuctionState", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaf0a4a08),
            new Spec(0xaf0a4a08, "messages.getForumTopicsByID", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("topics", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xafb6144a),
            new Spec(0xafb6144a, "channelAdminLogEventActionParticipantJoinByRequest", new Field[] { new Field("invite", OBJECT, "ExportedChatInvite", 0, -1), new Field("approved_by", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xafc79cd6),
            new Spec(0xafc79cd6, "textButton", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("text", OBJECT, "RichText", 0, -1), new Field("type", OBJECT, "InlineButtonType", 0, -1), new Field("style", OBJECT, "RichButtonStyle", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xafe5623f),
            new Spec(0xafe5623f, "phone.joinAsPeers", new Field[] { new Field("peers", VECTOR, "Peer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xaff56398),
            new Spec(0xaff56398, "starGiftBackground", new Field[] { new Field("center_color", INT, "", 0, -1), new Field("edge_color", INT, "", 0, -1), new Field("text_color", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb00c47a2),
            new Spec(0xb00c47a2, "messageActionPrizeStars", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unclaimed", TRUE, "", 1, 0), new Field("stars", LONG, "", 0, -1), new Field("transaction_id", STRING, "", 0, -1), new Field("boost_peer", OBJECT, "Peer", 0, -1), new Field("giveaway_msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb05ac6b1),
            new Spec(0xb05ac6b1, "sendMessageChooseStickerAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb06fdbdf),
            new Spec(0xb06fdbdf, "messages.reactionsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb0711d83),
            new Spec(0xb0711d83, "bots.getAdminedBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb07ed085),
            new Spec(0xb07ed085, "messageActionNewCreatorPending", new Field[] { new Field("new_creator_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb08f922a),
            new Spec(0xb08f922a, "messages.deleteHistory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("just_clear", TRUE, "", 1, 0), new Field("revoke", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_date", INT, "", 1, 2), new Field("max_date", INT, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xb0bdeac5),
            new Spec(0xb0bdeac5, "storyView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("blocked", TRUE, "", 1, 0), new Field("blocked_my_stories_from", TRUE, "", 1, 1), new Field("user_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xb0d13e47),
            new Spec(0xb0d13e47, "webPagePending", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("url", STRING, "", 1, 0), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb0d1865b),
            new Spec(0xb0d1865b, "channelParticipantsBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb0d81a83),
            new Spec(0xb0d81a83, "messages.prolongWebView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 5), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 0), new Field("send_as", OBJECT, "InputPeer", 1, 13) }));
        BY_ID.put(Integer.valueOf(0xb0f9684f),
            new Spec(0xb0f9684f, "payments.craftStarGift", new Field[] { new Field("stargift", VECTOR, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb106e66c),
            new Spec(0xb106e66c, "messages.editMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 1), new Field("invert_media", TRUE, "", 1, 16), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("message", STRING, "", 1, 11), new Field("media", OBJECT, "InputMedia", 1, 14), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("entities", VECTOR, "MessageEntity", 1, 3), new Field("schedule_date", INT, "", 1, 15), new Field("schedule_repeat_period", INT, "", 1, 18), new Field("quick_reply_shortcut_id", INT, "", 1, 17), new Field("rich_message", OBJECT, "InputRichMessage", 1, 23) }));
        BY_ID.put(Integer.valueOf(0xb1434d4a),
            new Spec(0xb1434d4a, "updateSentWalletTransaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("gasless", TRUE, "", 1, 0), new Field("msg_hash", STRING, "", 0, -1), new Field("transaction", OBJECT, "WalletTransaction", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb1b8cc83),
            new Spec(0xb1b8cc83, "user", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("self", TRUE, "", 1, 10), new Field("contact", TRUE, "", 1, 11), new Field("mutual_contact", TRUE, "", 1, 12), new Field("deleted", TRUE, "", 1, 13), new Field("bot", TRUE, "", 1, 14), new Field("bot_chat_history", TRUE, "", 1, 15), new Field("bot_nochats", TRUE, "", 1, 16), new Field("verified", TRUE, "", 1, 17), new Field("restricted", TRUE, "", 1, 18), new Field("min", TRUE, "", 1, 20), new Field("bot_inline_geo", TRUE, "", 1, 21), new Field("support", TRUE, "", 1, 23), new Field("scam", TRUE, "", 1, 24), new Field("apply_min_photo", TRUE, "", 1, 25), new Field("fake", TRUE, "", 1, 26), new Field("bot_attach_menu", TRUE, "", 1, 27), new Field("premium", TRUE, "", 1, 28), new Field("attach_menu_enabled", TRUE, "", 1, 29), new Field("flags2", FLAGWORD, "", 0, -1), new Field("bot_can_edit", TRUE, "", 2, 1), new Field("close_friend", TRUE, "", 2, 2), new Field("stories_hidden", TRUE, "", 2, 3), new Field("stories_unavailable", TRUE, "", 2, 4), new Field("contact_require_premium", TRUE, "", 2, 10), new Field("bot_business", TRUE, "", 2, 11), new Field("bot_has_main_app", TRUE, "", 2, 13), new Field("bot_forum_view", TRUE, "", 2, 16), new Field("bot_forum_can_manage_topics", TRUE, "", 2, 17), new Field("bot_can_manage_bots", TRUE, "", 2, 18), new Field("bot_guestchat", TRUE, "", 2, 19), new Field("bot_guard", TRUE, "", 2, 20), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 1, 0), new Field("first_name", STRING, "", 1, 1), new Field("last_name", STRING, "", 1, 2), new Field("username", STRING, "", 1, 3), new Field("phone", STRING, "", 1, 4), new Field("photo", OBJECT, "UserProfilePhoto", 1, 5), new Field("status", OBJECT, "UserStatus", 1, 6), new Field("bot_info_version", INT, "", 1, 14), new Field("restriction_reason", VECTOR, "RestrictionReason", 1, 18), new Field("bot_inline_placeholder", STRING, "", 1, 19), new Field("lang_code", STRING, "", 1, 22), new Field("emoji_status", OBJECT, "EmojiStatus", 1, 30), new Field("usernames", VECTOR, "Username", 2, 0), new Field("stories_max_id", OBJECT, "RecentStory", 2, 5), new Field("color", OBJECT, "PeerColor", 2, 8), new Field("profile_color", OBJECT, "PeerColor", 2, 9), new Field("bot_active_users", INT, "", 2, 12), new Field("bot_verification_icon", LONG, "", 2, 14), new Field("send_paid_messages_stars", LONG, "", 2, 15), new Field("linked_community_id", LONG, "", 2, 21) }));
        BY_ID.put(Integer.valueOf(0xb1c3caa7),
            new Spec(0xb1c3caa7, "channelAdminLogEventActionChangeStickerSet", new Field[] { new Field("prev_stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("new_stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb1d11410),
            new Spec(0xb1d11410, "phone.sendGroupCallMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 0, -1), new Field("allow_paid_stars", LONG, "", 1, 0), new Field("send_as", OBJECT, "InputPeer", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb1db7c7e),
            new Spec(0xb1db7c7e, "inputNotifyBroadcasts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb1f2061f),
            new Spec(0xb1f2061f, "messages.getDocumentByHash", new Field[] { new Field("sha256", BYTES, "", 0, -1), new Field("size", LONG, "", 0, -1), new Field("mime_type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb2028afb),
            new Spec(0xb2028afb, "stories.incrementStoryViews", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb2081a35),
            new Spec(0xb2081a35, "messages.toggleNoForwards", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("enabled", BOOL, "", 0, -1), new Field("request_msg_id", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xb22083a6),
            new Spec(0xb22083a6, "updateNewBotConnection", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("confirmed", TRUE, "", 1, 0), new Field("bot_id", LONG, "", 0, -1), new Field("date", INT, "", 1, 1), new Field("device", STRING, "", 1, 1), new Field("location", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb23fc698),
            new Spec(0xb23fc698, "updateChannelAvailableMessages", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("available_min_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb2539d54),
            new Spec(0xb2539d54, "prepaidGiveaway", new Field[] { new Field("id", LONG, "", 0, -1), new Field("months", INT, "", 0, -1), new Field("quantity", INT, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb26732a9),
            new Spec(0xb26732a9, "account.saveMusic", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unsave", TRUE, "", 1, 0), new Field("id", OBJECT, "InputDocument", 0, -1), new Field("after_id", OBJECT, "InputDocument", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb282217f),
            new Spec(0xb282217f, "inputMediaAreaVenue", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("result_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb288bc7d),
            new Spec(0xb288bc7d, "account.getAllSecureValues", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb2a2f663),
            new Spec(0xb2a2f663, "geoPoint", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("long", DOUBLE, "", 0, -1), new Field("lat", DOUBLE, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("accuracy_radius", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xb2a7386b),
            new Spec(0xb2a7386b, "attachMenuBotIcon", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("name", STRING, "", 0, -1), new Field("icon", OBJECT, "Document", 0, -1), new Field("colors", VECTOR, "AttachMenuBotIconColor", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xb2b15770),
            new Spec(0xb2b15770, "replyInlineMarkup", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force_reply", TRUE, "", 1, 5), new Field("rows", VECTOR, "KeyboardInlineButtonRow", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb2cbc1c0),
            new Spec(0xb2cbc1c0, "phone.discardCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("duration", INT, "", 0, -1), new Field("reason", OBJECT, "PhoneCallDiscardReason", 0, -1), new Field("connection_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb2da71d2),
            new Spec(0xb2da71d2, "recentMeUrlChat", new Field[] { new Field("url", STRING, "", 0, -1), new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb2e8ba03),
            new Spec(0xb2e8ba03, "aicompose.getTone", new Field[] { new Field("tone", OBJECT, "InputAiComposeTone", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb304a621),
            new Spec(0xb304a621, "upload.saveFilePart", new Field[] { new Field("file_id", LONG, "", 0, -1), new Field("file_part", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb3134d9d),
            new Spec(0xb3134d9d, "contacts.found", new Field[] { new Field("my_results", VECTOR, "Peer", 0, -1), new Field("results", VECTOR, "Peer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb320aadb),
            new Spec(0xb320aadb, "secureValueTypePhone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb37794af),
            new Spec(0xb37794af, "auth.sentCodeTypeSmsPhrase", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("beginning", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xb390dc08),
            new Spec(0xb390dc08, "pageRelatedArticle", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("webpage_id", LONG, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("description", STRING, "", 1, 1), new Field("photo_id", LONG, "", 1, 2), new Field("author", STRING, "", 1, 3), new Field("published_date", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xb3a07661),
            new Spec(0xb3a07661, "messageActionGroupCallScheduled", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("schedule_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb3cea0e4),
            new Spec(0xb3cea0e4, "storage.fileMp4", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb3fb5361),
            new Spec(0xb3fb5361, "emojiLanguage", new Field[] { new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4073647),
            new Spec(0xb4073647, "username", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("editable", TRUE, "", 1, 0), new Field("active", TRUE, "", 1, 1), new Field("deletable", TRUE, "", 1, 2), new Field("expired", TRUE, "", 1, 3), new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb41d3272),
            new Spec(0xb41d3272, "inlineButtonTypeCopy", new Field[] { new Field("copy_text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb425cfe1),
            new Spec(0xb425cfe1, "payments.paymentFormStarGift", new Field[] { new Field("form_id", LONG, "", 0, -1), new Field("invoice", OBJECT, "Invoice", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb434e2b8),
            new Spec(0xb434e2b8, "auth.exportedAuthorization", new Field[] { new Field("id", LONG, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4352016),
            new Spec(0xb4352016, "stories.getStoriesArchive", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb43df344),
            new Spec(0xb43df344, "messages.startHistoryImport", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("import_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb43df56c),
            new Spec(0xb43df56c, "inputBotInlineMessageRichMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("rich_message", OBJECT, "InputRichMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb455a106),
            new Spec(0xb455a106, "payments.getSavedStarGift", new Field[] { new Field("stargift", VECTOR, "InputSavedStarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb457b375),
            new Spec(0xb457b375, "starsTransactionPeerAppStore", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb45c69d1),
            new Spec(0xb45c69d1, "messages.affectedHistory", new Field[] { new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1), new Field("offset", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb45ced1d),
            new Spec(0xb45ced1d, "channels.reorderUsernames", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("order", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4608969),
            new Spec(0xb4608969, "channelParticipantsAdmins", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb4a2e88d),
            new Spec(0xb4a2e88d, "updateEncryption", new Field[] { new Field("chat", OBJECT, "EncryptedChat", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4ae666f),
            new Spec(0xb4ae666f, "businessChatLink", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("link", STRING, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 0), new Field("title", STRING, "", 1, 1), new Field("views", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4afcfb0),
            new Spec(0xb4afcfb0, "updatePeerLocated", new Field[] { new Field("peers", VECTOR, "PeerLocated", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4c38cb5),
            new Spec(0xb4c38cb5, "messageActionWebViewDataSent", new Field[] { new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb4c83b4c),
            new Spec(0xb4c83b4c, "notifyUsers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb4d5d859),
            new Spec(0xb4d5d859, "payments.suggestedStarRefBots", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("suggested_bots", VECTOR, "StarRefProgram", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xb4f67e93),
            new Spec(0xb4f67e93, "requirementToContactPaidMessages", new Field[] { new Field("stars_amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb5052fea),
            new Spec(0xb5052fea, "messages.toggleStickerSets", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("uninstall", TRUE, "", 1, 0), new Field("archive", TRUE, "", 1, 1), new Field("unarchive", TRUE, "", 1, 2), new Field("stickersets", VECTOR, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb52c939d),
            new Spec(0xb52c939d, "contacts.topPeersDisabled", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb532772b),
            new Spec(0xb532772b, "pageBlockHeading4", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb549da53),
            new Spec(0xb549da53, "inputMessagesFilterRoundVideo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb54b5acf),
            new Spec(0xb54b5acf, "peerColor", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("color", INT, "", 1, 0), new Field("background_emoji_id", LONG, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb550d328),
            new Spec(0xb550d328, "contacts.unblock", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("my_stories_from", TRUE, "", 1, 0), new Field("id", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb57295d5),
            new Spec(0xb57295d5, "inlineBotWebView", new Field[] { new Field("text", STRING, "", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb574b16b),
            new Spec(0xb574b16b, "account.setContentSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("sensitive_enabled", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xb5890dba),
            new Spec(0xb5890dba, "server_DH_inner_data", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("g", INT, "", 0, -1), new Field("dh_prime", STRING, "", 0, -1), new Field("g_a", STRING, "", 0, -1), new Field("server_time", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb59cf977),
            new Spec(0xb59cf977, "phone.checkGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("sources", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb5a1ce5a),
            new Spec(0xb5a1ce5a, "messageActionChatEditTitle", new Field[] { new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb5aefd7d),
            new Spec(0xb5aefd7d, "updateBotShippingQuery", new Field[] { new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("payload", BYTES, "", 0, -1), new Field("shipping_address", OBJECT, "PostAddress", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb60f5918),
            new Spec(0xb60f5918, "users.getFullUser", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6213cdf),
            new Spec(0xb6213cdf, "shippingOption", new Field[] { new Field("id", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("prices", VECTOR, "LabeledPrice", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb627f3aa),
            new Spec(0xb627f3aa, "bots.reorderPreviewMedias", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("order", VECTOR, "InputMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb637edaf),
            new Spec(0xb637edaf, "statsDateRangeDays", new Field[] { new Field("min_date", INT, "", 0, -1), new Field("max_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb658f23e),
            new Spec(0xb658f23e, "updateDialogUnreadMark", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("unread", TRUE, "", 1, 0), new Field("peer", OBJECT, "DialogPeer", 0, -1), new Field("saved_peer_id", OBJECT, "Peer", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb665902e),
            new Spec(0xb665902e, "sendMessageEmojiInteractionSeen", new Field[] { new Field("emoticon", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb69b72d7),
            new Spec(0xb69b72d7, "messages.chatAdminsWithInvites", new Field[] { new Field("admins", VECTOR, "ChatAdminWithInvites", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6aef7b0),
            new Spec(0xb6aef7b0, "messageActionEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb6c4f543),
            new Spec(0xb6c4f543, "messages.messageViews", new Field[] { new Field("views", VECTOR, "MessageViews", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6c8c393),
            new Spec(0xb6c8c393, "contacts.getSponsoredPeers", new Field[] { new Field("q", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6c8f12b),
            new Spec(0xb6c8f12b, "payments.validateRequestedInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("save", TRUE, "", 1, 0), new Field("invoice", OBJECT, "InputInvoice", 0, -1), new Field("info", OBJECT, "PaymentRequestedInfo", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6cc2d5c),
            new Spec(0xb6cc2d5c, "messagePeerVote", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("option", BYTES, "", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6d915d7),
            new Spec(0xb6d915d7, "inputBotInlineMessageID64", new Field[] { new Field("dc_id", INT, "", 0, -1), new Field("owner_id", LONG, "", 0, -1), new Field("id", INT, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb6e0a3f5),
            new Spec(0xb6e0a3f5, "stats.getMessageStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb71e767a),
            new Spec(0xb71e767a, "jsonString", new Field[] { new Field("value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb7263f6d),
            new Spec(0xb7263f6d, "account.savedRingtone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb74ba9d2),
            new Spec(0xb74ba9d2, "contacts.contactsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb75f99a9),
            new Spec(0xb75f99a9, "updateReadChannelOutbox", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb7b31ea8),
            new Spec(0xb7b31ea8, "baseThemeNight", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb7d998f0),
            new Spec(0xb7d998f0, "payments.getConnectedStarRefBot", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb7e085fe),
            new Spec(0xb7e085fe, "auth.exportLoginToken", new Field[] { new Field("api_id", INT, "", 0, -1), new Field("api_hash", STRING, "", 0, -1), new Field("except_ids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb80e5fe4),
            new Spec(0xb80e5fe4, "messages.setHistoryTTL", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("period", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb81b93d4),
            new Spec(0xb81b93d4, "help.getPremiumPromo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb81c7034),
            new Spec(0xb81c7034, "sendAsPeer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("premium_required", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb826e150),
            new Spec(0xb826e150, "storyFwdHeader", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("modified", TRUE, "", 1, 3), new Field("from", OBJECT, "Peer", 1, 0), new Field("from_name", STRING, "", 1, 1), new Field("story_id", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xb86e380e),
            new Spec(0xb86e380e, "messages.getPollVotes", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("option", BYTES, "", 1, 0), new Field("offset", STRING, "", 1, 1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb880bc4b),
            new Spec(0xb880bc4b, "account.deleteSecureValue", new Field[] { new Field("types", VECTOR, "SecureValueType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb88cf373),
            new Spec(0xb88cf373, "businessBotRecipients", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("existing_chats", TRUE, "", 1, 0), new Field("new_chats", TRUE, "", 1, 1), new Field("contacts", TRUE, "", 1, 2), new Field("non_contacts", TRUE, "", 1, 3), new Field("exclude_selected", TRUE, "", 1, 5), new Field("users", VECTOR, "LONG", 1, 4), new Field("exclude_users", VECTOR, "LONG", 1, 6) }));
        BY_ID.put(Integer.valueOf(0xb8905fb2),
            new Spec(0xb8905fb2, "privacyValueAllowUsers", new Field[] { new Field("users", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb89bfccf),
            new Spec(0xb89bfccf, "factCheck", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("need_check", TRUE, "", 1, 0), new Field("country", STRING, "", 1, 1), new Field("text", OBJECT, "TextWithEntities", 1, 1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb8a0a1a8),
            new Spec(0xb8a0a1a8, "messages.getAllStickers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb8bc5b0c),
            new Spec(0xb8bc5b0c, "inputNotifyPeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb8d0afdf),
            new Spec(0xb8d0afdf, "accountDaysTTL", new Field[] { new Field("days", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb8ea86a9),
            new Spec(0xb8ea86a9, "inputPeerColorCollectible", new Field[] { new Field("collectible_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb8f106e3),
            new Spec(0xb8f106e3, "messages.setBotGuestChatResult", new Field[] { new Field("query_id", LONG, "", 0, -1), new Field("result", OBJECT, "InputBotInlineResult", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb91bbd3a),
            new Spec(0xb91bbd3a, "messageActionSetChatTheme", new Field[] { new Field("theme", OBJECT, "ChatTheme", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb921bd04),
            new Spec(0xb921bd04, "get_future_salts", new Field[] { new Field("num", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb92c09e2),
            new Spec(0xb92c09e2, "recentMeUrlUser", new Field[] { new Field("url", STRING, "", 0, -1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb940c666),
            new Spec(0xb940c666, "messageMediaGeoLive", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("heading", INT, "", 1, 0), new Field("period", INT, "", 0, -1), new Field("proximity_notification_radius", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb956812d),
            new Spec(0xb956812d, "textBankCard", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb98886cf),
            new Spec(0xb98886cf, "inputUserEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb98cd696),
            new Spec(0xb98cd696, "profileTabPosts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb9aa606a),
            new Spec(0xb9aa606a, "botCommandScopeChatAdmins", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xb9b2881f),
            new Spec(0xb9b2881f, "stories.getStoryReactionsList", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("forwards_first", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 1, 0), new Field("offset", STRING, "", 1, 1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb9c0639a),
            new Spec(0xb9c0639a, "peerColorCollectible", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collectible_id", LONG, "", 0, -1), new Field("gift_emoji_id", LONG, "", 0, -1), new Field("background_emoji_id", LONG, "", 0, -1), new Field("accent_color", INT, "", 0, -1), new Field("colors", VECTOR, "INT", 0, -1), new Field("dark_accent_color", INT, "", 1, 0), new Field("dark_colors", VECTOR, "INT", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb9cdc5ee),
            new Spec(0xb9cdc5ee, "messages.getFactCheck", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb9cfc48d),
            new Spec(0xb9cfc48d, "updateBotCallbackQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("chat_instance", LONG, "", 0, -1), new Field("data", BYTES, "", 1, 0), new Field("game_short_name", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xb9d9a38d),
            new Spec(0xb9d9a38d, "account.toggleSponsoredMessages", new Field[] { new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xb9ffc55b),
            new Spec(0xb9ffc55b, "messages.faveSticker", new Field[] { new Field("id", OBJECT, "InputDocument", 0, -1), new Field("unfave", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xba4a3b5b),
            new Spec(0xba4a3b5b, "messages.readSavedHistory", new Field[] { new Field("parent_peer", OBJECT, "InputPeer", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xba6705f0),
            new Spec(0xba6705f0, "contacts.editCloseFriends", new Field[] { new Field("id", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xba7bb15e),
            new Spec(0xba7bb15e, "pollResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("min", TRUE, "", 1, 0), new Field("has_unread_votes", TRUE, "", 1, 6), new Field("can_view_stats", TRUE, "", 1, 7), new Field("results", VECTOR, "PollAnswerVoters", 1, 1), new Field("total_voters", INT, "", 1, 2), new Field("recent_voters", VECTOR, "Peer", 1, 3), new Field("solution", STRING, "", 1, 4), new Field("solution_entities", VECTOR, "MessageEntity", 1, 4), new Field("solution_media", OBJECT, "MessageMedia", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xba8d5f35),
            new Spec(0xba8d5f35, "ephemeral.sendMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invert_media", TRUE, "", 1, 6), new Field("welcome", TRUE, "", 1, 7), new Field("anchor", TRUE, "", 1, 9), new Field("noforwards", TRUE, "", 1, 10), new Field("peer", OBJECT, "InputPeer", 1, 8), new Field("receiver_id", OBJECT, "InputUser", 0, -1), new Field("query_id", LONG, "", 1, 0), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("media", OBJECT, "InputMedia", 1, 2), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 3), new Field("rich_message", OBJECT, "InputRichMessage", 1, 4), new Field("random_id", LONG, "", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xba9ee679),
            new Spec(0xba9ee679, "messages.requestChatJoinWebView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("theme_params", OBJECT, "DataJSON", 1, 0), new Field("platform", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbaa57628),
            new Spec(0xbaa57628, "autoDownloadSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("disabled", TRUE, "", 1, 0), new Field("video_preload_large", TRUE, "", 1, 1), new Field("audio_preload_next", TRUE, "", 1, 2), new Field("phonecalls_less_data", TRUE, "", 1, 3), new Field("stories_preload", TRUE, "", 1, 4), new Field("photo_size_max", INT, "", 0, -1), new Field("video_size_max", LONG, "", 0, -1), new Field("file_size_max", LONG, "", 0, -1), new Field("video_upload_maxbitrate", INT, "", 0, -1), new Field("small_queue_active_operations_max", INT, "", 0, -1), new Field("large_queue_active_operations_max", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbaafe5e0),
            new Spec(0xbaafe5e0, "pageBlockAuthorDate", new Field[] { new Field("author", OBJECT, "RichText", 0, -1), new Field("published_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbac3a61a),
            new Spec(0xbac3a61a, "reactionNotificationsFromContacts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbad07584),
            new Spec(0xbad07584, "inputDocumentFileLocation", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1), new Field("thumb_size", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbad88395),
            new Spec(0xbad88395, "inputMessageReplyTo", new Field[] { new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbaf39d8b),
            new Spec(0xbaf39d8b, "richMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rtl", TRUE, "", 1, 0), new Field("part", TRUE, "", 1, 1), new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("photos", VECTOR, "Photo", 0, -1), new Field("documents", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbaff072f),
            new Spec(0xbaff072f, "pageBlockHeading1", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbb12a419),
            new Spec(0xbb12a419, "messages.setInlineBotResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("gallery", TRUE, "", 1, 0), new Field("private", TRUE, "", 1, 1), new Field("query_id", LONG, "", 0, -1), new Field("results", VECTOR, "InputBotInlineResult", 0, -1), new Field("cache_time", INT, "", 0, -1), new Field("next_offset", STRING, "", 1, 2), new Field("switch_pm", OBJECT, "InlineBotSwitchPM", 1, 3), new Field("switch_webview", OBJECT, "InlineBotWebView", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xbb3b9804),
            new Spec(0xbb3b9804, "account.resetWallPapers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbb6ae88d),
            new Spec(0xbb6ae88d, "channelParticipantsContacts", new Field[] { new Field("q", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbb8125ba),
            new Spec(0xbb8125ba, "messages.getTopReactions", new Field[] { new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbb92ba95),
            new Spec(0xbb92ba95, "messageEntityUnknown", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbb9bb9a5),
            new Spec(0xbb9bb9a5, "updatePeerHistoryTTL", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("ttl_period", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xbbab2643),
            new Spec(0xbbab2643, "storyReactionPublicForward", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbbb6b4a3),
            new Spec(0xbbb6b4a3, "starsAmount", new Field[] { new Field("amount", LONG, "", 0, -1), new Field("nanos", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbbcce4c2),
            new Spec(0xbbcce4c2, "payments.currencyRates", new Field[] { new Field("rates", VECTOR, "CurrencyRate", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbbf2dda0),
            new Spec(0xbbf2dda0, "securePasswordKdfAlgoPBKDF2HMACSHA512iter100000", new Field[] { new Field("salt", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbbf51685),
            new Spec(0xbbf51685, "emailVerifyPurposePassport", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbc0a57dc),
            new Spec(0xbc0a57dc, "recentMeUrlStickerSet", new Field[] { new Field("url", STRING, "", 0, -1), new Field("set", OBJECT, "StickerSetCovered", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbc2eab30),
            new Spec(0xbc2eab30, "privacyKeyStatusTimestamp", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbc799737),
            new Spec(0xbc799737, "boolFalse", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbcf22685),
            new Spec(0xbcf22685, "phone.inviteConferenceCallParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 0), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
    }

    private static void init10() {
        BY_ID.put(Integer.valueOf(0xbd0415c4),
            new Spec(0xbd0415c4, "stories.togglePeerStoriesHidden", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("hidden", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd0d99eb),
            new Spec(0xbd0d99eb, "bots.exportBotToken", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("revoke", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd17a14a),
            new Spec(0xbd17a14a, "topPeerCategoryGroups", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbd1efd3e),
            new Spec(0xbd1efd3e, "payments.getStarsGiveawayOptions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbd2a0840),
            new Spec(0xbd2a0840, "inputPeerChannelFromMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("channel_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd38850a),
            new Spec(0xbd38850a, "messages.sendScheduledMessages", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd47cbad),
            new Spec(0xbd47cbad, "messageActionChatCreate", new Field[] { new Field("title", STRING, "", 0, -1), new Field("users", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd610bc9),
            new Spec(0xbd610bc9, "messageEntityBold", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd74cf49),
            new Spec(0xbd74cf49, "storyViewPublicRepost", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("blocked", TRUE, "", 1, 0), new Field("blocked_my_stories_from", TRUE, "", 1, 1), new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("story", OBJECT, "StoryItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd7f90ac),
            new Spec(0xbd7f90ac, "messages.getUnreadReactions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("saved_peer_id", OBJECT, "InputPeer", 1, 1), new Field("offset_id", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd8367b9),
            new Spec(0xbd8367b9, "updateChatParticipantRank", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("rank", STRING, "", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbd87cb6c),
            new Spec(0xbd87cb6c, "savedDialog", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 2), new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_message", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbdac7e70),
            new Spec(0xbdac7e70, "updateJoinChatWebViewDecision", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("result", OBJECT, "JoinChatBotResult", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbdbb0464),
            new Spec(0xbdbb0464, "messages.getScheduledMessages", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbdc597b4),
            new Spec(0xbdc597b4, "inputPrivacyKeyNoPaidMessages", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbdc62dcc),
            new Spec(0xbdc62dcc, "messages.exportedChatInvites", new Field[] { new Field("count", INT, "", 0, -1), new Field("invites", VECTOR, "ExportedChatInvite", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbdca2f75),
            new Spec(0xbdca2f75, "messages.editExportedChatInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoked", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("link", STRING, "", 0, -1), new Field("expire_date", INT, "", 1, 0), new Field("usage_limit", INT, "", 1, 1), new Field("request_needed", BOOL, "", 1, 3), new Field("title", STRING, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xbdcdaec0),
            new Spec(0xbdcdaec0, "inputChatUploadedPhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("file", OBJECT, "InputFile", 1, 0), new Field("video", OBJECT, "InputFile", 1, 1), new Field("video_start_ts", DOUBLE, "", 1, 2), new Field("video_emoji_markup", OBJECT, "VideoSize", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xbddb616e),
            new Spec(0xbddb616e, "messages.availableEffects", new Field[] { new Field("hash", INT, "", 0, -1), new Field("effects", VECTOR, "AvailableEffect", 0, -1), new Field("documents", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbddcc510),
            new Spec(0xbddcc510, "inputBotInlineMessageMediaWebPage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invert_media", TRUE, "", 1, 3), new Field("force_large_media", TRUE, "", 1, 4), new Field("force_small_media", TRUE, "", 1, 5), new Field("optional", TRUE, "", 1, 6), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("url", STRING, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xbde90a8d),
            new Spec(0xbde90a8d, "wallet.existingBalance", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_balance", TRUE, "", 1, 0), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbdf93428),
            new Spec(0xbdf93428, "messages.getDefaultTagReactions", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbdf9653b),
            new Spec(0xbdf9653b, "game", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("short_name", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "Photo", 0, -1), new Field("document", OBJECT, "Document", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xbdfb0426),
            new Spec(0xbdfb0426, "inputPrivacyKeyChatInvite", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbe098173),
            new Spec(0xbe098173, "account.chatThemes", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hash", LONG, "", 0, -1), new Field("themes", VECTOR, "ChatTheme", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("next_offset", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xbe1e85ba),
            new Spec(0xbe1e85ba, "fragment.getCollectibleInfo", new Field[] { new Field("collectible", OBJECT, "InputCollectible", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbe376999),
            new Spec(0xbe376999, "notifyCommunity", new Field[] { new Field("community_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbe382906),
            new Spec(0xbe382906, "messages.featuredStickers", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("premium", TRUE, "", 1, 0), new Field("hash", LONG, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("sets", VECTOR, "StickerSetCovered", 0, -1), new Field("unread", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbe4e0ef8),
            new Spec(0xbe4e0ef8, "channelAdminLogEventActionChangeAvailableReactions", new Field[] { new Field("prev_value", OBJECT, "ChatReactions", 0, -1), new Field("new_value", OBJECT, "ChatReactions", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbe5335be),
            new Spec(0xbe5335be, "upload.getFile", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("precise", TRUE, "", 1, 0), new Field("cdn_supported", TRUE, "", 1, 1), new Field("location", OBJECT, "InputFileLocation", 0, -1), new Field("offset", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbe7e8ef1),
            new Spec(0xbe7e8ef1, "req_pq_multi", new Field[] { new Field("nonce", INT128, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbe82db9c),
            new Spec(0xbe82db9c, "mediaAreaVenue", new Field[] { new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("title", STRING, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("venue_id", STRING, "", 0, -1), new Field("venue_type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbec268ef),
            new Spec(0xbec268ef, "updateNotifySettings", new Field[] { new Field("peer", OBJECT, "NotifyPeer", 0, -1), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbedc9822),
            new Spec(0xbedc9822, "statsGraphError", new Field[] { new Field("error", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbf0693d4),
            new Spec(0xbf0693d4, "messageEntityStrike", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbf25b7f3),
            new Spec(0xbf25b7f3, "bots.getRequestedWebViewButton", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("webapp_req_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbf4dea82),
            new Spec(0xbf4dea82, "pageBlockTable", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bordered", TRUE, "", 1, 0), new Field("striped", TRUE, "", 1, 1), new Field("compact", TRUE, "", 1, 2), new Field("title", OBJECT, "RichText", 0, -1), new Field("rows", VECTOR, "PageTableRow", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbf7d6572),
            new Spec(0xbf7d6572, "messageActionNoForwardsToggle", new Field[] { new Field("prev_value", BOOL, "", 0, -1), new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbf899aa0),
            new Spec(0xbf899aa0, "account.setAuthorizationTTL", new Field[] { new Field("authorization_ttl_days", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbf9459b7),
            new Spec(0xbf9459b7, "invokeWithoutUpdates", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbfb5ad8b),
            new Spec(0xbfb5ad8b, "channelLocationEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbfb9f457),
            new Spec(0xbfb9f457, "help.passportConfigNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xbfd02da2),
            new Spec(0xbfd02da2, "inlineButtonTypeUrlAuth", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("fwd_text", STRING, "", 1, 0), new Field("url", STRING, "", 0, -1), new Field("button_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbfd064ec),
            new Spec(0xbfd064ec, "pageBlockHeader", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xbfe3dd3d),
            new Spec(0xbfe3dd3d, "communities.toggleAllPeerLinkRequestApproval", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reject", TRUE, "", 1, 0), new Field("community", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc000bba2),
            new Spec(0xc000bba2, "auth.sentCodeTypeSms", new Field[] { new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc007cec3),
            new Spec(0xc007cec3, "notifyChats", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc00ec7d3),
            new Spec(0xc00ec7d3, "payments.getStarsTopupOptions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc0111fe3),
            new Spec(0xc0111fe3, "channels.deleteChannel", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc01a597a),
            new Spec(0xc01a597a, "buttonTypeSimpleWebView", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc01f6fe8),
            new Spec(0xc01f6fe8, "messages.savedDialogsNotModified", new Field[] { new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc070d93e),
            new Spec(0xc070d93e, "pageBlockPreformatted", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("language", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc077ec01),
            new Spec(0xc077ec01, "availableReaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inactive", TRUE, "", 1, 0), new Field("premium", TRUE, "", 1, 2), new Field("reaction", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("static_icon", OBJECT, "Document", 0, -1), new Field("appear_animation", OBJECT, "Document", 0, -1), new Field("select_animation", OBJECT, "Document", 0, -1), new Field("activate_animation", OBJECT, "Document", 0, -1), new Field("effect_animation", OBJECT, "Document", 0, -1), new Field("around_animation", OBJECT, "Document", 1, 1), new Field("center_icon", OBJECT, "Document", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xc0944820),
            new Spec(0xc0944820, "messageActionTopicEdit", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("icon_emoji_id", LONG, "", 1, 1), new Field("closed", BOOL, "", 1, 2), new Field("hidden", BOOL, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xc0977421),
            new Spec(0xc0977421, "help.getPromoData", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc0c4edc9),
            new Spec(0xc0c4edc9, "payments.checkCanSendGift", new Field[] { new Field("gift_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc0cf7646),
            new Spec(0xc0cf7646, "messages.sendInlineBotResult", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 5), new Field("background", TRUE, "", 1, 6), new Field("clear_draft", TRUE, "", 1, 7), new Field("hide_via", TRUE, "", 1, 11), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 0), new Field("random_id", LONG, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("id", STRING, "", 0, -1), new Field("schedule_date", INT, "", 1, 10), new Field("send_as", OBJECT, "InputPeer", 1, 13), new Field("quick_reply_shortcut", OBJECT, "InputQuickReplyShortcut", 1, 17), new Field("allow_paid_stars", LONG, "", 1, 21) }));
        BY_ID.put(Integer.valueOf(0xc0de1bd9),
            new Spec(0xc0de1bd9, "jsonObjectValue", new Field[] { new Field("key", STRING, "", 0, -1), new Field("value", OBJECT, "JSONValue", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc0e24635),
            new Spec(0xc0e24635, "messages.dhConfigNotModified", new Field[] { new Field("random", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc10eb2cf),
            new Spec(0xc10eb2cf, "inputPaymentCredentialsSaved", new Field[] { new Field("id", STRING, "", 0, -1), new Field("tmp_password", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc12622c4),
            new Spec(0xc12622c4, "textUnderline", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc13d1c11),
            new Spec(0xc13d1c11, "inputMediaVenue", new Field[] { new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("title", STRING, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("venue_id", STRING, "", 0, -1), new Field("venue_type", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc13e3c50),
            new Spec(0xc13e3c50, "importedContact", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("client_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc1cbd5b6),
            new Spec(0xc1cbd5b6, "account.cancelPasswordEmail", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc1cd5ea9),
            new Spec(0xc1cd5ea9, "initConnection", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("flags", FLAGWORD, "", 0, -1), new Field("api_id", INT, "", 0, -1), new Field("device_model", STRING, "", 0, -1), new Field("system_version", STRING, "", 0, -1), new Field("app_version", STRING, "", 0, -1), new Field("system_lang_code", STRING, "", 0, -1), new Field("lang_pack", STRING, "", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("proxy", OBJECT, "InputClientProxy", 1, 0), new Field("params", OBJECT, "JSONValue", 1, 1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc1e4a2b1),
            new Spec(0xc1e4a2b1, "inputReportReasonOther", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc1e92cc5),
            new Spec(0xc1e92cc5, "account.savedRingtones", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("ringtones", VECTOR, "Document", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc1f46103),
            new Spec(0xc1f46103, "aicompose.tonesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc1f8e69a),
            new Spec(0xc1f8e69a, "inputMessagesFilterMyMentions", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc21b8849),
            new Spec(0xc21b8849, "inputMediaWebPage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force_large_media", TRUE, "", 1, 0), new Field("force_small_media", TRUE, "", 1, 1), new Field("optional", TRUE, "", 1, 2), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc21f497e),
            new Spec(0xc21f497e, "encryptedFileEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc23727c9),
            new Spec(0xc23727c9, "account.passwordInputSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("new_algo", OBJECT, "PasswordKdfAlgo", 1, 0), new Field("new_password_hash", BYTES, "", 1, 0), new Field("hint", STRING, "", 1, 0), new Field("email", STRING, "", 1, 1), new Field("new_secure_settings", OBJECT, "SecureSecretSettings", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xc239d686),
            new Spec(0xc239d686, "inputWebFileLocation", new Field[] { new Field("url", STRING, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc2510192),
            new Spec(0xc2510192, "bots.getPopularAppBots", new Field[] { new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc27dfa68),
            new Spec(0xc27dfa68, "stats.getPollStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc2c00779),
            new Spec(0xc2c00779, "wallet.tonConnectSubmitConnectResult", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("error", TRUE, "", 1, 0), new Field("session_id", LONG, "", 0, -1), new Field("challenge_answer", BYTES, "", 0, -1), new Field("body", BYTES, "", 0, -1), new Field("trace_id", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xc31c8f4e),
            new Spec(0xc31c8f4e, "account.webBrowserSettingsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc31fc14a),
            new Spec(0xc31fc14a, "inputPasskeyResponseLogin", new Field[] { new Field("client_data", OBJECT, "DataJSON", 0, -1), new Field("authenticator_data", BYTES, "", 0, -1), new Field("signature", BYTES, "", 0, -1), new Field("user_handle", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc326caef),
            new Spec(0xc326caef, "inputInvoiceSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc32af4cc),
            new Spec(0xc32af4cc, "payments.reorderStarGiftCollections", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("order", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc32bfa1a),
            new Spec(0xc32bfa1a, "attachMenuPeerTypeBotPM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc32d5b12),
            new Spec(0xc32d5b12, "updateDeleteChannelMessages", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("messages", VECTOR, "INT", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc331e80a),
            new Spec(0xc331e80a, "inputGameShortName", new Field[] { new Field("bot_id", OBJECT, "InputUser", 0, -1), new Field("short_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc3878e23),
            new Spec(0xc3878e23, "help.country", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hidden", TRUE, "", 1, 0), new Field("iso2", STRING, "", 0, -1), new Field("default_name", STRING, "", 0, -1), new Field("name", STRING, "", 1, 1), new Field("country_codes", VECTOR, "help.CountryCode", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc387c04e),
            new Spec(0xc387c04e, "stories.canSendStoryCount", new Field[] { new Field("count_remains", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc3987a3a),
            new Spec(0xc3987a3a, "stories.albums", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("albums", VECTOR, "StoryAlbum", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc39a2ade),
            new Spec(0xc39a2ade, "updateWebBrowserSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("open_external_browser", TRUE, "", 1, 0), new Field("display_close_button", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xc3a12462),
            new Spec(0xc3a12462, "baseThemeClassic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc3a2835f),
            new Spec(0xc3a2835f, "auth.loggedOut", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("future_auth_token", BYTES, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xc3dffc04),
            new Spec(0xc3dffc04, "chatTheme", new Field[] { new Field("emoticon", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc3f2f501),
            new Spec(0xc3f2f501, "businessAwayMessageScheduleOutsideWorkHours", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc4103386),
            new Spec(0xc4103386, "inputMediaPaidMedia", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("stars_amount", LONG, "", 0, -1), new Field("extended_media", VECTOR, "InputMedia", 0, -1), new Field("payload", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xc448415c),
            new Spec(0xc448415c, "myBoost", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("slot", INT, "", 0, -1), new Field("peer", OBJECT, "Peer", 1, 0), new Field("date", INT, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("cooldown_until_date", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xc4563590),
            new Spec(0xc4563590, "payments.getStarGifts", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc45a6536),
            new Spec(0xc45a6536, "help.noAppUpdate", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc4870a49),
            new Spec(0xc4870a49, "updateBotStopped", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("stopped", BOOL, "", 0, -1), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc4a353ee),
            new Spec(0xc4a353ee, "contacts.getStatuses", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc4b9f9bb),
            new Spec(0xc4b9f9bb, "error", new Field[] { new Field("code", INT, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc4e57915),
            new Spec(0xc4e57915, "inputPrivacyValueDisallowBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc4e5921e),
            new Spec(0xc4e5921e, "inputBusinessBotRecipients", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("existing_chats", TRUE, "", 1, 0), new Field("new_chats", TRUE, "", 1, 1), new Field("contacts", TRUE, "", 1, 2), new Field("non_contacts", TRUE, "", 1, 3), new Field("exclude_selected", TRUE, "", 1, 5), new Field("users", VECTOR, "InputUser", 1, 4), new Field("exclude_users", VECTOR, "InputUser", 1, 6) }));
        BY_ID.put(Integer.valueOf(0xc4f9186b),
            new Spec(0xc4f9186b, "help.getConfig", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc516d679),
            new Spec(0xc516d679, "messageActionBotAllowed", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("attach_menu", TRUE, "", 1, 1), new Field("from_request", TRUE, "", 1, 3), new Field("domain", STRING, "", 1, 0), new Field("app", OBJECT, "BotApp", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xc517f77e),
            new Spec(0xc517f77e, "channelAdminLogEventActionToggleAutotranslation", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc5226f17),
            new Spec(0xc5226f17, "phoneCallWaiting", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("video", TRUE, "", 1, 6), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("admin_id", LONG, "", 0, -1), new Field("participant_id", LONG, "", 0, -1), new Field("protocol", OBJECT, "PhoneCallProtocol", 0, -1), new Field("receive_date", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xc556a45d),
            new Spec(0xc556a45d, "textAutoEmail", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc558d8ab),
            new Spec(0xc558d8ab, "phone.getGroupParticipants", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("ids", VECTOR, "InputPeer", 0, -1), new Field("sources", VECTOR, "INT", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc563c1e4),
            new Spec(0xc563c1e4, "messages.updateDialogFiltersOrder", new Field[] { new Field("order", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc5b56859),
            new Spec(0xc5b56859, "inputInvoiceMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc5ba3d86),
            new Spec(0xc5ba3d86, "account.reportPeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("reason", OBJECT, "ReportReason", 0, -1), new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc624b16e),
            new Spec(0xc624b16e, "messageActionPaymentSent", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("recurring_init", TRUE, "", 1, 2), new Field("recurring_used", TRUE, "", 1, 3), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("invoice_slug", STRING, "", 1, 0), new Field("subscription_until_date", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xc661ad08),
            new Spec(0xc661ad08, "help.getPassportConfig", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc6701900),
            new Spec(0xc6701900, "phone.sendConferenceCallBroadcast", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("block", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc68d6695),
            new Spec(0xc68d6695, "messages.quickReplies", new Field[] { new Field("quick_replies", VECTOR, "QuickReply", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc69708d3),
            new Spec(0xc69708d3, "sponsoredPeer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("random_id", BYTES, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("sponsor_info", STRING, "", 1, 0), new Field("additional_info", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xc6c1e5a7),
            new Spec(0xc6c1e5a7, "messageEntityDiffReplace", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("old_text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc6dc0c66),
            new Spec(0xc6dc0c66, "messages.featuredStickersNotModified", new Field[] { new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc704147d),
            new Spec(0xc704147d, "bots.removeUsername", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc727bb3b),
            new Spec(0xc727bb3b, "account.installTheme", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("theme", OBJECT, "InputTheme", 1, 1), new Field("format", STRING, "", 1, 2), new Field("base_theme", OBJECT, "BaseTheme", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xc7345e6a),
            new Spec(0xc7345e6a, "jsonBool", new Field[] { new Field("value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc776ba4e),
            new Spec(0xc776ba4e, "messages.channelMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inexact", TRUE, "", 1, 1), new Field("pts", INT, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("offset_id_offset", INT, "", 1, 2), new Field("messages", VECTOR, "Message", 0, -1), new Field("topics", VECTOR, "ForumTopic", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc7770878),
            new Spec(0xc7770878, "payments.changeStarsSubscription", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("subscription_id", STRING, "", 0, -1), new Field("canceled", BOOL, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xc78fe460),
            new Spec(0xc78fe460, "messages.installStickerSet", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("archived", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc7b57ce6),
            new Spec(0xc7b57ce6, "botMenuButton", new Field[] { new Field("text", STRING, "", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc7edbc83),
            new Spec(0xc7edbc83, "messageActionTodoAppendTasks", new Field[] { new Field("list", VECTOR, "TodoItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc7fb5e01),
            new Spec(0xc7fb5e01, "textSuperscript", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc84834ce),
            new Spec(0xc84834ce, "autoSaveSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("photos", TRUE, "", 1, 0), new Field("videos", TRUE, "", 1, 1), new Field("video_max_size", LONG, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xc88b3b02),
            new Spec(0xc88b3b02, "inputStickerSetPremiumGifts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc8a0ec74),
            new Spec(0xc8a0ec74, "messages.getStickerSet", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1), new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc8cf05f8),
            new Spec(0xc8cf05f8, "messageEntityCustomEmoji", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("document_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc93de95c),
            new Spec(0xc93de95c, "inputChatTheme", new Field[] { new Field("emoticon", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc957a766),
            new Spec(0xc957a766, "updateGroupCallEncryptedMessage", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("from_id", OBJECT, "Peer", 0, -1), new Field("encrypted_message", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc982eaba),
            new Spec(0xc982eaba, "cdnPublicKey", new Field[] { new Field("dc_id", INT, "", 0, -1), new Field("public_key", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc99b1950),
            new Spec(0xc99b1950, "botAppSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("placeholder_path", BYTES, "", 1, 0), new Field("background_color", INT, "", 1, 1), new Field("background_dark_color", INT, "", 1, 2), new Field("header_color", INT, "", 1, 3), new Field("header_dark_color", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xc9a47b0b),
            new Spec(0xc9a47b0b, "messages.checkUrlAuthMatchCode", new Field[] { new Field("url", STRING, "", 0, -1), new Field("match_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc9b0539f),
            new Spec(0xc9b0539f, "searchResultsCalendarPeriod", new Field[] { new Field("date", INT, "", 0, -1), new Field("min_msg_id", INT, "", 0, -1), new Field("max_msg_id", INT, "", 0, -1), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc9b9e2b9),
            new Spec(0xc9b9e2b9, "businessAwayMessageScheduleAlways", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc9dd90e9),
            new Spec(0xc9dd90e9, "buttonTypeDefault", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xc9e01e7b),
            new Spec(0xc9e01e7b, "messages.requestMainWebView", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("compact", TRUE, "", 1, 7), new Field("fullscreen", TRUE, "", 1, 8), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("bot", OBJECT, "InputUser", 0, -1), new Field("start_param", STRING, "", 1, 1), new Field("theme_params", OBJECT, "DataJSON", 1, 0), new Field("platform", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc9e33d54),
            new Spec(0xc9e33d54, "channels.inviteToChannel", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("users", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xc9f06e1b),
            new Spec(0xc9f06e1b, "requestPeerTypeChat", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("bot_participant", TRUE, "", 1, 5), new Field("has_username", BOOL, "", 1, 3), new Field("forum", BOOL, "", 1, 4), new Field("user_admin_rights", OBJECT, "ChatAdminRights", 1, 1), new Field("bot_admin_rights", OBJECT, "ChatAdminRights", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xc9f81ce8),
            new Spec(0xc9f81ce8, "account.setPrivacy", new Field[] { new Field("key", OBJECT, "InputPrivacyKey", 0, -1), new Field("rules", VECTOR, "InputPrivacyRule", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xca461b5d),
            new Spec(0xca461b5d, "peerLocated", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("expires", INT, "", 0, -1), new Field("distance", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xca5cab89),
            new Spec(0xca5cab89, "messageMediaVideoStream", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rtmp_stream", TRUE, "", 1, 0), new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xca8ae8ba),
            new Spec(0xca8ae8ba, "account.invalidateSignInCodes", new Field[] { new Field("codes", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcacb6ae2),
            new Spec(0xcacb6ae2, "inputPeerNotifySettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("show_previews", BOOL, "", 1, 0), new Field("silent", BOOL, "", 1, 1), new Field("mute_until", INT, "", 1, 2), new Field("sound", OBJECT, "NotificationSound", 1, 3), new Field("stories_muted", BOOL, "", 1, 6), new Field("stories_hide_sender", BOOL, "", 1, 7), new Field("stories_sound", OBJECT, "NotificationSound", 1, 8) }));
        BY_ID.put(Integer.valueOf(0xcad181f6),
            new Spec(0xcad181f6, "langPackString", new Field[] { new Field("key", STRING, "", 0, -1), new Field("value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcad5452d),
            new Spec(0xcad5452d, "mediaAreaGeoPoint", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("coordinates", OBJECT, "MediaAreaCoordinates", 0, -1), new Field("geo", OBJECT, "GeoPoint", 0, -1), new Field("address", OBJECT, "GeoPointAddress", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xcae1aadf),
            new Spec(0xcae1aadf, "storage.fileGif", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xcae47523),
            new Spec(0xcae47523, "auth.resendCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("reason", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xcae68768),
            new Spec(0xcae68768, "stories.peerStories", new Field[] { new Field("stories", OBJECT, "PeerStories", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcb296bf8),
            new Spec(0xcb296bf8, "labeledPrice", new Field[] { new Field("label", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcb2ac766),
            new Spec(0xcb2ac766, "channelAdminLogEventActionToggleNoForwards", new Field[] { new Field("new_value", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcb43acde),
            new Spec(0xcb43acde, "statsAbsValueAndPrev", new Field[] { new Field("current", DOUBLE, "", 0, -1), new Field("previous", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcb6ff828),
            new Spec(0xcb6ff828, "savedReactionTag", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("reaction", OBJECT, "Reaction", 0, -1), new Field("title", STRING, "", 1, 0), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcb9deff6),
            new Spec(0xcb9deff6, "auth.reportMissingCode", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("mnc", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcb9f372d),
            new Spec(0xcb9f372d, "invokeAfterMsg", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("msg_id", LONG, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcba9a52f),
            new Spec(0xcba9a52f, "todoItem", new Field[] { new Field("id", INT, "", 0, -1), new Field("title", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcbb7a507),
            new Spec(0xcbb7a507, "communityFull", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("about", STRING, "", 0, -1), new Field("chat_photo", OBJECT, "Photo", 0, -1), new Field("linked_peers", VECTOR, "CommunityPeer", 0, -1), new Field("admins_count", INT, "", 1, 1), new Field("kicked_count", INT, "", 1, 2), new Field("peer_link_requests_pending", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xcbc6d107),
            new Spec(0xcbc6d107, "messages.addChatUser", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("fwd_limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcbc7ee28),
            new Spec(0xcbc7ee28, "inputSecureFileLocation", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcbce2fe0),
            new Spec(0xcbce2fe0, "statsPercentValue", new Field[] { new Field("part", DOUBLE, "", 0, -1), new Field("total", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcbe31e26),
            new Spec(0xcbe31e26, "secureValueTypeAddress", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xcbea6bc4),
            new Spec(0xcbea6bc4, "phone.joinGroupCallPresentation", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("params", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc02aa6d),
            new Spec(0xcc02aa6d, "messageActionBoostApply", new Field[] { new Field("boosts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc104937),
            new Spec(0xcc104937, "channels.readHistory", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc1a241e),
            new Spec(0xcc1a241e, "config", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("default_p2p_contacts", TRUE, "", 1, 3), new Field("preload_featured_stickers", TRUE, "", 1, 4), new Field("revoke_pm_inbox", TRUE, "", 1, 6), new Field("blocked_mode", TRUE, "", 1, 8), new Field("force_try_ipv6", TRUE, "", 1, 14), new Field("date", INT, "", 0, -1), new Field("expires", INT, "", 0, -1), new Field("test_mode", BOOL, "", 0, -1), new Field("this_dc", INT, "", 0, -1), new Field("dc_options", VECTOR, "DcOption", 0, -1), new Field("dc_txt_domain_name", STRING, "", 0, -1), new Field("chat_size_max", INT, "", 0, -1), new Field("megagroup_size_max", INT, "", 0, -1), new Field("forwarded_count_max", INT, "", 0, -1), new Field("online_update_period_ms", INT, "", 0, -1), new Field("offline_blur_timeout_ms", INT, "", 0, -1), new Field("offline_idle_timeout_ms", INT, "", 0, -1), new Field("online_cloud_timeout_ms", INT, "", 0, -1), new Field("notify_cloud_delay_ms", INT, "", 0, -1), new Field("notify_default_delay_ms", INT, "", 0, -1), new Field("push_chat_period_ms", INT, "", 0, -1), new Field("push_chat_limit", INT, "", 0, -1), new Field("edit_time_limit", INT, "", 0, -1), new Field("revoke_time_limit", INT, "", 0, -1), new Field("revoke_pm_time_limit", INT, "", 0, -1), new Field("rating_e_decay", INT, "", 0, -1), new Field("stickers_recent_limit", INT, "", 0, -1), new Field("channels_read_media_period", INT, "", 0, -1), new Field("tmp_sessions", INT, "", 1, 0), new Field("call_receive_timeout_ms", INT, "", 0, -1), new Field("call_ring_timeout_ms", INT, "", 0, -1), new Field("call_connect_timeout_ms", INT, "", 0, -1), new Field("call_packet_timeout_ms", INT, "", 0, -1), new Field("me_url_prefix", STRING, "", 0, -1), new Field("autoupdate_url_prefix", STRING, "", 1, 7), new Field("gif_search_username", STRING, "", 1, 9), new Field("venue_search_username", STRING, "", 1, 10), new Field("img_search_username", STRING, "", 1, 11), new Field("static_maps_provider", STRING, "", 1, 12), new Field("caption_length_max", INT, "", 0, -1), new Field("message_length_max", INT, "", 0, -1), new Field("webfile_dc_id", INT, "", 0, -1), new Field("suggested_lang_code", STRING, "", 1, 2), new Field("lang_pack_version", INT, "", 1, 2), new Field("base_lang_pack_version", INT, "", 1, 2), new Field("reactions_default", OBJECT, "Reaction", 1, 15), new Field("autologin_token", STRING, "", 1, 16) }));
        BY_ID.put(Integer.valueOf(0xcc4d9ecc),
            new Spec(0xcc4d9ecc, "businessAwayMessageScheduleCustom", new Field[] { new Field("start_date", INT, "", 0, -1), new Field("end_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc5b67cc),
            new Spec(0xcc5b67cc, "messages.getAttachedStickers", new Field[] { new Field("media", OBJECT, "InputStickeredMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc5bebb3),
            new Spec(0xcc5bebb3, "payments.fulfillStarsSubscription", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("subscription_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc6e0c11),
            new Spec(0xcc6e0c11, "account.updateBirthday", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("birthday", OBJECT, "Birthday", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xcc7c5c89),
            new Spec(0xcc7c5c89, "messageActionTodoCompletions", new Field[] { new Field("completed", VECTOR, "INT", 0, -1), new Field("incompleted", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcc931046),
            new Spec(0xcc931046, "wallet.tonConnectCreateSession", new Field[] { new Field("dapp_client_id", STRING, "", 0, -1), new Field("manifest_url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xccbbce30),
            new Spec(0xccbbce30, "help.appUpdate", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_not_skip", TRUE, "", 1, 0), new Field("id", INT, "", 0, -1), new Field("version", STRING, "", 0, -1), new Field("text", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 0, -1), new Field("document", OBJECT, "Document", 1, 1), new Field("url", STRING, "", 1, 2), new Field("sticker", OBJECT, "Document", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xccfddf96),
            new Spec(0xccfddf96, "messages.saveDefaultSendAs", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("send_as", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcd24cf44),
            new Spec(0xcd24cf44, "textMention", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcd77d957),
            new Spec(0xcd77d957, "channelMessagesFilter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("exclude_new_messages", TRUE, "", 1, 1), new Field("ranges", VECTOR, "MessageRange", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcd78e586),
            new Spec(0xcd78e586, "rpc_answer_dropped_running", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xcd984aa5),
            new Spec(0xcd984aa5, "langpack.getDifference", new Field[] { new Field("lang_pack", STRING, "", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("from_version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcdaf63c7),
            new Spec(0xcdaf63c7, "toncenter.getStreamingUrl", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xcdbbcebb),
            new Spec(0xcdbbcebb, "messages.allStickers", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("sets", VECTOR, "StickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcdc27a1f),
            new Spec(0xcdc27a1f, "paymentSavedCredentialsCard", new Field[] { new Field("id", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcdc3858c),
            new Spec(0xcdc3858c, "account.wallPapers", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("wallpapers", VECTOR, "WallPaper", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcdd4093d),
            new Spec(0xcdd4093d, "updateBotGuestChatQuery", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("message", OBJECT, "Message", 0, -1), new Field("reference_messages", VECTOR, "Message", 1, 0), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcdd42a05),
            new Spec(0xcdd42a05, "auth.bindTempAuthKey", new Field[] { new Field("perm_auth_key_id", LONG, "", 0, -1), new Field("nonce", LONG, "", 0, -1), new Field("expires_at", INT, "", 0, -1), new Field("encrypted_message", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xce03da83),
            new Spec(0xce03da83, "chatlists.getExportedInvites", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xce0d37b0),
            new Spec(0xce0d37b0, "pageBlockAnchor", new Field[] { new Field("name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xceaa3ea1),
            new Spec(0xceaa3ea1, "messageMediaGiveawayResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("only_new_subscribers", TRUE, "", 1, 0), new Field("refunded", TRUE, "", 1, 2), new Field("channel_id", LONG, "", 0, -1), new Field("additional_peers_count", INT, "", 1, 3), new Field("launch_msg_id", INT, "", 0, -1), new Field("winners_count", INT, "", 0, -1), new Field("unclaimed_count", INT, "", 0, -1), new Field("winners", VECTOR, "LONG", 0, -1), new Field("months", INT, "", 1, 4), new Field("stars", LONG, "", 1, 5), new Field("prize_description", STRING, "", 1, 1), new Field("until_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcecc1134),
            new Spec(0xcecc1134, "messages.editForumTopic", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("topic_id", INT, "", 0, -1), new Field("title", STRING, "", 1, 0), new Field("icon_emoji_id", LONG, "", 1, 1), new Field("closed", BOOL, "", 1, 2), new Field("hidden", BOOL, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xcef7e7a8),
            new Spec(0xcef7e7a8, "starGiftAttributeRarityLegendary", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xcf1592db),
            new Spec(0xcf1592db, "messages.reportSpam", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcf6f6db8),
            new Spec(0xcf6f6db8, "webPageAttributeUniqueStarGift", new Field[] { new Field("gift", OBJECT, "StarGift", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcf9c725b),
            new Spec(0xcf9c725b, "ephemeral.editMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("invert_media", TRUE, "", 1, 5), new Field("welcome", TRUE, "", 1, 6), new Field("peer", OBJECT, "InputPeer", 1, 7), new Field("receiver_id", OBJECT, "InputUser", 0, -1), new Field("id", INT, "", 0, -1), new Field("message", STRING, "", 1, 0), new Field("media", OBJECT, "InputMedia", 1, 3), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("rich_message", OBJECT, "InputRichMessage", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xcfb9d957),
            new Spec(0xcfb9d957, "messages.transcribedAudio", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pending", TRUE, "", 1, 0), new Field("transcription_id", LONG, "", 0, -1), new Field("text", STRING, "", 0, -1), new Field("trial_remains_num", INT, "", 1, 1), new Field("trial_remains_until_date", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xcfc9e002),
            new Spec(0xcfc9e002, "mediaAreaCoordinates", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("x", DOUBLE, "", 0, -1), new Field("y", DOUBLE, "", 0, -1), new Field("w", DOUBLE, "", 0, -1), new Field("h", DOUBLE, "", 0, -1), new Field("rotation", DOUBLE, "", 0, -1), new Field("radius", DOUBLE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xcfcd0f13),
            new Spec(0xcfcd0f13, "storyReactionPublicRepost", new Field[] { new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("story", OBJECT, "StoryItem", 0, -1) }));
    }

    private static void init11() {
        BY_ID.put(Integer.valueOf(0xcff43f61),
            new Spec(0xcff43f61, "account.setContactSignUpNotification", new Field[] { new Field("silent", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xcff63ea9),
            new Spec(0xcff63ea9, "aiComposeTone", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("slug", STRING, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("emoji_id", LONG, "", 1, 1), new Field("prompt", STRING, "", 1, 4), new Field("installs_count", INT, "", 1, 2), new Field("author_id", LONG, "", 1, 3), new Field("example_english", OBJECT, "AiComposeToneExample", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xd069ccde),
            new Spec(0xd069ccde, "stories.startLive", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 2), new Field("noforwards", TRUE, "", 1, 4), new Field("rtmp_stream", TRUE, "", 1, 5), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("caption", STRING, "", 1, 0), new Field("entities", VECTOR, "MessageEntity", 1, 1), new Field("privacy_rules", VECTOR, "InputPrivacyRule", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("messages_enabled", BOOL, "", 1, 6), new Field("send_paid_messages_stars", LONG, "", 1, 7) }));
        BY_ID.put(Integer.valueOf(0xd06e93a8),
            new Spec(0xd06e93a8, "payments.getStarGiftWithdrawalUrl", new Field[] { new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1), new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd072acb4),
            new Spec(0xd072acb4, "restrictionReason", new Field[] { new Field("platform", STRING, "", 0, -1), new Field("reason", STRING, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd087663a),
            new Spec(0xd087663a, "updateChatParticipant", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("chat_id", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("actor_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("prev_participant", OBJECT, "ChatParticipant", 1, 0), new Field("new_participant", OBJECT, "ChatParticipant", 1, 1), new Field("invite", OBJECT, "ExportedChatInvite", 1, 2), new Field("qts", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd08ce645),
            new Spec(0xd08ce645, "account.emojiStatusesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd0b5e1fc),
            new Spec(0xd0b5e1fc, "messages.getMyStickers", new Field[] { new Field("offset_id", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd0e482b2),
            new Spec(0xd0e482b2, "phone.groupCallStreamChannels", new Field[] { new Field("channels", VECTOR, "GroupCallStreamChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd0e8075c),
            new Spec(0xd0e8075c, "server_DH_params_ok", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("encrypted_answer", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd1219bdd),
            new Spec(0xd1219bdd, "inputPrivacyKeyAddedByPhone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd1435160),
            new Spec(0xd1435160, "destroy_auth_key", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd1451883),
            new Spec(0xd1451883, "payments.validatedRequestedInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", STRING, "", 1, 0), new Field("shipping_options", VECTOR, "ShippingOption", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xd179d494),
            new Spec(0xd179d494, "wallet.getBackupHolderDcs", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd1810907),
            new Spec(0xd1810907, "stories.searchPosts", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hashtag", STRING, "", 1, 0), new Field("area", OBJECT, "MediaArea", 1, 1), new Field("peer", OBJECT, "InputPeer", 1, 2), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd18b4d16),
            new Spec(0xd18b4d16, "auth.checkPassword", new Field[] { new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd19ae46d),
            new Spec(0xd19ae46d, "privacyKeyPhoneNumber", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd1b4ab14),
            new Spec(0xd1b4ab14, "aicompose.getToneExample", new Field[] { new Field("tone", OBJECT, "InputAiComposeTone", 0, -1), new Field("num", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd1d34a26),
            new Spec(0xd1d34a26, "sendMessageUploadPhotoAction", new Field[] { new Field("progress", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd1d7efc5),
            new Spec(0xd1d7efc5, "payments.getStarsRevenueAdsAccountUrl", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd1da940c),
            new Spec(0xd1da940c, "messages.deleteFactCheck", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd1e42e24),
            new Spec(0xd1e42e24, "onrampSession", new Field[] { new Field("provider", STRING, "", 0, -1), new Field("session_id", STRING, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("expires_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd1ed9a5b),
            new Spec(0xd1ed9a5b, "messages.availableEffectsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd1ee8199),
            new Spec(0xd1ee8199, "updateWalletTonConnectPendingDisconnect", new Field[] { new Field("session_ids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd27ff082),
            new Spec(0xd27ff082, "inputCheckPasswordSRP", new Field[] { new Field("srp_id", LONG, "", 0, -1), new Field("A", BYTES, "", 0, -1), new Field("M1", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd2816f10),
            new Spec(0xd2816f10, "messages.deleteTopicHistory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd29a27f4),
            new Spec(0xd29a27f4, "updateChannelMessageForwards", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("id", INT, "", 0, -1), new Field("forwards", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd2aaf7ec),
            new Spec(0xd2aaf7ec, "messages.updatePinnedMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("silent", TRUE, "", 1, 0), new Field("unpin", TRUE, "", 1, 1), new Field("pm_oneside", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd30d78d4),
            new Spec(0xd30d78d4, "messages.sendReaction", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("big", TRUE, "", 1, 1), new Field("add_to_recent", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("reaction", VECTOR, "Reaction", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd31bc45d),
            new Spec(0xd31bc45d, "starGiftActiveAuctionState", new Field[] { new Field("gift", OBJECT, "StarGift", 0, -1), new Field("state", OBJECT, "StarGiftAuctionState", 0, -1), new Field("user_state", OBJECT, "StarGiftAuctionUserState", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd33f43f3),
            new Spec(0xd33f43f3, "inputMediaGame", new Field[] { new Field("id", OBJECT, "InputGame", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd348bc44),
            new Spec(0xd348bc44, "contacts.getLocated", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("background", TRUE, "", 1, 1), new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1), new Field("self_expires", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd35983e8),
            new Spec(0xd35983e8, "payments.getCurrencyRates", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd360e72c),
            new Spec(0xd360e72c, "help.getSupportName", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd3656499),
            new Spec(0xd3656499, "profileTabLinks", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd3bc4b7a),
            new Spec(0xd3bc4b7a, "userEmpty", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd3c96bc8),
            new Spec(0xd3c96bc8, "payments.getStarsGiftOptions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd3e03124),
            new Spec(0xd3e03124, "messages.toggleTodoCompleted", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("completed", VECTOR, "INT", 0, -1), new Field("incompleted", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd3f924eb),
            new Spec(0xd3f924eb, "messages.stickerSetNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd433ad73),
            new Spec(0xd433ad73, "ipPort", new Field[] { new Field("ipv4", INT, "", 0, -1), new Field("port", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd45ab096),
            new Spec(0xd45ab096, "passwordKdfAlgoUnknown", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd464a42b),
            new Spec(0xd464a42b, "messages.deleteExportedChatInvite", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("link", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd483f2a8),
            new Spec(0xd483f2a8, "messages.getQuickReplies", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd49f34c6),
            new Spec(0xd49f34c6, "channel", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("creator", TRUE, "", 1, 0), new Field("left", TRUE, "", 1, 2), new Field("broadcast", TRUE, "", 1, 5), new Field("verified", TRUE, "", 1, 7), new Field("megagroup", TRUE, "", 1, 8), new Field("restricted", TRUE, "", 1, 9), new Field("signatures", TRUE, "", 1, 11), new Field("min", TRUE, "", 1, 12), new Field("scam", TRUE, "", 1, 19), new Field("has_link", TRUE, "", 1, 20), new Field("has_geo", TRUE, "", 1, 21), new Field("slowmode_enabled", TRUE, "", 1, 22), new Field("call_active", TRUE, "", 1, 23), new Field("call_not_empty", TRUE, "", 1, 24), new Field("fake", TRUE, "", 1, 25), new Field("gigagroup", TRUE, "", 1, 26), new Field("noforwards", TRUE, "", 1, 27), new Field("join_to_send", TRUE, "", 1, 28), new Field("join_request", TRUE, "", 1, 29), new Field("forum", TRUE, "", 1, 30), new Field("flags2", FLAGWORD, "", 0, -1), new Field("stories_hidden", TRUE, "", 2, 1), new Field("stories_hidden_min", TRUE, "", 2, 2), new Field("stories_unavailable", TRUE, "", 2, 3), new Field("signature_profiles", TRUE, "", 2, 12), new Field("autotranslation", TRUE, "", 2, 15), new Field("broadcast_messages_allowed", TRUE, "", 2, 16), new Field("monoforum", TRUE, "", 2, 17), new Field("forum_tabs", TRUE, "", 2, 19), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 1, 13), new Field("title", STRING, "", 0, -1), new Field("username", STRING, "", 1, 6), new Field("photo", OBJECT, "ChatPhoto", 0, -1), new Field("date", INT, "", 0, -1), new Field("restriction_reason", VECTOR, "RestrictionReason", 1, 9), new Field("admin_rights", OBJECT, "ChatAdminRights", 1, 14), new Field("banned_rights", OBJECT, "ChatBannedRights", 1, 15), new Field("default_banned_rights", OBJECT, "ChatBannedRights", 1, 18), new Field("participants_count", INT, "", 1, 17), new Field("usernames", VECTOR, "Username", 2, 0), new Field("stories_max_id", OBJECT, "RecentStory", 2, 4), new Field("color", OBJECT, "PeerColor", 2, 7), new Field("profile_color", OBJECT, "PeerColor", 2, 8), new Field("emoji_status", OBJECT, "EmojiStatus", 2, 9), new Field("level", INT, "", 2, 10), new Field("subscription_until_date", INT, "", 2, 11), new Field("bot_verification_icon", LONG, "", 2, 13), new Field("send_paid_messages_stars", LONG, "", 2, 14), new Field("linked_monoforum_id", LONG, "", 2, 18), new Field("linked_community_id", LONG, "", 2, 20) }));
        BY_ID.put(Integer.valueOf(0xd4ea706d),
            new Spec(0xd4ea706d, "walletTransactionPeerUser", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("domain", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd52f73f7),
            new Spec(0xd52f73f7, "sendMessageRecordAudioAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd5676710),
            new Spec(0xd5676710, "channelAdminLogEventActionParticipantToggleAdmin", new Field[] { new Field("prev_participant", OBJECT, "ChannelParticipant", 0, -1), new Field("new_participant", OBJECT, "ChannelParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd58f130a),
            new Spec(0xd58f130a, "messages.setBotCallbackAnswer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("alert", TRUE, "", 1, 1), new Field("query_id", LONG, "", 0, -1), new Field("message", STRING, "", 1, 0), new Field("url", STRING, "", 1, 2), new Field("cache_time", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd5a41724),
            new Spec(0xd5a41724, "updateMessageExtendedMedia", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("extended_media", VECTOR, "MessageExtendedMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd5a5d3a1),
            new Spec(0xd5a5d3a1, "messages.getStickers", new Field[] { new Field("emoticon", STRING, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd5b10c26),
            new Spec(0xd5b10c26, "messages.getEmojiURL", new Field[] { new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd5b3b9f9),
            new Spec(0xd5b3b9f9, "emojiKeyword", new Field[] { new Field("keyword", STRING, "", 0, -1), new Field("emoticons", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd5e58274),
            new Spec(0xd5e58274, "payments.checkCanSendGiftResultFail", new Field[] { new Field("reason", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd5f0ad91),
            new Spec(0xd5f0ad91, "channelParticipantBanned", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("left", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("kicked_by", LONG, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("banned_rights", OBJECT, "ChatBannedRights", 0, -1), new Field("rank", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xd612e8ef),
            new Spec(0xd612e8ef, "notifyBroadcasts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd61ad6ee),
            new Spec(0xd61ad6ee, "auth.codeTypeMissedCall", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd62ff46a),
            new Spec(0xd62ff46a, "requestedPeerUser", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("first_name", STRING, "", 1, 0), new Field("last_name", STRING, "", 1, 0), new Field("username", STRING, "", 1, 1), new Field("photo", OBJECT, "Photo", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xd638de89),
            new Spec(0xd638de89, "account.getChatThemes", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd63d94e0),
            new Spec(0xd63d94e0, "messages.getPinnedSavedDialogs", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd63f61ce),
            new Spec(0xd63f61ce, "wallet.tonConnectCloseSession", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("session_id", LONG, "", 0, -1), new Field("body", BYTES, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd64c522b),
            new Spec(0xd64c522b, "updateMessagePoll", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 1, 1), new Field("msg_id", INT, "", 1, 1), new Field("top_msg_id", INT, "", 1, 2), new Field("poll_id", LONG, "", 0, -1), new Field("poll", OBJECT, "Poll", 1, 0), new Field("results", OBJECT, "PollResults", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd65a11cc),
            new Spec(0xd65a11cc, "inputPrivacyKeyBirthday", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd66b66c9),
            new Spec(0xd66b66c9, "inputPrivacyValueDisallowAll", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd6753386),
            new Spec(0xd6753386, "account.getDefaultEmojiStatuses", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd69b8361),
            new Spec(0xd69b8361, "account.saveAutoSaveSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("users", TRUE, "", 1, 0), new Field("chats", TRUE, "", 1, 1), new Field("broadcasts", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 1, 3), new Field("settings", OBJECT, "AutoSaveSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd6b19546),
            new Spec(0xd6b19546, "updateReadChannelDiscussionInbox", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("channel_id", LONG, "", 0, -1), new Field("top_msg_id", INT, "", 0, -1), new Field("read_max_id", INT, "", 0, -1), new Field("broadcast_id", LONG, "", 1, 0), new Field("broadcast_post", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd6b94df2),
            new Spec(0xd6b94df2, "messages.getPinnedDialogs", new Field[] { new Field("folder_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd6e3b813),
            new Spec(0xd6e3b813, "joinChatBotResultWebView", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd712e4be),
            new Spec(0xd712e4be, "req_DH_params", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("p", STRING, "", 0, -1), new Field("q", STRING, "", 0, -1), new Field("public_key_fingerprint", LONG, "", 0, -1), new Field("encrypted_data", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd7584c87),
            new Spec(0xd7584c87, "statsGroupTopAdmin", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("deleted", INT, "", 0, -1), new Field("kicked", INT, "", 0, -1), new Field("banned", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd766c50a),
            new Spec(0xd766c50a, "inlineQueryPeerTypeChat", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd766e3ea),
            new Spec(0xd766e3ea, "communities.toggleCommunityCollapsedInDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collapsed", TRUE, "", 1, 0), new Field("community", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd7ca61a2),
            new Spec(0xd7ca61a2, "updateChatParticipantAdmin", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("is_admin", BOOL, "", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd7e78225),
            new Spec(0xd7e78225, "inputBotInlineMessageMediaInvoice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "InputWebDocument", 1, 0), new Field("invoice", OBJECT, "Invoice", 0, -1), new Field("payload", BYTES, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("provider_data", OBJECT, "DataJSON", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xd80da15d),
            new Spec(0xd80da15d, "starsTransactionPeer", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd8214d41),
            new Spec(0xd8214d41, "photoPathSize", new Field[] { new Field("type", STRING, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd8326f0d),
            new Spec(0xd8326f0d, "updateGroupCallMessage", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("message", OBJECT, "GroupCallMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd83466f3),
            new Spec(0xd83466f3, "inputPhotoLegacyFileLocation", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1), new Field("volume_id", LONG, "", 0, -1), new Field("local_id", INT, "", 0, -1), new Field("secret", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd83d70c1),
            new Spec(0xd83d70c1, "payments.clearSavedInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("credentials", TRUE, "", 1, 0), new Field("info", TRUE, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xd8411139),
            new Spec(0xd8411139, "payments.paymentVerificationNeeded", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd897bc66),
            new Spec(0xd897bc66, "auth.requestPasswordRecovery", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd89a83a3),
            new Spec(0xd89a83a3, "users.getRequirementsToContact", new Field[] { new Field("id", VECTOR, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd8aa3671),
            new Spec(0xd8aa3671, "channels.updateColor", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("for_profile", TRUE, "", 1, 1), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("color", INT, "", 1, 2), new Field("background_emoji_id", LONG, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd8aa840f),
            new Spec(0xd8aa840f, "inputGroupCall", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd8c72eec),
            new Spec(0xd8c72eec, "wallet.replaceWallet", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("wallet", OBJECT, "InputWalletReplacement", 0, -1), new Field("password", OBJECT, "InputCheckPasswordSRP", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xd90d8dfe),
            new Spec(0xd90d8dfe, "attachMenuBot", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inactive", TRUE, "", 1, 0), new Field("has_settings", TRUE, "", 1, 1), new Field("request_write_access", TRUE, "", 1, 2), new Field("show_in_attach_menu", TRUE, "", 1, 3), new Field("show_in_side_menu", TRUE, "", 1, 4), new Field("side_menu_disclaimer_needed", TRUE, "", 1, 5), new Field("bot_id", LONG, "", 0, -1), new Field("short_name", STRING, "", 0, -1), new Field("peer_types", VECTOR, "AttachMenuPeerType", 1, 3), new Field("icons", VECTOR, "AttachMenuBotIcon", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd912a59c),
            new Spec(0xd912a59c, "textItalic", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd91ffad6),
            new Spec(0xd91ffad6, "payments.getStarsRevenueStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("ton", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd92c2285),
            new Spec(0xd92c2285, "speakingInGroupCallAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xd94305e0),
            new Spec(0xd94305e0, "account.updatePersonalChannel", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd9565c39),
            new Spec(0xd9565c39, "auth.sentCodeTypeFragmentSms", new Field[] { new Field("url", STRING, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd95c6154),
            new Spec(0xd95c6154, "messageActionSecureValuesSent", new Field[] { new Field("types", VECTOR, "SecureValueType", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd9ab0f54),
            new Spec(0xd9ab0f54, "messages.getCustomEmojiDocuments", new Field[] { new Field("document_id", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xd9ba2e54),
            new Spec(0xd9ba2e54, "contacts.addContact", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("add_phone_privacy_exception", TRUE, "", 1, 0), new Field("id", OBJECT, "InputUser", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("phone", STRING, "", 0, -1), new Field("note", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xd9e5d9e2),
            new Spec(0xd9e5d9e2, "wallet.sendTransfer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("data_normal", BYTES, "", 0, -1), new Field("data_gasless", BYTES, "", 1, 0), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("random_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xda2ad647),
            new Spec(0xda2ad647, "messages.emojiGameOutcome", new Field[] { new Field("seed", BYTES, "", 0, -1), new Field("stake_ton_amount", LONG, "", 0, -1), new Field("ton_amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xda69fb52),
            new Spec(0xda69fb52, "msgs_state_req", new Field[] { new Field("msg_ids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xda80f42f),
            new Spec(0xda80f42f, "help.getPeerColors", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xda9b0d0d),
            new Spec(0xda9b0d0d, "invokeWithLayer", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("layer", INT, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdabab2ef),
            new Spec(0xdabab2ef, "inputInvoicePremiumGiftStars", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("months", INT, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xdabbf83a),
            new Spec(0xdabbf83a, "payments.paymentReceiptStars", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "WebDocument", 1, 2), new Field("invoice", OBJECT, "Invoice", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("transaction_id", STRING, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdacb836a),
            new Spec(0xdacb836a, "inputRichMessageHTML", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rtl", TRUE, "", 1, 0), new Field("noautolink", TRUE, "", 1, 1), new Field("html", STRING, "", 0, -1), new Field("files", VECTOR, "InputRichFile", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xdadbc950),
            new Spec(0xdadbc950, "account.getPrivacy", new Field[] { new Field("key", OBJECT, "InputPrivacyKey", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdaecc589),
            new Spec(0xdaecc589, "messages.composeMessageWithAI", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("proofread", TRUE, "", 1, 0), new Field("emojify", TRUE, "", 1, 3), new Field("text", OBJECT, "TextWithEntities", 0, -1), new Field("translate_to_lang", STRING, "", 1, 1), new Field("tone", OBJECT, "InputAiComposeTone", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xdaeda864),
            new Spec(0xdaeda864, "contacts.getBirthdays", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdb20b188),
            new Spec(0xdb20b188, "pageBlockDivider", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdb21d0a7),
            new Spec(0xdb21d0a7, "inputSecureValue", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("data", OBJECT, "SecureData", 1, 0), new Field("front_side", OBJECT, "InputSecureFile", 1, 1), new Field("reverse_side", OBJECT, "InputSecureFile", 1, 2), new Field("selfie", OBJECT, "InputSecureFile", 1, 3), new Field("translation", VECTOR, "InputSecureFile", 1, 6), new Field("files", VECTOR, "InputSecureFile", 1, 4), new Field("plain_data", OBJECT, "SecurePlainData", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xdb33dad0),
            new Spec(0xdb33dad0, "payments.starGiftActiveAuctionsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdb64fd34),
            new Spec(0xdb64fd34, "account.tmpPassword", new Field[] { new Field("tmp_password", BYTES, "", 0, -1), new Field("valid_until", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdb7e1747),
            new Spec(0xdb7e1747, "account.resetNotifySettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdb909ec2),
            new Spec(0xdb909ec2, "emailVerificationGoogle", new Field[] { new Field("token", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdb9ac18d),
            new Spec(0xdb9ac18d, "ephemeral.getWelcomeMessages", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdb9d897d),
            new Spec(0xdb9d897d, "botCommandScopePeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdb9e70d2),
            new Spec(0xdb9e70d2, "inputPrivacyKeyPhoneP2P", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdb9f9140),
            new Spec(0xdb9f9140, "channelAdminLogEventActionDiscardGroupCall", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdbbe6c6a),
            new Spec(0xdbbe6c6a, "pageBlockHeading5", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdbce6389),
            new Spec(0xdbce6389, "starGiftAttributeRarityUncommon", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdbd4feed),
            new Spec(0xdbd4feed, "inputReportReasonGeoIrrelevant", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdbda9246),
            new Spec(0xdbda9246, "sendMessageHistoryImportAction", new Field[] { new Field("progress", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdc0242c8),
            new Spec(0xdc0242c8, "messages.sendWebViewData", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("button_text", STRING, "", 0, -1), new Field("data", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdc3d824f),
            new Spec(0xdc3d824f, "textEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdc58f31e),
            new Spec(0xdc58f31e, "updateStarGiftAuctionUserState", new Field[] { new Field("gift_id", LONG, "", 0, -1), new Field("user_state", OBJECT, "StarGiftAuctionUserState", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdc6cfcf0),
            new Spec(0xdc6cfcf0, "paidReactionPrivacyPeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdc7b1140),
            new Spec(0xdc7b1140, "messageEntityMentionName", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("user_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdc8b44cf),
            new Spec(0xdc8b44cf, "smsjobs.eligibleToJoin", new Field[] { new Field("terms_url", STRING, "", 0, -1), new Field("monthly_sent_sms", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdcb118b7),
            new Spec(0xdcb118b7, "groupCallParticipantVideoSourceGroup", new Field[] { new Field("semantics", STRING, "", 0, -1), new Field("sources", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdcd914fd),
            new Spec(0xdcd914fd, "bots.getBotInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot", OBJECT, "InputUser", 1, 0), new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdcdf8607),
            new Spec(0xdcdf8607, "stats.getMegagroupStats", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("dark", TRUE, "", 1, 0), new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdd0c66f2),
            new Spec(0xdd0c66f2, "starRefProgram", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("bot_id", LONG, "", 0, -1), new Field("commission_permille", INT, "", 0, -1), new Field("duration_months", INT, "", 1, 0), new Field("end_date", INT, "", 1, 1), new Field("daily_revenue_per_user", OBJECT, "StarsAmount", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xdd18782e),
            new Spec(0xdd18782e, "help.appConfig", new Field[] { new Field("hash", INT, "", 0, -1), new Field("config", OBJECT, "JSONValue", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdd1fbf93),
            new Spec(0xdd1fbf93, "bots.accessSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("restricted", TRUE, "", 1, 0), new Field("add_users", VECTOR, "User", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xdd27bee9),
            new Spec(0xdd27bee9, "ephemeralMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("out", TRUE, "", 1, 0), new Field("welcome_template", TRUE, "", 1, 5), new Field("invert_media", TRUE, "", 1, 7), new Field("noforwards", TRUE, "", 1, 12), new Field("id", INT, "", 0, -1), new Field("from_id", OBJECT, "Peer", 0, -1), new Field("peer_id", OBJECT, "Peer", 1, 9), new Field("receiver_id", LONG, "", 0, -1), new Field("top_msg_id", INT, "", 1, 1), new Field("date", INT, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("entities", VECTOR, "MessageEntity", 1, 2), new Field("media", OBJECT, "MessageMedia", 1, 3), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 4), new Field("reply_to", OBJECT, "MessageReplyHeader", 1, 6), new Field("rich_message", OBJECT, "RichMessage", 1, 8), new Field("chat_instance", LONG, "", 1, 10), new Field("anchor_msg_id", INT, "", 1, 11) }));
        BY_ID.put(Integer.valueOf(0xdd289f8e),
            new Spec(0xdd289f8e, "invokeWithBusinessConnection", new Field[] { new Field("{X", OBJECT, "Type}", 0, -1), new Field("connection_id", STRING, "", 0, -1), new Field("query", OBJECT, "!X", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdd39316a),
            new Spec(0xdd39316a, "aicompose.deleteTone", new Field[] { new Field("tone", OBJECT, "InputAiComposeTone", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdd6a8f48),
            new Spec(0xdd6a8f48, "sendMessageGamePlayAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xddbcd819),
            new Spec(0xddbcd819, "messages.reportMusicListen", new Field[] { new Field("id", OBJECT, "InputDocument", 0, -1), new Field("listened_duration", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdde8a54c),
            new Spec(0xdde8a54c, "inputPeerUser", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xddf10c3b),
            new Spec(0xddf10c3b, "messageMediaWebPage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("force_large_media", TRUE, "", 1, 0), new Field("force_small_media", TRUE, "", 1, 1), new Field("manual", TRUE, "", 1, 3), new Field("safe", TRUE, "", 1, 4), new Field("webpage", OBJECT, "WebPage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xde266ef5),
            new Spec(0xde266ef5, "contacts.topPeersNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xde33b094),
            new Spec(0xde33b094, "videoSize", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("size", INT, "", 0, -1), new Field("video_start_ts", DOUBLE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xde3f3c79),
            new Spec(0xde3f3c79, "channelParticipantsRecent", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xde4c5d93),
            new Spec(0xde4c5d93, "geoPointAddress", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("country_iso2", STRING, "", 0, -1), new Field("state", STRING, "", 1, 0), new Field("city", STRING, "", 1, 1), new Field("street", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xde5a0dd6),
            new Spec(0xde5a0dd6, "textEmail", new Field[] { new Field("text", OBJECT, "RichText", 0, -1), new Field("email", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xde7b673d),
            new Spec(0xde7b673d, "upload.saveBigFilePart", new Field[] { new Field("file_id", LONG, "", 0, -1), new Field("file_part", INT, "", 0, -1), new Field("file_total_parts", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xde91436e),
            new Spec(0xde91436e, "messages.importChatInvite", new Field[] { new Field("hash", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xde9eed1d),
            new Spec(0xde9eed1d, "stories.storyViews", new Field[] { new Field("views", VECTOR, "StoryViews", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdea20a39),
            new Spec(0xdea20a39, "messages.getAvailableEffects", new Field[] { new Field("hash", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdef143d0),
            new Spec(0xdef143d0, "updatePinnedForumTopics", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("order", VECTOR, "INT", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xdef60797),
            new Spec(0xdef60797, "messages.editChatAbout", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("about", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdf04dd4e),
            new Spec(0xdf04dd4e, "messages.getChatInviteImporters", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("requested", TRUE, "", 1, 0), new Field("subscription_expired", TRUE, "", 1, 3), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("link", STRING, "", 1, 1), new Field("q", STRING, "", 1, 2), new Field("offset_date", INT, "", 0, -1), new Field("offset_user", OBJECT, "InputUser", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdf3d36f9),
            new Spec(0xdf3d36f9, "buttonTypeRequestPhone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xdf5ac00c),
            new Spec(0xdf5ac00c, "auth.firebasePnvIntent", new Field[] { new Field("nonce", STRING, "", 0, -1), new Field("digital_credential_payload", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdf77f3bc),
            new Spec(0xdf77f3bc, "account.resetAuthorization", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdfb80317),
            new Spec(0xdfb80317, "channels.channelParticipant", new Field[] { new Field("participant", OBJECT, "ChannelParticipant", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdfdaabe1),
            new Spec(0xdfdaabe1, "inputFileLocation", new Field[] { new Field("volume_id", LONG, "", 0, -1), new Field("local_id", INT, "", 0, -1), new Field("secret", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xdffd50d3),
            new Spec(0xdffd50d3, "payments.assignPlayMarketTransaction", new Field[] { new Field("receipt", OBJECT, "DataJSON", 0, -1), new Field("purpose", OBJECT, "InputStorePaymentPurpose", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe011e1c4),
            new Spec(0xe011e1c4, "account.chatThemesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe021f2f6),
            new Spec(0xe021f2f6, "messages.botResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("gallery", TRUE, "", 1, 0), new Field("query_id", LONG, "", 0, -1), new Field("next_offset", STRING, "", 1, 1), new Field("switch_pm", OBJECT, "InlineBotSwitchPM", 1, 2), new Field("switch_webview", OBJECT, "InlineBotWebView", 1, 3), new Field("results", VECTOR, "BotInlineResult", 0, -1), new Field("cache_time", INT, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe04b5ceb),
            new Spec(0xe04b5ceb, "channelParticipantsMentions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("q", STRING, "", 1, 0), new Field("top_msg_id", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xe062db83),
            new Spec(0xe062db83, "inputMessagesFilterContacts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe06645fa),
            new Spec(0xe06645fa, "payments.getOnrampQuote", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("provider", STRING, "", 0, -1), new Field("crypto_currency", STRING, "", 0, -1), new Field("base_currency", STRING, "", 0, -1), new Field("base_amount", STRING, "", 1, 0), new Field("crypto_amount", STRING, "", 1, 1), new Field("payment_method", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xe0804116),
            new Spec(0xe0804116, "wallPaperNoFile", new Field[] { new Field("id", LONG, "", 0, -1), new Field("flags", FLAGWORD, "", 0, -1), new Field("default", TRUE, "", 1, 1), new Field("dark", TRUE, "", 1, 4), new Field("settings", OBJECT, "WallPaperSettings", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xe085f4ea),
            new Spec(0xe085f4ea, "messages.hideAllChatJoinRequests", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("approved", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("link", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xe089f8f5),
            new Spec(0xe089f8f5, "chatlists.joinChatlistUpdates", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1), new Field("peers", VECTOR, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe095c1a0),
            new Spec(0xe095c1a0, "phoneCallDiscardReasonDisconnect", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe09d5faf),
            new Spec(0xe09d5faf, "account.getSavedMusicIds", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe0b0bc2e),
            new Spec(0xe0b0bc2e, "photoStrippedSize", new Field[] { new Field("type", STRING, "", 0, -1), new Field("bytes", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe0bff26c),
            new Spec(0xe0bff26c, "starGiftAttributeOriginalDetails", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("sender_id", OBJECT, "Peer", 1, 0), new Field("recipient_id", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xe0c0c5e5),
            new Spec(0xe0c0c5e5, "pageTableRow", new Field[] { new Field("cells", VECTOR, "PageTableCell", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe1037f92),
            new Spec(0xe1037f92, "messageActionChatMigrateTo", new Field[] { new Field("channel_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe105e910),
            new Spec(0xe105e910, "messages.deleteQuickReplyMessages", new Field[] { new Field("shortcut_id", INT, "", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe14c4a71),
            new Spec(0xe14c4a71, "photos.uploadContactProfilePhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("suggest", TRUE, "", 1, 3), new Field("save", TRUE, "", 1, 4), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("file", OBJECT, "InputFile", 1, 0), new Field("video", OBJECT, "InputFile", 1, 1), new Field("video_start_ts", DOUBLE, "", 1, 2), new Field("video_emoji_markup", OBJECT, "VideoSize", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xe1664194),
            new Spec(0xe1664194, "contacts.blockedSlice", new Field[] { new Field("count", INT, "", 0, -1), new Field("blocked", VECTOR, "PeerBlocked", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe16b5ce1),
            new Spec(0xe16b5ce1, "account.passkeyRegistrationOptions", new Field[] { new Field("options", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe1732341),
            new Spec(0xe1732341, "inputPrivacyKeyStarGiftsAutoSave", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe175e66f),
            new Spec(0xe175e66f, "payments.giveawayInfoResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("winner", TRUE, "", 1, 0), new Field("refunded", TRUE, "", 1, 1), new Field("start_date", INT, "", 0, -1), new Field("gift_code_slug", STRING, "", 1, 3), new Field("stars_prize", LONG, "", 1, 4), new Field("finish_date", INT, "", 0, -1), new Field("winners_count", INT, "", 0, -1), new Field("activated_count", INT, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xe188503b),
            new Spec(0xe188503b, "messageActionChangeCreator", new Field[] { new Field("new_creator_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe1902288),
            new Spec(0xe1902288, "account.getSavedRingtones", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe1bb0d61),
            new Spec(0xe1bb0d61, "account.emailVerifiedLogin", new Field[] { new Field("email", STRING, "", 0, -1), new Field("sent_code", OBJECT, "auth.SentCode", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe1f867b8),
            new Spec(0xe1f867b8, "chatParticipantCreator", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("rank", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xe2037789),
            new Spec(0xe2037789, "auth.passkeyLoginOptions", new Field[] { new Field("options", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe216eb63),
            new Spec(0xe216eb63, "messageMediaPhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 3), new Field("live_photo", TRUE, "", 1, 4), new Field("photo", OBJECT, "Photo", 1, 0), new Field("ttl_seconds", INT, "", 1, 2), new Field("video", OBJECT, "Document", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xe22045fc),
            new Spec(0xe22045fc, "destroy_session_ok", new Field[] { new Field("session_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe2750328),
            new Spec(0xe2750328, "account.getDefaultProfilePhotoEmojis", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe2de7737),
            new Spec(0xe2de7737, "stories.foundStories", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("count", INT, "", 0, -1), new Field("stories", VECTOR, "FoundStory", 0, -1), new Field("next_offset", STRING, "", 1, 0), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe317af7e),
            new Spec(0xe317af7e, "updatesTooLong", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe31c34d8),
            new Spec(0xe31c34d8, "channelAdminLogEventActionParticipantInvite", new Field[] { new Field("participant", OBJECT, "ChannelParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe320c158),
            new Spec(0xe320c158, "account.getAuthorizations", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe32f3d77),
            new Spec(0xe32f3d77, "updateChatParticipantDelete", new Field[] { new Field("chat_id", LONG, "", 0, -1), new Field("user_id", LONG, "", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe3309f7f),
            new Spec(0xe3309f7f, "help.termsOfServiceUpdateEmpty", new Field[] { new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe34c0dd6),
            new Spec(0xe34c0dd6, "bots.getBotCommands", new Field[] { new Field("scope", OBJECT, "BotCommandScope", 0, -1), new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe3779861),
            new Spec(0xe3779861, "account.resetPasswordFailedWait", new Field[] { new Field("retry_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe3878aa4),
            new Spec(0xe3878aa4, "users.savedMusicNotModified", new Field[] { new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe39460a9),
            new Spec(0xe39460a9, "inputCollectibleUsername", new Field[] { new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe39a8f03),
            new Spec(0xe39a8f03, "account.uploadWallPaper", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("for_chat", TRUE, "", 1, 0), new Field("file", OBJECT, "InputFile", 0, -1), new Field("mime_type", STRING, "", 0, -1), new Field("settings", OBJECT, "WallPaperSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe3ac4c61),
            new Spec(0xe3ac4c61, "bots.checkUsername", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("additional", TRUE, "", 1, 0), new Field("username", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe3af4434),
            new Spec(0xe3af4434, "inputMediaPhoto", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 1), new Field("live_photo", TRUE, "", 1, 2), new Field("id", OBJECT, "InputPhoto", 0, -1), new Field("ttl_seconds", INT, "", 1, 0), new Field("video", OBJECT, "InputDocument", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xe3b7f82c),
            new Spec(0xe3b7f82c, "messages.deleteParticipantReaction", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe40370a3),
            new Spec(0xe40370a3, "updateEditMessage", new Field[] { new Field("message", OBJECT, "Message", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe40ca104),
            new Spec(0xe40ca104, "messages.getCommonChats", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("max_id", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe42ce9c9),
            new Spec(0xe42ce9c9, "account.getUniqueGiftChatThemes", new Field[] { new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe4621141),
            new Spec(0xe4621141, "privacyValueDisallowUsers", new Field[] { new Field("users", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe470bcfd),
            new Spec(0xe470bcfd, "messages.getPeerDialogs", new Field[] { new Field("peers", VECTOR, "InputDialogPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe477092e),
            new Spec(0xe477092e, "profileTabVoice", new Field[] {  }));
    }

    private static void init12() {
        BY_ID.put(Integer.valueOf(0xe47cb579),
            new Spec(0xe47cb579, "messages.togglePeerTranslations", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("disabled", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe4c123d6),
            new Spec(0xe4c123d6, "inputGeoPointEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe4c449fc),
            new Spec(0xe4c449fc, "inputRichMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rtl", TRUE, "", 1, 0), new Field("noautolink", TRUE, "", 1, 1), new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("photos", VECTOR, "InputPhoto", 1, 2), new Field("documents", VECTOR, "InputDocument", 1, 3), new Field("users", VECTOR, "InputUser", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xe4cb9580),
            new Spec(0xe4cb9580, "channels.toggleJoinToSend", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe4e88011),
            new Spec(0xe4e88011, "pageBlockList", new Field[] { new Field("items", VECTOR, "PageListItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe4fca4a3),
            new Spec(0xe4fca4a3, "payments.editConnectedStarRefBot", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoked", TRUE, "", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("link", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe511996d),
            new Spec(0xe511996d, "updateFavedStickers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe519abab),
            new Spec(0xe519abab, "businessGreetingMessage", new Field[] { new Field("shortcut_id", INT, "", 0, -1), new Field("recipients", OBJECT, "BusinessRecipients", 0, -1), new Field("no_activity_days", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe537ced6),
            new Spec(0xe537ced6, "secureValueErrorSelfie", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("file_hash", BYTES, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe56dbf05),
            new Spec(0xe56dbf05, "dialogPeer", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe581e4e9),
            new Spec(0xe581e4e9, "requirementToContactPremium", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe58e95d2),
            new Spec(0xe58e95d2, "messages.deleteMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoke", TRUE, "", 1, 0), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe595186e),
            new Spec(0xe595186e, "walletTransactionPeerOnramp", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("address", STRING, "", 0, -1), new Field("domain", STRING, "", 1, 0), new Field("provider_name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe5afa56d),
            new Spec(0xe5afa56d, "phone.sendGroupCallEncryptedMessage", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("encrypted_message", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe5b17f2b),
            new Spec(0xe5b17f2b, "bots.createBot", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_deeplink", TRUE, "", 1, 0), new Field("name", STRING, "", 0, -1), new Field("username", STRING, "", 0, -1), new Field("manager_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe5bbfe1a),
            new Spec(0xe5bbfe1a, "inputMediaPhotoExternal", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("spoiler", TRUE, "", 1, 1), new Field("url", STRING, "", 0, -1), new Field("ttl_seconds", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xe5bdf8de),
            new Spec(0xe5bdf8de, "updateUserStatus", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("status", OBJECT, "UserStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe5bfffcd),
            new Spec(0xe5bfffcd, "auth.exportAuthorization", new Field[] { new Field("dc_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe5d7d19c),
            new Spec(0xe5d7d19c, "messages.chatFull", new Field[] { new Field("full_chat", OBJECT, "ChatFull", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe5f672fa),
            new Spec(0xe5f672fa, "messages.setBotShippingResults", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("query_id", LONG, "", 0, -1), new Field("error", STRING, "", 1, 0), new Field("shipping_options", VECTOR, "ShippingOption", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xe6213f4d),
            new Spec(0xe6213f4d, "bots.answerWebhookJSONQuery", new Field[] { new Field("query_id", LONG, "", 0, -1), new Field("data", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe630b979),
            new Spec(0xe630b979, "inputWallPaper", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe63fadeb),
            new Spec(0xe63fadeb, "channels.exportMessageLink", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("grouped", TRUE, "", 1, 0), new Field("thread", TRUE, "", 1, 1), new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe64429c0),
            new Spec(0xe64429c0, "channelAdminLogEventActionParticipantUnmute", new Field[] { new Field("participant", OBJECT, "GroupCallParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe66fbf7b),
            new Spec(0xe66fbf7b, "inputMediaDice", new Field[] { new Field("emoticon", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe67f520e),
            new Spec(0xe67f520e, "inputStickerSetDice", new Field[] { new Field("emoticon", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe6a1eeb8),
            new Spec(0xe6a1eeb8, "smsJob", new Field[] { new Field("job_id", STRING, "", 0, -1), new Field("phone_number", STRING, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe6aa647f),
            new Spec(0xe6aa647f, "phone.exportGroupCallInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("can_self_unmute", TRUE, "", 1, 0), new Field("call", OBJECT, "InputGroupCall", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe6d0ef01),
            new Spec(0xe6d0ef01, "wallet.secretPhraseParts", new Field[] { new Field("token", STRING, "", 0, -1), new Field("dcs", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe6d83d7e),
            new Spec(0xe6d83d7e, "channelAdminLogEventActionParticipantToggleBan", new Field[] { new Field("prev_participant", OBJECT, "ChannelParticipant", 0, -1), new Field("new_participant", OBJECT, "ChannelParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe6df7378),
            new Spec(0xe6df7378, "messages.startBot", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("start_param", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe6dfb825),
            new Spec(0xe6dfb825, "channelAdminLogEventActionChangeTitle", new Field[] { new Field("prev_value", STRING, "", 0, -1), new Field("new_value", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe7026d0d),
            new Spec(0xe7026d0d, "inputMessagesFilterGeo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe7058e7f),
            new Spec(0xe7058e7f, "postInteractionCountersMessage", new Field[] { new Field("msg_id", INT, "", 0, -1), new Field("views", INT, "", 0, -1), new Field("forwards", INT, "", 0, -1), new Field("reactions", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe71a4810),
            new Spec(0xe71a4810, "bots.setJoinChatResults", new Field[] { new Field("query_id", LONG, "", 0, -1), new Field("result", OBJECT, "JoinChatBotResult", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe7512126),
            new Spec(0xe7512126, "destroy_session", new Field[] { new Field("session_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe785a43f),
            new Spec(0xe785a43f, "channels.getSendAs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("for_paid_reactions", TRUE, "", 1, 0), new Field("for_live_stories", TRUE, "", 1, 1), new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe7e82e12),
            new Spec(0xe7e82e12, "pendingSuggestion", new Field[] { new Field("suggestion", STRING, "", 0, -1), new Field("title", OBJECT, "TextWithEntities", 0, -1), new Field("description", OBJECT, "TextWithEntities", 0, -1), new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe7ff068a),
            new Spec(0xe7ff068a, "emojiStatus", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("document_id", LONG, "", 0, -1), new Field("until", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xe8025ca2),
            new Spec(0xe8025ca2, "messages.savedGifsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe822649d),
            new Spec(0xe822649d, "messages.getGameHighScores", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe844ebff),
            new Spec(0xe844ebff, "messages.searchCounter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inexact", TRUE, "", 1, 1), new Field("filter", OBJECT, "MessagesFilter", 0, -1), new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe8625e92),
            new Spec(0xe8625e92, "inputInvoiceStarGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hide_name", TRUE, "", 1, 0), new Field("include_upgrade", TRUE, "", 1, 2), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("gift_id", LONG, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xe86602c3),
            new Spec(0xe86602c3, "messages.allStickersNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe87acbc0),
            new Spec(0xe87acbc0, "foundStory", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("story", OBJECT, "StoryItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe882a9e1),
            new Spec(0xe882a9e1, "ephemeral.deleteWelcomeMessage", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe894ad4d),
            new Spec(0xe894ad4d, "auth.acceptLoginToken", new Field[] { new Field("token", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe89c45b2),
            new Spec(0xe89c45b2, "webPage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_large_media", TRUE, "", 1, 13), new Field("video_cover_photo", TRUE, "", 1, 14), new Field("id", LONG, "", 0, -1), new Field("url", STRING, "", 0, -1), new Field("display_url", STRING, "", 0, -1), new Field("hash", INT, "", 0, -1), new Field("type", STRING, "", 1, 0), new Field("site_name", STRING, "", 1, 1), new Field("title", STRING, "", 1, 2), new Field("description", STRING, "", 1, 3), new Field("photo", OBJECT, "Photo", 1, 4), new Field("embed_url", STRING, "", 1, 5), new Field("embed_type", STRING, "", 1, 5), new Field("embed_width", INT, "", 1, 6), new Field("embed_height", INT, "", 1, 6), new Field("duration", INT, "", 1, 7), new Field("author", STRING, "", 1, 8), new Field("document", OBJECT, "Document", 1, 9), new Field("cached_page", OBJECT, "Page", 1, 10), new Field("attributes", VECTOR, "WebPageAttribute", 1, 12) }));
        BY_ID.put(Integer.valueOf(0xe8a40bd9),
            new Spec(0xe8a40bd9, "secureValueErrorData", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("data_hash", BYTES, "", 0, -1), new Field("field", STRING, "", 0, -1), new Field("text", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe8a775b0),
            new Spec(0xe8a775b0, "bots.botInfo", new Field[] { new Field("name", STRING, "", 0, -1), new Field("about", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe8fd8014),
            new Spec(0xe8fd8014, "peerBlocked", new Field[] { new Field("peer_id", OBJECT, "Peer", 0, -1), new Field("date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe90ebb59),
            new Spec(0xe90ebb59, "channelAdminLogEventActionExportedInviteEdit", new Field[] { new Field("prev_invite", OBJECT, "ExportedChatInvite", 0, -1), new Field("new_invite", OBJECT, "ExportedChatInvite", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe926d63e),
            new Spec(0xe926d63e, "account.resetPasswordOk", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe92fd902),
            new Spec(0xe92fd902, "starsTransactionPeerFragment", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xe94f0f86),
            new Spec(0xe94f0f86, "inputPrivacyValueDisallowChatParticipants", new Field[] { new Field("chats", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe9763aec),
            new Spec(0xe9763aec, "sendMessageUploadVideoAction", new Field[] { new Field("progress", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe9b0c658),
            new Spec(0xe9b0c658, "inputInvoiceStarGiftResale", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("ton", TRUE, "", 1, 0), new Field("show_name", TRUE, "", 1, 2), new Field("slug", STRING, "", 0, -1), new Field("to_id", OBJECT, "InputPeer", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xe9baa668),
            new Spec(0xe9baa668, "folderPeer", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("folder_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe9ce781c),
            new Spec(0xe9ce781c, "payments.resolveStarGiftOffer", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("decline", TRUE, "", 1, 0), new Field("offer_msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe9e82c18),
            new Spec(0xe9e82c18, "channelAdminLogEventActionUpdatePinned", new Field[] { new Field("message", OBJECT, "Message", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xe9effc7d),
            new Spec(0xe9effc7d, "account.resetPasswordRequestedWait", new Field[] { new Field("until_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xea02c27e),
            new Spec(0xea02c27e, "paymentCharge", new Field[] { new Field("id", STRING, "", 0, -1), new Field("provider_charge_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xea02ec33),
            new Spec(0xea02ec33, "secureValueTypeTemporaryRegistration", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xea107ae4),
            new Spec(0xea107ae4, "channelAdminLogEventsFilter", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("join", TRUE, "", 1, 0), new Field("leave", TRUE, "", 1, 1), new Field("invite", TRUE, "", 1, 2), new Field("ban", TRUE, "", 1, 3), new Field("unban", TRUE, "", 1, 4), new Field("kick", TRUE, "", 1, 5), new Field("unkick", TRUE, "", 1, 6), new Field("promote", TRUE, "", 1, 7), new Field("demote", TRUE, "", 1, 8), new Field("info", TRUE, "", 1, 9), new Field("settings", TRUE, "", 1, 10), new Field("pinned", TRUE, "", 1, 11), new Field("edit", TRUE, "", 1, 12), new Field("delete", TRUE, "", 1, 13), new Field("group_call", TRUE, "", 1, 14), new Field("invites", TRUE, "", 1, 15), new Field("send", TRUE, "", 1, 16), new Field("forums", TRUE, "", 1, 17), new Field("sub_extend", TRUE, "", 1, 18), new Field("edit_rank", TRUE, "", 1, 19) }));
        BY_ID.put(Integer.valueOf(0xea109b13),
            new Spec(0xea109b13, "destroy_auth_key_fail", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xea1f0c52),
            new Spec(0xea1f0c52, "account.getPasskeys", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xea2c31d3),
            new Spec(0xea2c31d3, "messageActionStarGift", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("name_hidden", TRUE, "", 1, 0), new Field("saved", TRUE, "", 1, 2), new Field("converted", TRUE, "", 1, 3), new Field("upgraded", TRUE, "", 1, 5), new Field("refunded", TRUE, "", 1, 9), new Field("can_upgrade", TRUE, "", 1, 10), new Field("prepaid_upgrade", TRUE, "", 1, 13), new Field("upgrade_separate", TRUE, "", 1, 16), new Field("auction_acquired", TRUE, "", 1, 17), new Field("gift", OBJECT, "StarGift", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1), new Field("convert_stars", LONG, "", 1, 4), new Field("upgrade_msg_id", INT, "", 1, 5), new Field("upgrade_stars", LONG, "", 1, 8), new Field("from_id", OBJECT, "Peer", 1, 11), new Field("peer", OBJECT, "Peer", 1, 12), new Field("saved_id", LONG, "", 1, 12), new Field("prepaid_upgrade_hash", STRING, "", 1, 14), new Field("gift_msg_id", INT, "", 1, 15), new Field("to_id", OBJECT, "Peer", 1, 18), new Field("gift_num", INT, "", 1, 19) }));
        BY_ID.put(Integer.valueOf(0xea32b4b1),
            new Spec(0xea32b4b1, "contacts.sponsoredPeersEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xea3948e9),
            new Spec(0xea3948e9, "messageActionChannelMigrateFrom", new Field[] { new Field("title", STRING, "", 0, -1), new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xea8ca4f9),
            new Spec(0xea8ca4f9, "channels.setStickers", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeab5dc38),
            new Spec(0xeab5dc38, "channels.readMessageContents", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeabbb94c),
            new Spec(0xeabbb94c, "channels.togglePreHistoryHidden", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeae87e42),
            new Spec(0xeae87e42, "contacts.contacts", new Field[] { new Field("contacts", VECTOR, "Contact", 0, -1), new Field("saved_count", INT, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeafc32bc),
            new Spec(0xeafc32bc, "chatReactionsNone", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xeafdf716),
            new Spec(0xeafdf716, "messages.reactions", new Field[] { new Field("hash", LONG, "", 0, -1), new Field("reactions", VECTOR, "Reaction", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeb032884),
            new Spec(0xeb032884, "contacts.sponsoredPeers", new Field[] { new Field("peers", VECTOR, "SponsoredPeer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeb2b4cf6),
            new Spec(0xeb2b4cf6, "account.getGlobalPrivacySettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xeb49081d),
            new Spec(0xeb49081d, "recentMeUrlChatInvite", new Field[] { new Field("url", STRING, "", 0, -1), new Field("chat_invite", OBJECT, "ChatInvite", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeb50adf5),
            new Spec(0xeb50adf5, "messages.botApp", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("inactive", TRUE, "", 1, 0), new Field("request_write_access", TRUE, "", 1, 1), new Field("has_settings", TRUE, "", 1, 2), new Field("app", OBJECT, "BotApp", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeb983f8f),
            new Spec(0xeb983f8f, "payments.checkedGiftCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_giveaway", TRUE, "", 1, 2), new Field("from_id", OBJECT, "Peer", 1, 4), new Field("giveaway_msg_id", INT, "", 1, 3), new Field("to_id", LONG, "", 1, 0), new Field("date", INT, "", 0, -1), new Field("days", INT, "", 0, -1), new Field("used_date", INT, "", 1, 1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xebbca3cb),
            new Spec(0xebbca3cb, "messageActionChatJoinedByRequest", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xebe07752),
            new Spec(0xebe07752, "updatePeerBlocked", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("blocked", TRUE, "", 1, 0), new Field("blocked_my_stories_from", TRUE, "", 1, 1), new Field("peer_id", OBJECT, "Peer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xebe46819),
            new Spec(0xebe46819, "updateServiceNotification", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("popup", TRUE, "", 1, 0), new Field("invert_media", TRUE, "", 1, 2), new Field("inbox_date", INT, "", 1, 1), new Field("type", STRING, "", 0, -1), new Field("message", STRING, "", 0, -1), new Field("media", OBJECT, "MessageMedia", 0, -1), new Field("entities", VECTOR, "MessageEntity", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xec05b097),
            new Spec(0xec05b097, "updateAutoSaveSettings", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xec22cfcd),
            new Spec(0xec22cfcd, "help.setBotUpdatesStatus", new Field[] { new Field("pending_updates_count", INT, "", 0, -1), new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xec43a2d1),
            new Spec(0xec43a2d1, "account.businessChatLinks", new Field[] { new Field("links", VECTOR, "BusinessChatLink", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xec82e140),
            new Spec(0xec82e140, "phone.phoneCall", new Field[] { new Field("phone_call", OBJECT, "PhoneCall", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xec86017a),
            new Spec(0xec86017a, "account.registerDevice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_muted", TRUE, "", 1, 0), new Field("token_type", INT, "", 0, -1), new Field("token", STRING, "", 0, -1), new Field("app_sandbox", BOOL, "", 0, -1), new Field("secret", BYTES, "", 0, -1), new Field("other_uids", VECTOR, "LONG", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeca4f8d4),
            new Spec(0xeca4f8d4, "inlineButtonTypeUrl", new Field[] { new Field("url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xece2a0e6),
            new Spec(0xece2a0e6, "channels.getMessageAuthor", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xece9814b),
            new Spec(0xece9814b, "privacyValueAllowPremium", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xed107ab7),
            new Spec(0xed107ab7, "chatInvitePublicJoinRequests", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xed18c118),
            new Spec(0xed18c118, "encryptedMessage", new Field[] { new Field("random_id", LONG, "", 0, -1), new Field("chat_id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("bytes", BYTES, "", 0, -1), new Field("file", OBJECT, "EncryptedFile", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xed1ecdb0),
            new Spec(0xed1ecdb0, "secureValueHash", new Field[] { new Field("type", OBJECT, "SecureValueType", 0, -1), new Field("hash", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xed56c9fc),
            new Spec(0xed56c9fc, "account.webAuthorizations", new Field[] { new Field("authorizations", VECTOR, "WebAuthorization", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xed6a8504),
            new Spec(0xed6a8504, "textSubscript", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xed85eab5),
            new Spec(0xed85eab5, "updatePinnedMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 0), new Field("peer", OBJECT, "Peer", 0, -1), new Field("messages", VECTOR, "INT", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xed8af74d),
            new Spec(0xed8af74d, "channels.adminLogResults", new Field[] { new Field("events", VECTOR, "ChannelAdminLogEvent", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xed9f30c5),
            new Spec(0xed9f30c5, "bots.updateUserEmojiStatus", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("emoji_status", OBJECT, "EmojiStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeda3e33b),
            new Spec(0xeda3e33b, "messages.getPollResults", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("poll_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedab447b),
            new Spec(0xedab447b, "bad_server_salt", new Field[] { new Field("bad_msg_id", LONG, "", 0, -1), new Field("bad_msg_seqno", INT, "", 0, -1), new Field("error_code", INT, "", 0, -1), new Field("new_server_salt", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedb93949),
            new Spec(0xedb93949, "userStatusOnline", new Field[] { new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedbe6ccb),
            new Spec(0xedbe6ccb, "payments.updateStarGiftPrice", new Field[] { new Field("stargift", OBJECT, "InputSavedStarGift", 0, -1), new Field("resell_amount", OBJECT, "StarsAmount", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedcdc05b),
            new Spec(0xedcdc05b, "topPeer", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("rating", DOUBLE, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedd4882a),
            new Spec(0xedd4882a, "updates.getState", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xedd49ef0),
            new Spec(0xedd49ef0, "channels.toggleSlowMode", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("seconds", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedf3add0),
            new Spec(0xedf3add0, "publicForwardStory", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("story", OBJECT, "StoryItem", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xedfc111e),
            new Spec(0xedfc111e, "updateDraftMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("saved_peer_id", OBJECT, "Peer", 1, 1), new Field("draft", OBJECT, "DraftMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xee3b272a),
            new Spec(0xee3b272a, "updatePrivacy", new Field[] { new Field("key", OBJECT, "PrivacyKey", 0, -1), new Field("rules", VECTOR, "PrivacyRule", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xee430c85),
            new Spec(0xee430c85, "groupCallDonor", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("top", TRUE, "", 1, 0), new Field("my", TRUE, "", 1, 1), new Field("peer_id", OBJECT, "Peer", 1, 3), new Field("stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xee479c64),
            new Spec(0xee479c64, "messageExtendedMedia", new Field[] { new Field("media", OBJECT, "MessageMedia", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xee72f79a),
            new Spec(0xee72f79a, "help.acceptTermsOfService", new Field[] { new Field("id", OBJECT, "DataJSON", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xee7a1596),
            new Spec(0xee7a1596, "messageActionSuggestedPostApproval", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("rejected", TRUE, "", 1, 0), new Field("balance_too_low", TRUE, "", 1, 1), new Field("reject_comment", STRING, "", 1, 2), new Field("schedule_date", INT, "", 1, 3), new Field("price", OBJECT, "StarsAmount", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xee8c1e86),
            new Spec(0xee8c1e86, "inputChannelEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xee9f88a6),
            new Spec(0xee9f88a6, "phone.getGroupCallChainBlocks", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("sub_chain_id", INT, "", 0, -1), new Field("offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeea8e46e),
            new Spec(0xeea8e46e, "upload.cdnFileReuploadNeeded", new Field[] { new Field("request_token", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xeeb0d625),
            new Spec(0xeeb0d625, "stories.getAllStories", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("next", TRUE, "", 1, 1), new Field("hidden", TRUE, "", 1, 2), new Field("state", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xeeca5ce3),
            new Spec(0xeeca5ce3, "langPackLanguage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("official", TRUE, "", 1, 0), new Field("rtl", TRUE, "", 1, 2), new Field("beta", TRUE, "", 1, 3), new Field("name", STRING, "", 0, -1), new Field("native_name", STRING, "", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("base_lang_code", STRING, "", 1, 1), new Field("plural_code", STRING, "", 0, -1), new Field("strings_count", INT, "", 0, -1), new Field("translated_count", INT, "", 0, -1), new Field("translations_url", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xef156a5c),
            new Spec(0xef156a5c, "businessAwayMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("offline_only", TRUE, "", 1, 0), new Field("shortcut_id", INT, "", 0, -1), new Field("schedule", OBJECT, "BusinessAwayMessageSchedule", 0, -1), new Field("recipients", OBJECT, "BusinessRecipients", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xef1751b5),
            new Spec(0xef1751b5, "pageBlockChannel", new Field[] { new Field("channel", OBJECT, "Chat", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xef500eab),
            new Spec(0xef500eab, "account.reorderUsernames", new Field[] { new Field("order", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xef7c213a),
            new Spec(0xef7c213a, "phone.getGroupCallJoinAs", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xef7ff916),
            new Spec(0xef7ff916, "stats.megagroupStats", new Field[] { new Field("period", OBJECT, "StatsDateRangeDays", 0, -1), new Field("members", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("messages", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("viewers", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("posters", OBJECT, "StatsAbsValueAndPrev", 0, -1), new Field("growth_graph", OBJECT, "StatsGraph", 0, -1), new Field("members_graph", OBJECT, "StatsGraph", 0, -1), new Field("new_members_by_source_graph", OBJECT, "StatsGraph", 0, -1), new Field("languages_graph", OBJECT, "StatsGraph", 0, -1), new Field("messages_graph", OBJECT, "StatsGraph", 0, -1), new Field("actions_graph", OBJECT, "StatsGraph", 0, -1), new Field("top_hours_graph", OBJECT, "StatsGraph", 0, -1), new Field("weekdays_graph", OBJECT, "StatsGraph", 0, -1), new Field("top_posters", VECTOR, "StatsGroupTopPoster", 0, -1), new Field("top_admins", VECTOR, "StatsGroupTopAdmin", 0, -1), new Field("top_inviters", VECTOR, "StatsGroupTopInviter", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xef8d3e6c),
            new Spec(0xef8d3e6c, "messages.affectedFoundMessages", new Field[] { new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1), new Field("offset", INT, "", 0, -1), new Field("messages", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xefb2b617),
            new Spec(0xefb2b617, "groupCall", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("join_muted", TRUE, "", 1, 1), new Field("can_change_join_muted", TRUE, "", 1, 2), new Field("join_date_asc", TRUE, "", 1, 6), new Field("schedule_start_subscribed", TRUE, "", 1, 8), new Field("can_start_video", TRUE, "", 1, 9), new Field("record_video_active", TRUE, "", 1, 11), new Field("rtmp_stream", TRUE, "", 1, 12), new Field("listeners_hidden", TRUE, "", 1, 13), new Field("conference", TRUE, "", 1, 14), new Field("creator", TRUE, "", 1, 15), new Field("messages_enabled", TRUE, "", 1, 17), new Field("can_change_messages_enabled", TRUE, "", 1, 18), new Field("min", TRUE, "", 1, 19), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("participants_count", INT, "", 0, -1), new Field("title", STRING, "", 1, 3), new Field("stream_dc_id", INT, "", 1, 4), new Field("record_start_date", INT, "", 1, 5), new Field("schedule_date", INT, "", 1, 7), new Field("unmuted_video_count", INT, "", 1, 10), new Field("unmuted_video_limit", INT, "", 0, -1), new Field("version", INT, "", 0, -1), new Field("invite_link", STRING, "", 1, 16), new Field("send_paid_messages_stars", LONG, "", 1, 20), new Field("default_send_as", OBJECT, "Peer", 1, 21) }));
        BY_ID.put(Integer.valueOf(0xefd48c89),
            new Spec(0xefd48c89, "messages.getDialogFilters", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xefd9a6a2),
            new Spec(0xefd9a6a2, "messages.getPeerSettings", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xefea3803),
            new Spec(0xefea3803, "langpack.getStrings", new Field[] { new Field("lang_pack", STRING, "", 0, -1), new Field("lang_code", STRING, "", 0, -1), new Field("keys", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf0173fe9),
            new Spec(0xf0173fe9, "channels.channelParticipantsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf041e250),
            new Spec(0xf041e250, "chatOnlines", new Field[] { new Field("onlines", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf04fb3a9),
            new Spec(0xf04fb3a9, "channelAdminLogEventActionChangeUsernames", new Field[] { new Field("prev_value", VECTOR, "STRING", 0, -1), new Field("new_value", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf06fe208),
            new Spec(0xf06fe208, "channelAdminLogEventActionEditTopic", new Field[] { new Field("prev_topic", OBJECT, "ForumTopic", 0, -1), new Field("new_topic", OBJECT, "ForumTopic", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf08d516b),
            new Spec(0xf08d516b, "starGiftAttributeRarityRare", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf0d3e6a8),
            new Spec(0xf0d3e6a8, "channels.updateEmojiStatus", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("emoji_status", OBJECT, "EmojiStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf0e3e596),
            new Spec(0xf0e3e596, "messages.dialogsNotModified", new Field[] { new Field("count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf0e4e0b6),
            new Spec(0xf0e4e0b6, "reportResultChooseOption", new Field[] { new Field("title", STRING, "", 0, -1), new Field("options", VECTOR, "MessageReportOption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf101aa7f),
            new Spec(0xf101aa7f, "inputSavedStarGiftChat", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("saved_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf107e790),
            new Spec(0xf107e790, "messages.getUnreadMentions", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("top_msg_id", INT, "", 1, 0), new Field("offset_id", INT, "", 0, -1), new Field("add_offset", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("max_id", INT, "", 0, -1), new Field("min_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf10ece2f),
            new Spec(0xf10ece2f, "chatlists.chatlistInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("title_noanimate", TRUE, "", 1, 1), new Field("title", OBJECT, "TextWithEntities", 0, -1), new Field("emoticon", STRING, "", 1, 0), new Field("peers", VECTOR, "Peer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf128c708),
            new Spec(0xf128c708, "phone.toggleGroupCallRecord", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("start", TRUE, "", 1, 0), new Field("video", TRUE, "", 1, 2), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("title", STRING, "", 1, 1), new Field("video_portrait", BOOL, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xf12bb6e1),
            new Spec(0xf12bb6e1, "pageBlockSubheader", new Field[] { new Field("text", OBJECT, "RichText", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf12e57c9),
            new Spec(0xf12e57c9, "channels.editPhoto", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("photo", OBJECT, "InputChatPhoto", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf132e3ef),
            new Spec(0xf132e3ef, "bots.allowSendMessage", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf13bbcd7),
            new Spec(0xf13bbcd7, "bots.requestedButton", new Field[] { new Field("webapp_req_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf141b5e1),
            new Spec(0xf141b5e1, "inputEncryptedChat", new Field[] { new Field("chat_id", INT, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf146d31f),
            new Spec(0xf146d31f, "attachMenuPeerTypePM", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf16269d4),
            new Spec(0xf16269d4, "updateSmsJob", new Field[] { new Field("job_id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf1749a22),
            new Spec(0xf1749a22, "messages.stickersNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf18cda44),
            new Spec(0xf18cda44, "upload.fileCdnRedirect", new Field[] { new Field("dc_id", INT, "", 0, -1), new Field("file_token", BYTES, "", 0, -1), new Field("encryption_key", BYTES, "", 0, -1), new Field("encryption_iv", BYTES, "", 0, -1), new Field("file_hashes", VECTOR, "FileHash", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf1ccaaac),
            new Spec(0xf1ccaaac, "messageEntityBlockquote", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("collapsed", TRUE, "", 1, 0), new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf1d0fbd3),
            new Spec(0xf1d0fbd3, "messages.checkQuickReplyShortcut", new Field[] { new Field("shortcut", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf1d628ec),
            new Spec(0xf1d628ec, "aiComposeToneExample", new Field[] { new Field("from", OBJECT, "TextWithEntities", 0, -1), new Field("to", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf1d88a5c),
            new Spec(0xf1d88a5c, "attachMenuBotsNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf21158c6),
            new Spec(0xf21158c6, "inputUser", new Field[] { new Field("user_id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf21f7f2f),
            new Spec(0xf21f7f2f, "messages.savePreparedInlineMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("result", OBJECT, "InputBotInlineResult", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("peer_types", VECTOR, "InlineQueryPeerType", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xf226ac08),
            new Spec(0xf226ac08, "updateChannelMessageViews", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("id", INT, "", 0, -1), new Field("views", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf257106c),
            new Spec(0xf257106c, "account.saveTheme", new Field[] { new Field("theme", OBJECT, "InputTheme", 0, -1), new Field("unsave", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf259a80b),
            new Spec(0xf259a80b, "pageBlockEmbedPost", new Field[] { new Field("url", STRING, "", 0, -1), new Field("webpage_id", LONG, "", 0, -1), new Field("author_photo_id", LONG, "", 0, -1), new Field("author", STRING, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("blocks", VECTOR, "PageBlock", 0, -1), new Field("caption", OBJECT, "PageCaption", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf2a71983),
            new Spec(0xf2a71983, "updateDeleteScheduledMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("messages", VECTOR, "INT", 0, -1), new Field("sent_messages", VECTOR, "INT", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xf2c4f24d),
            new Spec(0xf2c4f24d, "channels.searchPosts", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("hashtag", STRING, "", 1, 0), new Field("query", STRING, "", 1, 1), new Field("offset_rate", INT, "", 0, -1), new Field("offset_peer", OBJECT, "InputPeer", 0, -1), new Field("offset_id", INT, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("allow_paid_stars", LONG, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xf2ebdb4e),
            new Spec(0xf2ebdb4e, "updateGroupCallParticipants", new Field[] { new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("participants", VECTOR, "GroupCallParticipant", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf2ecef23),
            new Spec(0xf2ecef23, "chatAdminWithInvites", new Field[] { new Field("admin_id", LONG, "", 0, -1), new Field("invites_count", INT, "", 0, -1), new Field("revoked_invites_count", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf2f2330a),
            new Spec(0xf2f2330a, "langpack.getLangPack", new Field[] { new Field("lang_pack", STRING, "", 0, -1), new Field("lang_code", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf3427b8c),
            new Spec(0xf3427b8c, "ping_delay_disconnect", new Field[] { new Field("ping_id", LONG, "", 0, -1), new Field("disconnect_delay", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf351d7ab),
            new Spec(0xf351d7ab, "sendMessageUploadAudioAction", new Field[] { new Field("progress", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf35aec28),
            new Spec(0xf35aec28, "inputChannel", new Field[] { new Field("channel_id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf385c1f6),
            new Spec(0xf385c1f6, "langPackDifference", new Field[] { new Field("lang_code", STRING, "", 0, -1), new Field("from_version", INT, "", 0, -1), new Field("version", INT, "", 0, -1), new Field("strings", VECTOR, "LangPackString", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf393aea0),
            new Spec(0xf393aea0, "messages.discardEncryption", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("delete_history", TRUE, "", 1, 0), new Field("chat_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf39b035c),
            new Spec(0xf39b035c, "fileHash", new Field[] { new Field("offset", LONG, "", 0, -1), new Field("limit", INT, "", 0, -1), new Field("hash", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf3a9244a),
            new Spec(0xf3a9244a, "inputMediaStakeDice", new Field[] { new Field("game_hash", STRING, "", 0, -1), new Field("ton_amount", LONG, "", 0, -1), new Field("client_seed", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf3ae2eed),
            new Spec(0xf3ae2eed, "help.userInfoEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf3e0da33),
            new Spec(0xf3e0da33, "inputChatlistDialogFilter", new Field[] { new Field("filter_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf3ed4c73),
            new Spec(0xf3ed4c73, "account.acceptAuthorization", new Field[] { new Field("bot_id", LONG, "", 0, -1), new Field("scope", STRING, "", 0, -1), new Field("public_key", STRING, "", 0, -1), new Field("value_hashes", VECTOR, "SecureValueHash", 0, -1), new Field("credentials", OBJECT, "SecureCredentialsEncrypted", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf3f25f76),
            new Spec(0xf3f25f76, "messageActionContactSignUp", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf41eb622),
            new Spec(0xf41eb622, "account.themesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf4239425),
            new Spec(0xf4239425, "payments.getGiveawayInfo", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf44a8315),
            new Spec(0xf44a8315, "channels.reportSpam", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf450f59b),
            new Spec(0xf450f59b, "auth.sentCodeTypeEmailCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("apple_signin_allowed", TRUE, "", 1, 0), new Field("google_signin_allowed", TRUE, "", 1, 1), new Field("email_pattern", STRING, "", 0, -1), new Field("length", INT, "", 0, -1), new Field("reset_available_period", INT, "", 1, 3), new Field("reset_pending_date", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xf46fe924),
            new Spec(0xf46fe924, "inputWebFileAudioAlbumThumbLocation", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("small", TRUE, "", 1, 2), new Field("document", OBJECT, "InputDocument", 1, 0), new Field("title", STRING, "", 1, 1), new Field("performer", STRING, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xf47741f7),
            new Spec(0xf47741f7, "peerSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("report_spam", TRUE, "", 1, 0), new Field("add_contact", TRUE, "", 1, 1), new Field("block_contact", TRUE, "", 1, 2), new Field("share_contact", TRUE, "", 1, 3), new Field("need_contacts_exception", TRUE, "", 1, 4), new Field("report_geo", TRUE, "", 1, 5), new Field("autoarchived", TRUE, "", 1, 7), new Field("invite_members", TRUE, "", 1, 8), new Field("request_chat_broadcast", TRUE, "", 1, 10), new Field("business_bot_paused", TRUE, "", 1, 11), new Field("business_bot_can_reply", TRUE, "", 1, 12), new Field("geo_distance", INT, "", 1, 6), new Field("request_chat_title", STRING, "", 1, 9), new Field("request_chat_date", INT, "", 1, 9), new Field("business_bot_id", LONG, "", 1, 13), new Field("business_bot_manage_url", STRING, "", 1, 13), new Field("charge_paid_message_stars", LONG, "", 1, 14), new Field("registration_month", STRING, "", 1, 15), new Field("phone_country", STRING, "", 1, 16), new Field("name_change_date", INT, "", 1, 17), new Field("photo_change_date", INT, "", 1, 18) }));
        BY_ID.put(Integer.valueOf(0xf47751b6),
            new Spec(0xf47751b6, "phone.groupParticipants", new Field[] { new Field("count", INT, "", 0, -1), new Field("participants", VECTOR, "GroupCallParticipant", 0, -1), new Field("next_offset", STRING, "", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1), new Field("version", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf4946757),
            new Spec(0xf4946757, "bots.setCustomVerification", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("enabled", TRUE, "", 1, 1), new Field("bot", OBJECT, "InputUser", 1, 0), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("custom_description", OBJECT, "TextWithEntities", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xf496b0c6),
            new Spec(0xf496b0c6, "channels.sendAsPeers", new Field[] { new Field("peers", VECTOR, "SendAsPeer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf4997e42),
            new Spec(0xf4997e42, "inputInvoiceBusinessBotTransferStars", new Field[] { new Field("bot", OBJECT, "InputUser", 0, -1), new Field("stars", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf5045f1f),
            new Spec(0xf5045f1f, "set_client_DH_params", new Field[] { new Field("nonce", INT128, "", 0, -1), new Field("server_nonce", INT128, "", 0, -1), new Field("encrypted_data", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf50dbaa1),
            new Spec(0xf50dbaa1, "help.dismissSuggestion", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("suggestion", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf516760b),
            new Spec(0xf516760b, "messages.getScheduledHistory", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf5235d55),
            new Spec(0xf5235d55, "inputEncryptedFileLocation", new Field[] { new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf52ff27f),
            new Spec(0xf52ff27f, "inputFile", new Field[] { new Field("id", LONG, "", 0, -1), new Field("parts", INT, "", 0, -1), new Field("name", STRING, "", 0, -1), new Field("md5_checksum", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf53925cf),
            new Spec(0xf53925cf, "wallet.fetchEncryptedSecretPhrasePart", new Field[] { new Field("token", STRING, "", 0, -1), new Field("public_key", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf53da717),
            new Spec(0xf53da717, "updateNewQuickReply", new Field[] { new Field("quick_reply", OBJECT, "QuickReply", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf5537ebc),
            new Spec(0xf5537ebc, "stickers.changeSticker", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("sticker", OBJECT, "InputDocument", 0, -1), new Field("emoji", STRING, "", 1, 0), new Field("mask_coords", OBJECT, "MaskCoords", 1, 1), new Field("keywords", STRING, "", 1, 2) }));
        BY_ID.put(Integer.valueOf(0xf568028a),
            new Spec(0xf568028a, "bankCardOpenUrl", new Field[] { new Field("url", STRING, "", 0, -1), new Field("name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf5890df1),
            new Spec(0xf5890df1, "inputThemeSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf5b5563f),
            new Spec(0xf5b5563f, "account.deletePasskey", new Field[] { new Field("id", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf5dad378),
            new Spec(0xf5dad378, "channels.getGroupsForDiscussion", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf5ddd6e7),
            new Spec(0xf5ddd6e7, "inputReportReasonFake", new Field[] {  }));
    }

    private static void init13() {
        BY_ID.put(Integer.valueOf(0xf64daf43),
            new Spec(0xf64daf43, "messages.requestEncryption", new Field[] { new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("random_id", INT, "", 0, -1), new Field("g_a", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf64f54f7),
            new Spec(0xf64f54f7, "phone.deleteGroupCallMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("report_spam", TRUE, "", 1, 0), new Field("call", OBJECT, "InputGroupCall", 0, -1), new Field("messages", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf660e1d4),
            new Spec(0xf660e1d4, "destroy_auth_key_ok", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf6a548d3),
            new Spec(0xf6a548d3, "messageMediaInvoice", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("shipping_address_requested", TRUE, "", 1, 1), new Field("test", TRUE, "", 1, 3), new Field("title", STRING, "", 0, -1), new Field("description", STRING, "", 0, -1), new Field("photo", OBJECT, "WebDocument", 1, 0), new Field("receipt_msg_id", INT, "", 1, 2), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("start_param", STRING, "", 0, -1), new Field("extended_media", OBJECT, "MessageExtendedMedia", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xf6a5f82f),
            new Spec(0xf6a5f82f, "privacyValueDisallowBots", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf6e26854),
            new Spec(0xf6e26854, "payments.applyGiftCode", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf72e0ed9),
            new Spec(0xf72e0ed9, "botVerification", new Field[] { new Field("bot_id", LONG, "", 0, -1), new Field("icon", LONG, "", 0, -1), new Field("description", OBJECT, "TextWithEntities", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf731a9f4),
            new Spec(0xf731a9f4, "messages.readDiscussion", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("read_max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf743b857),
            new Spec(0xf743b857, "messages.editChatCreator", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("user_id", OBJECT, "InputUser", 0, -1), new Field("password", OBJECT, "InputCheckPasswordSRP", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf7444763),
            new Spec(0xf7444763, "jsonArray", new Field[] { new Field("value", VECTOR, "JSONValue", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf74e932b),
            new Spec(0xf74e932b, "updateReadStories", new Field[] { new Field("peer", OBJECT, "Peer", 0, -1), new Field("max_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf7760f51),
            new Spec(0xf7760f51, "stickers.removeStickerFromSet", new Field[] { new Field("sticker", OBJECT, "InputDocument", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf78a0973),
            new Spec(0xf78a0973, "dialogCommunity", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 2), new Field("community_id", LONG, "", 0, -1), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf7c1b13f),
            new Spec(0xf7c1b13f, "inputUserSelf", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf7e8d89b),
            new Spec(0xf7e8d89b, "privacyValueAllowCloseFriends", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf8227181),
            new Spec(0xf8227181, "updateReadMessagesContents", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("messages", VECTOR, "INT", 0, -1), new Field("pts", INT, "", 0, -1), new Field("pts_count", INT, "", 0, -1), new Field("date", INT, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xf831a20f),
            new Spec(0xf831a20f, "contacts.acceptContact", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf836aa95),
            new Spec(0xf836aa95, "channels.leaveChannel", new Field[] { new Field("channel", OBJECT, "InputChannel", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf83ae221),
            new Spec(0xf83ae221, "messages.savedDialogs", new Field[] { new Field("dialogs", VECTOR, "SavedDialog", 0, -1), new Field("messages", VECTOR, "Message", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf85c413c),
            new Spec(0xf85c413c, "videoSizeEmojiMarkup", new Field[] { new Field("emoji_id", LONG, "", 0, -1), new Field("background_colors", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf8654027),
            new Spec(0xf8654027, "contacts.exportContactToken", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf87eabab),
            new Spec(0xf87eabab, "communities.getParticipantJoinedChats", new Field[] { new Field("community", OBJECT, "InputChannel", 0, -1), new Field("participant", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf8827ebf),
            new Spec(0xf8827ebf, "auth.sentCodePaymentRequired", new Field[] { new Field("store_product", STRING, "", 0, -1), new Field("phone_code_hash", STRING, "", 0, -1), new Field("support_email_address", STRING, "", 0, -1), new Field("support_email_subject", STRING, "", 0, -1), new Field("premium_days", INT, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf888fa1a),
            new Spec(0xf888fa1a, "privacyValueDisallowContacts", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf89777f2),
            new Spec(0xf89777f2, "channelAdminLogEventActionParticipantLeave", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf89a6a4e),
            new Spec(0xf89a6a4e, "updateChat", new Field[] { new Field("chat_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf8ab7dfb),
            new Spec(0xf8ab7dfb, "inputMediaContact", new Field[] { new Field("phone_number", STRING, "", 0, -1), new Field("first_name", STRING, "", 0, -1), new Field("last_name", STRING, "", 0, -1), new Field("vcard", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf8b036af),
            new Spec(0xf8b036af, "channels.getAdminedPublicChannels", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("by_location", TRUE, "", 1, 0), new Field("check_limit", TRUE, "", 1, 1), new Field("for_personal", TRUE, "", 1, 2), new Field("for_community_peer", TRUE, "", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xf8e0aa1c),
            new Spec(0xf8e0aa1c, "account.passkeys", new Field[] { new Field("passkeys", VECTOR, "Passkey", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf8ec284b),
            new Spec(0xf8ec284b, "peerSelfLocated", new Field[] { new Field("expires", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf92424d2),
            new Spec(0xf92424d2, "channelAdminLogEventActionParticipantMute", new Field[] { new Field("participant", OBJECT, "GroupCallParticipant", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf9470ab2),
            new Spec(0xf9470ab2, "updateQuickReplies", new Field[] { new Field("quick_replies", VECTOR, "QuickReply", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf9677aad),
            new Spec(0xf9677aad, "starsTransactionPeerAPI", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xf96e55de),
            new Spec(0xf96e55de, "messages.uninstallStickerSet", new Field[] { new Field("stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf9a2a6cb),
            new Spec(0xf9a2a6cb, "inputStorePaymentStarsTopup", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("stars", LONG, "", 0, -1), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("spend_purpose_peer", OBJECT, "InputPeer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xf9c44144),
            new Spec(0xf9c44144, "inputMediaGeoPoint", new Field[] { new Field("geo_point", OBJECT, "InputGeoPoint", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf9c84973),
            new Spec(0xf9c84973, "onrampAvailability", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("allowed", TRUE, "", 1, 0), new Field("buy_allowed", TRUE, "", 1, 1), new Field("country_code", STRING, "", 0, -1), new Field("state", STRING, "", 1, 2), new Field("methods", VECTOR, "OnrampMethodAvailability", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf9c8bcc6),
            new Spec(0xf9c8bcc6, "webDocumentNoProxy", new Field[] { new Field("url", STRING, "", 0, -1), new Field("size", INT, "", 0, -1), new Field("mime_type", STRING, "", 0, -1), new Field("attributes", VECTOR, "DocumentAttribute", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xf9cbe409),
            new Spec(0xf9cbe409, "messages.deletePhoneCallHistory", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("revoke", TRUE, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xf9d612ef),
            new Spec(0xf9d612ef, "wallet.holderDc", new Field[] { new Field("dc", INT, "", 0, -1), new Field("public_key", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfa04579d),
            new Spec(0xfa04579d, "messageEntityMention", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfa0f3ca2),
            new Spec(0xfa0f3ca2, "updatePinnedDialogs", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("folder_id", INT, "", 1, 1), new Field("order", VECTOR, "DialogPeer", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xfa2bc90a),
            new Spec(0xfa2bc90a, "inputMessagesFilterPoll", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfa3efb95),
            new Spec(0xfa3efb95, "photoSizeProgressive", new Field[] { new Field("type", STRING, "", 0, -1), new Field("w", INT, "", 0, -1), new Field("h", INT, "", 0, -1), new Field("sizes", VECTOR, "INT", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfa4f0bb5),
            new Spec(0xfa4f0bb5, "inputFileBig", new Field[] { new Field("id", LONG, "", 0, -1), new Field("parts", INT, "", 0, -1), new Field("name", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfa58b6d4),
            new Spec(0xfa58b6d4, "themeSettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("message_colors_animated", TRUE, "", 1, 2), new Field("base_theme", OBJECT, "BaseTheme", 0, -1), new Field("accent_color", INT, "", 0, -1), new Field("outbox_accent_color", INT, "", 1, 3), new Field("message_colors", VECTOR, "INT", 1, 0), new Field("wallpaper", OBJECT, "WallPaper", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xfa87f659),
            new Spec(0xfa87f659, "chatlists.chatlistInviteAlready", new Field[] { new Field("filter_id", INT, "", 0, -1), new Field("missing_peers", VECTOR, "Peer", 0, -1), new Field("already_peers", VECTOR, "Peer", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfa8cc6f5),
            new Spec(0xfa8cc6f5, "account.reportProfilePhoto", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("photo_id", OBJECT, "InputPhoto", 0, -1), new Field("reason", OBJECT, "ReportReason", 0, -1), new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfabadc5f),
            new Spec(0xfabadc5f, "inputPrivacyKeyPhoneCall", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfac67d3c),
            new Spec(0xfac67d3c, "wallet.tonConnectSubmitResponse", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("session_id", LONG, "", 0, -1), new Field("msg_id", INT, "", 0, -1), new Field("body", BYTES, "", 0, -1), new Field("trace_id", STRING, "", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xfae69f56),
            new Spec(0xfae69f56, "messageActionCustomAction", new Field[] { new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfaf7e8c9),
            new Spec(0xfaf7e8c9, "phoneCallDiscardReasonBusy", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfaff629d),
            new Spec(0xfaff629d, "messages.myStickers", new Field[] { new Field("count", INT, "", 0, -1), new Field("sets", VECTOR, "StickerSetCovered", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfb197a65),
            new Spec(0xfb197a65, "photo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_stickers", TRUE, "", 1, 0), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 0, -1), new Field("file_reference", BYTES, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("sizes", VECTOR, "PhotoSize", 0, -1), new Field("video_sizes", VECTOR, "VideoSize", 1, 1), new Field("dc_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfb4c496c),
            new Spec(0xfb4c496c, "updateReadFeaturedEmojiStickers", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfb790393),
            new Spec(0xfb790393, "inputStorePaymentPremiumGiftCode", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("users", VECTOR, "InputUser", 0, -1), new Field("boost_peer", OBJECT, "InputPeer", 1, 0), new Field("currency", STRING, "", 0, -1), new Field("amount", LONG, "", 0, -1), new Field("message", OBJECT, "TextWithEntities", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xfb7e8ca7),
            new Spec(0xfb7e8ca7, "messages.getEmojiGameInfo", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfb834291),
            new Spec(0xfb834291, "topPeerCategoryPeers", new Field[] { new Field("category", OBJECT, "TopPeerCategory", 0, -1), new Field("count", INT, "", 0, -1), new Field("peers", VECTOR, "TopPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfb8fe43c),
            new Spec(0xfb8fe43c, "payments.savedInfo", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("has_saved_credentials", TRUE, "", 1, 1), new Field("saved_info", OBJECT, "PaymentRequestedInfo", 1, 0) }));
        BY_ID.put(Integer.valueOf(0xfb9c547a),
            new Spec(0xfb9c547a, "updateEmojiGameInfo", new Field[] { new Field("info", OBJECT, "messages.EmojiGameInfo", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfbd2c296),
            new Spec(0xfbd2c296, "inputFolderPeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("folder_id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfbd3de6b),
            new Spec(0xfbd3de6b, "account.updateEmojiStatus", new Field[] { new Field("emoji_status", OBJECT, "EmojiStatus", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfbd81688),
            new Spec(0xfbd81688, "baseThemeDay", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfbeec0f0),
            new Spec(0xfbeec0f0, "topPeerCategoryForwardChats", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfbf6e8b1),
            new Spec(0xfbf6e8b1, "account.savedRingtonesNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfbf902b0),
            new Spec(0xfbf902b0, "sendMessageStopDraftAction", new Field[] { new Field("random_id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfbfca18f),
            new Spec(0xfbfca18f, "messages.getEmojiStickers", new Field[] { new Field("hash", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfc36954e),
            new Spec(0xfc36954e, "secureValueTypeUtilityBill", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfc533372),
            new Spec(0xfc533372, "users.suggestBirthday", new Field[] { new Field("id", OBJECT, "InputUser", 0, -1), new Field("birthday", OBJECT, "Birthday", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfc78af9b),
            new Spec(0xfc78af9b, "messages.report", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", VECTOR, "INT", 0, -1), new Field("option", BYTES, "", 0, -1), new Field("message", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfc878fc8),
            new Spec(0xfc878fc8, "phoneCallProtocol", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("udp_p2p", TRUE, "", 1, 0), new Field("udp_reflector", TRUE, "", 1, 1), new Field("min_layer", INT, "", 0, -1), new Field("max_layer", INT, "", 0, -1), new Field("library_versions", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfc89f7f3),
            new Spec(0xfc89f7f3, "dialog", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("pinned", TRUE, "", 1, 2), new Field("unread_mark", TRUE, "", 1, 3), new Field("view_forum_as_messages", TRUE, "", 1, 6), new Field("peer", OBJECT, "Peer", 0, -1), new Field("top_message", INT, "", 0, -1), new Field("read_inbox_max_id", INT, "", 0, -1), new Field("read_outbox_max_id", INT, "", 0, -1), new Field("unread_count", INT, "", 0, -1), new Field("unread_mentions_count", INT, "", 0, -1), new Field("unread_reactions_count", INT, "", 0, -1), new Field("unread_poll_votes_count", INT, "", 0, -1), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1), new Field("pts", INT, "", 1, 0), new Field("draft", OBJECT, "DraftMessage", 1, 1), new Field("folder_id", INT, "", 1, 4), new Field("ttl_period", INT, "", 1, 5) }));
        BY_ID.put(Integer.valueOf(0xfc8ddbea),
            new Spec(0xfc8ddbea, "account.getWallPaper", new Field[] { new Field("wallpaper", OBJECT, "InputWallPaper", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfcaafeb7),
            new Spec(0xfcaafeb7, "inputDialogPeer", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfcdad815),
            new Spec(0xfcdad815, "forumTopic", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("my", TRUE, "", 1, 1), new Field("closed", TRUE, "", 1, 2), new Field("pinned", TRUE, "", 1, 3), new Field("short", TRUE, "", 1, 5), new Field("hidden", TRUE, "", 1, 6), new Field("title_missing", TRUE, "", 1, 7), new Field("id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("peer", OBJECT, "Peer", 0, -1), new Field("title", STRING, "", 0, -1), new Field("icon_color", INT, "", 0, -1), new Field("icon_emoji_id", LONG, "", 1, 0), new Field("top_message", INT, "", 0, -1), new Field("read_inbox_max_id", INT, "", 0, -1), new Field("read_outbox_max_id", INT, "", 0, -1), new Field("unread_count", INT, "", 0, -1), new Field("unread_mentions_count", INT, "", 0, -1), new Field("unread_reactions_count", INT, "", 0, -1), new Field("unread_poll_votes_count", INT, "", 0, -1), new Field("from_id", OBJECT, "Peer", 0, -1), new Field("notify_settings", OBJECT, "PeerNotifySettings", 0, -1), new Field("draft", OBJECT, "DraftMessage", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xfcfeb29c),
            new Spec(0xfcfeb29c, "stickerKeyword", new Field[] { new Field("document_id", LONG, "", 0, -1), new Field("keyword", VECTOR, "STRING", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfd05dd00),
            new Spec(0xfd05dd00, "payments.getCraftStarGifts", new Field[] { new Field("gift_id", LONG, "", 0, -1), new Field("offset", STRING, "", 0, -1), new Field("limit", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfd149899),
            new Spec(0xfd149899, "documentAttributeCustomEmoji", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("free", TRUE, "", 1, 0), new Field("text_color", TRUE, "", 1, 1), new Field("alt", STRING, "", 0, -1), new Field("stickerset", OBJECT, "InputStickerSet", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfd2dda49),
            new Spec(0xfd2dda49, "messages.toggleDialogFilterTags", new Field[] { new Field("enabled", BOOL, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfd3cdab8),
            new Spec(0xfd3cdab8, "communityForbidden", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", LONG, "", 0, -1), new Field("access_hash", LONG, "", 1, 13), new Field("title", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfd5e12bd),
            new Spec(0xfd5e12bd, "messages.webPage", new Field[] { new Field("webpage", OBJECT, "WebPage", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfd5ec8f5),
            new Spec(0xfd5ec8f5, "sendMessageCancelAction", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfd9e7bec),
            new Spec(0xfd9e7bec, "topPeerCategoryBotsApp", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfda68d36),
            new Spec(0xfda68d36, "messages.getMessageEditData", new Field[] { new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("id", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfdabbfcd),
            new Spec(0xfdabbfcd, "messageEntityTonAddress", new Field[] { new Field("offset", INT, "", 0, -1), new Field("length", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfdb19008),
            new Spec(0xfdb19008, "messageMediaGame", new Field[] { new Field("game", OBJECT, "Game", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfdbcd714),
            new Spec(0xfdbcd714, "chatlists.getLeaveChatlistSuggestions", new Field[] { new Field("chatlist", OBJECT, "InputChatlist", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfe06823f),
            new Spec(0xfe06823f, "inputGroupCallSlug", new Field[] { new Field("slug", STRING, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfe2eda76),
            new Spec(0xfe2eda76, "account.toggleNoPaidMessagesException", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("refund_charged", TRUE, "", 1, 0), new Field("require_payment", TRUE, "", 1, 2), new Field("parent_peer", OBJECT, "InputPeer", 1, 1), new Field("user_id", OBJECT, "InputUser", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfe333952),
            new Spec(0xfe333952, "starGiftAuctionStateNotModified", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xfe41b34f),
            new Spec(0xfe41b34f, "globalPrivacySettings", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("archive_and_mute_new_noncontact_peers", TRUE, "", 1, 0), new Field("keep_archived_unmuted", TRUE, "", 1, 1), new Field("keep_archived_folders", TRUE, "", 1, 2), new Field("hide_read_marks", TRUE, "", 1, 3), new Field("new_noncontact_peers_require_premium", TRUE, "", 1, 4), new Field("display_gifts_button", TRUE, "", 1, 7), new Field("noncontact_peers_paid_stars", LONG, "", 1, 5), new Field("disallowed_gifts", OBJECT, "DisallowedGiftsSettings", 1, 6) }));
        BY_ID.put(Integer.valueOf(0xfe78eecc),
            new Spec(0xfe78eecc, "walletUserAddress", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("user_id", LONG, "", 1, 0), new Field("address", STRING, "", 0, -1), new Field("public_key", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfe9fc158),
            new Spec(0xfe9fc158, "channelAdminLogEventActionParticipantJoinByInvite", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("via_chatlist", TRUE, "", 1, 0), new Field("invite", OBJECT, "ExportedChatInvite", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfebe5491),
            new Spec(0xfebe5491, "starsRevenueStatus", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("withdrawal_enabled", TRUE, "", 1, 0), new Field("current_balance", OBJECT, "StarsAmount", 0, -1), new Field("available_balance", OBJECT, "StarsAmount", 0, -1), new Field("overall_revenue", OBJECT, "StarsAmount", 0, -1), new Field("next_withdrawal_at", INT, "", 1, 1) }));
        BY_ID.put(Integer.valueOf(0xfeed5769),
            new Spec(0xfeed5769, "account.installWallPaper", new Field[] { new Field("wallpaper", OBJECT, "InputWallPaper", 0, -1), new Field("settings", OBJECT, "WallPaperSettings", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfef48f62),
            new Spec(0xfef48f62, "messages.sendMessage", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("no_webpage", TRUE, "", 1, 1), new Field("silent", TRUE, "", 1, 5), new Field("background", TRUE, "", 1, 6), new Field("clear_draft", TRUE, "", 1, 7), new Field("noforwards", TRUE, "", 1, 14), new Field("update_stickersets_order", TRUE, "", 1, 15), new Field("invert_media", TRUE, "", 1, 16), new Field("allow_paid_floodskip", TRUE, "", 1, 19), new Field("peer", OBJECT, "InputPeer", 0, -1), new Field("reply_to", OBJECT, "InputReplyTo", 1, 0), new Field("message", STRING, "", 0, -1), new Field("random_id", LONG, "", 0, -1), new Field("reply_markup", OBJECT, "ReplyMarkup", 1, 2), new Field("entities", VECTOR, "MessageEntity", 1, 3), new Field("schedule_date", INT, "", 1, 10), new Field("schedule_repeat_period", INT, "", 1, 24), new Field("send_as", OBJECT, "InputPeer", 1, 13), new Field("quick_reply_shortcut", OBJECT, "InputQuickReplyShortcut", 1, 17), new Field("effect", LONG, "", 1, 18), new Field("allow_paid_stars", LONG, "", 1, 21), new Field("suggested_post", OBJECT, "SuggestedPost", 1, 22), new Field("rich_message", OBJECT, "InputRichMessage", 1, 23) }));
        BY_ID.put(Integer.valueOf(0xff544e65),
            new Spec(0xff544e65, "folder", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("autofill_new_broadcasts", TRUE, "", 1, 0), new Field("autofill_public_groups", TRUE, "", 1, 1), new Field("autofill_new_correspondents", TRUE, "", 1, 2), new Field("id", INT, "", 0, -1), new Field("title", STRING, "", 0, -1), new Field("photo", OBJECT, "ChatPhoto", 1, 3) }));
        BY_ID.put(Integer.valueOf(0xff57708d),
            new Spec(0xff57708d, "messages.preparedInlineMessage", new Field[] { new Field("query_id", LONG, "", 0, -1), new Field("result", OBJECT, "BotInlineResult", 0, -1), new Field("peer_types", VECTOR, "InlineQueryPeerType", 0, -1), new Field("cache_time", INT, "", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xff6c8049),
            new Spec(0xff6c8049, "notificationSoundRingtone", new Field[] { new Field("id", LONG, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xff7a571b),
            new Spec(0xff7a571b, "privacyKeySavedMusic", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xff7a9383),
            new Spec(0xff7a9383, "phone.sendSignalingData", new Field[] { new Field("peer", OBJECT, "InputPhoneCall", 0, -1), new Field("data", BYTES, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xff9289f5),
            new Spec(0xff9289f5, "timezone", new Field[] { new Field("id", STRING, "", 0, -1), new Field("name", STRING, "", 0, -1), new Field("utc_offset", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xffa00ccc),
            new Spec(0xffa00ccc, "messageActionPaymentSentMe", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("recurring_init", TRUE, "", 1, 2), new Field("recurring_used", TRUE, "", 1, 3), new Field("currency", STRING, "", 0, -1), new Field("total_amount", LONG, "", 0, -1), new Field("payload", BYTES, "", 0, -1), new Field("info", OBJECT, "PaymentRequestedInfo", 1, 0), new Field("shipping_option_id", STRING, "", 1, 1), new Field("charge", OBJECT, "PaymentCharge", 0, -1), new Field("subscription_until_date", INT, "", 1, 4) }));
        BY_ID.put(Integer.valueOf(0xffadc913),
            new Spec(0xffadc913, "storyItemSkipped", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("close_friends", TRUE, "", 1, 8), new Field("live", TRUE, "", 1, 9), new Field("id", INT, "", 0, -1), new Field("date", INT, "", 0, -1), new Field("expire_date", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xffb62b95),
            new Spec(0xffb62b95, "inputStickerSetEmpty", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xffb6d4ca),
            new Spec(0xffb6d4ca, "stickers.changeStickerPosition", new Field[] { new Field("sticker", OBJECT, "InputDocument", 0, -1), new Field("position", INT, "", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xffc86587),
            new Spec(0xffc86587, "inputMessagesFilterGif", new Field[] {  }));
        BY_ID.put(Integer.valueOf(0xffda656d),
            new Spec(0xffda656d, "messages.sponsoredMessages", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("posts_between", INT, "", 1, 0), new Field("start_delay", INT, "", 1, 1), new Field("between_delay", INT, "", 1, 2), new Field("messages", VECTOR, "SponsoredMessage", 0, -1), new Field("chats", VECTOR, "Chat", 0, -1), new Field("users", VECTOR, "User", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfff8fdc4),
            new Spec(0xfff8fdc4, "inputBotInlineResultDocument", new Field[] { new Field("flags", FLAGWORD, "", 0, -1), new Field("id", STRING, "", 0, -1), new Field("type", STRING, "", 0, -1), new Field("title", STRING, "", 1, 1), new Field("description", STRING, "", 1, 2), new Field("document", OBJECT, "InputDocument", 0, -1), new Field("send_message", OBJECT, "InputBotInlineMessage", 0, -1) }));
        BY_ID.put(Integer.valueOf(0xfffe1bac),
            new Spec(0xfffe1bac, "privacyValueAllowContacts", new Field[] {  }));
    }

    private TlTypes() {}
}
