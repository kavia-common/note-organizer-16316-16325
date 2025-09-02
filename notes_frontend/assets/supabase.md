# Supabase Integration for Notes App

This app uses Supabase as the backend for syncing notes across devices.

Table name: notes

Recommended table schema:
- id: uuid (primary key, default: uuid_generate_v4())
- title: text
- content: text
- created_at: timestamptz (default: now())
- updated_at: timestamptz (default: now())
- is_deleted: boolean (default: false)

RLS example (adjust as needed):
- Enable RLS
- Create appropriate policies for authenticated users to read/write their notes, e.g., add a user_id column and policies restricting to `auth.uid()`. For simplicity, this app can work without auth in development.

Environment variables (provided via .env):
- SUPABASE_URL
- SUPABASE_KEY

Sync strategy:
- Local-first storage uses SQLite.
- New local notes receive a temporary id `local_<timestamp>_<rand>`. On successful remote creation, the record is re-inserted locally with the remote `id`.
- Updates and deletes are performed locally and marked as `is_dirty=1`. Sync pushes changes to Supabase, then fetches all remote notes to merge.
- Soft deletes: deleted notes are marked `is_deleted=1` locally and removed remotely during sync. Local record is hard-deleted after successful remote deletion.

Notes:
- Do not hardcode secrets. Use `.env`.
- If you change the table or columns, update the code in `services/supabase_service.dart`.
