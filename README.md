# whatsapp-db-schema

The live SQLite schema of WhatsApp's `msgstore.db`, extracted automatically
from real end-to-end-encrypted Android backups (`.crypt15`, decrypted with
[wa-crypt-tools](https://github.com/ElDavoo/wa-crypt-tools)) every time the
backup pipeline sees a new WhatsApp version. Only the schema is published —
never data.

## Field notes

Things learned the hard way while building tools on top of this schema.

### Ordering & anchors
- `message.sort_id` is the display order; `message.timestamp` (ms epoch) can
  disagree with it (edits, out-of-order delivery). Page by `sort_id`.
- `chat.sort_timestamp` orders the chat list; `chat.display_message_row_id`
  (falling back to `chat.last_message_row_id`) is what the app shows as the
  chat's last message.
- `sqlite_sequence` for `message` grows monotonically across backups, which
  makes it a cheap progress/dedup cursor between snapshots ("has this backup
  anything new?").

### Identity: JIDs and LIDs
- `jid` holds every address; `server` distinguishes kinds:
  `s.whatsapp.net` (person, `user` = phone number), `g.us` (group),
  `lid` (privacy-preserving "local id" alias), `newsletter`, `broadcast`.
- Group senders (and some 1:1 chats) may reference a `lid` jid. `jid_map`
  (`lid_row_id` → `jid_row_id`) translates it back to the phone-number jid.
  Any sender/number resolution must LEFT JOIN through `jid_map` or numbers
  silently disappear.

### Message types (`message.message_type`)
`0` text · `1` image · `2` audio · `3` video · `4` contact card ·
`5` location · `7` system (security-code/number changes; inserted into every
shared chat at once — pure noise for browsing, filter it out) · `9` document ·
`13` gif · `15` revoked ("this message was deleted") · `16` live location ·
`20` sticker · `24` group invite · `46` poll. Media captions live in
`message.text_data` alongside the `message_media` row.

### Full-text search
- `message_ftsv2` is FTS4 with WhatsApp's own tokenizer/normalisation: a
  naive `MATCH 'word'` returns nothing useful. The index is derived data and
  rebuildable (`INSERT INTO message_ftsv2(message_ftsv2) VALUES('rebuild')`),
  so it is safe to exclude from dumps; plain `LIKE` over `message.text_data`
  is fast enough for a few hundred thousand rows.

### Organisation features
- WhatsApp **Lists** are `labels` (+ `labeled_jid` for membership). The three
  built-ins ship as predefined rows; user lists are ordinary rows.
- Native **Favourites** are the `favorite` table (`jid_row_id`, `sort_order`).
- `message_quoted` is a *denormalised copy* of the quoted message keyed by the
  quoting message's row id — no join to the original needed (it may be gone).

### Integrity model
- There are **no foreign keys**; consistency is maintained by triggers
  (including the `backup_changes` bookkeeping used for incremental backups).
  Per-table dumps are therefore lossless and re-importable.
- High-churn bookkeeping tables (`backup_changes`, `user_device*`,
  `group_participant_device`, FTS shadow tables) rewrite thousands of rows a
  day and are worth excluding from any versioned dump.

### The `.crypt15` container
- The header is cleartext protobuf with the WhatsApp version, backup
  features, and the **last two digits of the account JID** — enough to
  sanity-check "is this backup from the account I think it is" before
  decrypting. The decryption key (64 hex digits) never leaves the phone
  unless you write it down when enabling encrypted backups.

### WhatsApp Business
- `com.whatsapp.w4b` uses the same `msgstore.db` schema. Differences are
  cosmetic: media folders are named `WhatsApp Business Images` etc., and on
  older Androids the tree lives at `/sdcard/WhatsApp Business/` instead of
  `/sdcard/Android/media/com.whatsapp.w4b/`.

### Companion databases (`Backups/*.crypt15`, same key)
- `wa.db` — the address book (`wa_contacts`: jid, display name, …).
- `chatsettingsbackup.db`, `status_backup.db`, `stickers_db.bak`,
  `commerce_backup.db`, `backup_settings.json` — settings & small state,
  all encrypted with the same account key.
