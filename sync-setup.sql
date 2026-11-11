-- Kamal Planner private cross-device sync for Supabase.
-- Run once in your own project's SQL Editor. Never use a service-role key in the app.

create table if not exists public.kamal_planner_sync (
  user_id uuid primary key references auth.users (id) on delete cascade,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.kamal_planner_sync enable row level security;
revoke all on table public.kamal_planner_sync from anon, authenticated;
grant select, insert, update on table public.kamal_planner_sync to authenticated;

drop policy if exists "Planner owners manage their own sync row" on public.kamal_planner_sync;
create policy "Planner owners manage their own sync row"
  on public.kamal_planner_sync
  for all
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

insert into storage.buckets (id, name, public)
values ('kamal-planner-files', 'kamal-planner-files', false)
on conflict (id) do update set public = false;

drop policy if exists "Planner owners read their synced files" on storage.objects;
create policy "Planner owners read their synced files"
  on storage.objects for select to authenticated
  using (bucket_id = 'kamal-planner-files' and (storage.foldername(name))[1] = (select auth.uid())::text);

drop policy if exists "Planner owners upload their synced files" on storage.objects;
create policy "Planner owners upload their synced files"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'kamal-planner-files' and (storage.foldername(name))[1] = (select auth.uid())::text);

drop policy if exists "Planner owners update their synced files" on storage.objects;
create policy "Planner owners update their synced files"
  on storage.objects for update to authenticated
  using (bucket_id = 'kamal-planner-files' and (storage.foldername(name))[1] = (select auth.uid())::text)
  with check (bucket_id = 'kamal-planner-files' and (storage.foldername(name))[1] = (select auth.uid())::text);

drop policy if exists "Planner owners delete their synced files" on storage.objects;
create policy "Planner owners delete their synced files"
  on storage.objects for delete to authenticated
  using (bucket_id = 'kamal-planner-files' and (storage.foldername(name))[1] = (select auth.uid())::text);
