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

### Pushnames are masked in backups
- `lid_display_name` looks promising for showing the name each contact set
  for themselves, but in `.crypt15` backups every row arrives masked
  (`+34∙∙∙∙∙∙∙21`) — verified on 2024 and 2026 snapshots. Display names must
  come from the phone address book (or `wa.db` when populated), not from here.

## Cookbook: useful queries

Everything below is plain SQLite against a decrypted `msgstore.db`. Open it
read-only and immutable — the file you have is a backup artifact, never a
live database:

```sh
sqlite3 'file:msgstore.db?immutable=1'
```

### List chats, most recently active first

```sql
SELECT c._id, COALESCE(c.subject, j.user) AS name,
       datetime(c.sort_timestamp/1000,'unixepoch','localtime') AS last
FROM chat c JOIN jid j ON j._id = c.jid_row_id
WHERE c.hidden = 0 AND c.sort_timestamp > 0
ORDER BY c.sort_timestamp DESC LIMIT 30;
```

`subject` is NULL for 1:1 chats — their "name" is just the phone number;
human names live in your phone's address book, not in this DB.

### Page through one chat

```sql
SELECT datetime(m.timestamp/1000,'unixepoch','localtime') AS at,
       m.from_me, m.message_type, m.text_data
FROM message m
WHERE m.chat_row_id = :chat AND m.message_type != 7
ORDER BY m.sort_id DESC LIMIT 50;
```

Page by `sort_id` (display order), not `timestamp` (edits and history syncs
reorder it). Filter `message_type != 7` or every security-code change ever
shows up as a bubble.

### Who sent this group message? (the LID dance)

```sql
SELECT COALESCE(pn.user, js.user) AS sender_number
FROM message m
LEFT JOIN jid js ON js._id = m.sender_jid_row_id
LEFT JOIN jid_map jm ON jm.lid_row_id = m.sender_jid_row_id
LEFT JOIN jid pn ON pn._id = jm.jid_row_id
WHERE m._id = :msg;
```

`sender_jid_row_id` often points at a `lid` jid (an opaque privacy alias);
`jid_map` translates it back to the phone-number jid. Skip the mapping and
senders silently come out as meaningless numeric ids.

### Which chat did this file belong to?

```sql
SELECT COALESCE(c.subject, j.user) AS chat,
       datetime(m.timestamp/1000,'unixepoch','localtime') AS at
FROM message_media mm
JOIN message m ON m._id = mm.message_row_id
JOIN chat c ON c._id = mm.chat_row_id
JOIN jid j ON j._id = c.jid_row_id
WHERE mm.file_path LIKE '%/' || :basename
   OR mm.file_hash = :b64sha256;   -- survives renames
```

`file_hash` is the base64 SHA-256 of the file content, so you can identify
a stray `IMG-*.jpg` found anywhere by hashing it, even years later.

### Media weight per chat

```sql
SELECT COALESCE(c.subject, j.user) AS chat,
       COUNT(*) AS files, SUM(mm.file_size)/1e6 AS mb
FROM message_media mm
JOIN chat c ON c._id = mm.chat_row_id
JOIN jid j ON j._id = c.jid_row_id
GROUP BY c._id ORDER BY mb DESC LIMIT 20;
```

### Messages per month (one chat, or drop the WHERE for all)

```sql
SELECT strftime('%Y-%m', timestamp/1000,'unixepoch','localtime') AS month,
       COUNT(*) AS n
FROM message WHERE chat_row_id = :chat AND message_type != 7
GROUP BY month ORDER BY month;
```

### One day across every chat

```sql
SELECT datetime(m.timestamp/1000,'unixepoch','localtime') AS at,
       COALESCE(c.subject, j.user) AS chat, m.text_data
FROM message m
JOIN chat c ON c._id = m.chat_row_id
JOIN jid j ON j._id = c.jid_row_id
WHERE date(m.timestamp/1000,'unixepoch','localtime') = :day
  AND m.message_type != 7
ORDER BY m.timestamp;
```

### Members of a WhatsApp List

```sql
SELECT l.label_name, COALESCE(pn.user, j.user) AS member
FROM labels l
JOIN labeled_jid lj ON lj.label_id = l._id
JOIN jid j ON j._id = lj.jid_row_id
LEFT JOIN jid_map jm ON jm.lid_row_id = j._id
LEFT JOIN jid pn ON pn._id = jm.jid_row_id
ORDER BY l.sort_id;
```

### Files stored more than once

```sql
SELECT COUNT(*) AS copies, MAX(file_size) AS bytes, MIN(file_path) AS example
FROM message_media
WHERE file_hash IS NOT NULL AND file_size > 0
GROUP BY file_hash HAVING COUNT(*) > 1
ORDER BY (COUNT(*)-1) * MAX(file_size) DESC LIMIT 20;
```

The same forwarded video easily sits in a dozen chats; `(copies-1) × bytes`
is the space you would reclaim by deduplicating.

### Same account, or a different "incarnation"?

Two msgstores can share content yet be different databases (e.g. after a
data loss + partial history resync). `key_id` tells them apart: snapshots
of the same incarnation share message key_ids; a resynced history gets new
ones. Sample a few hundred `(chat jid, key_id)` pairs from one DB and count
how many exist in the other — ≈100% means same incarnation, ≈0% means
different, even if the visible text is identical.
