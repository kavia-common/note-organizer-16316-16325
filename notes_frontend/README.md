# Notes Frontend (Flutter)

Minimalistic, light-themed notes application with Supabase sync.

Features:
- View list of notes
- Create note
- Edit note
- Delete note
- Search notes
- Local-first with SQLite and Supabase sync

Colors:
- Primary: #1976D2
- Secondary: #424242
- Accent: #FFC107

## Quick Start

1) Install Flutter and dependencies

2) Set environment variables in `.env`
   - Copy `.env.example` to `.env` and fill:
     - SUPABASE_URL
     - SUPABASE_KEY

3) Ensure Supabase has a `notes` table with columns:
   - id (uuid, primary key, default uuid_generate_v4())
   - title (text)
   - content (text)
   - created_at (timestamptz, default now())
   - updated_at (timestamptz, default now())
   - is_deleted (boolean, default false)

4) Run
```
flutter pub get
flutter run
```

Sync Notes:
- Pull-to-refresh or tap the sync icon in the top AppBar.
- Local changes queue automatically and are pushed on next sync.

See `assets/supabase.md` for more details.
