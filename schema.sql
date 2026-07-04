-- À exécuter une fois dans Supabase : Dashboard > SQL Editor > New query > coller > Run

create table if not exists sessions (
  id bigint generated always as identity primary key,
  week text not null,
  seance text not null,
  label text,
  date_recorded text,
  hooper jsonb,
  weights jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (week, seance)
);

alter table sessions enable row level security;

-- Accès ouvert à qui possède la clé "anon" (protégé côté appli par le code PIN,
-- pas par une vraie authentification — voir README pour le compromis de sécurité).
create policy "anon can read sessions" on sessions
  for select to anon using (true);

create policy "anon can insert sessions" on sessions
  for insert to anon with check (true);

create policy "anon can update sessions" on sessions
  for update to anon using (true) with check (true);

create policy "anon can delete sessions" on sessions
  for delete to anon using (true);
