-- 0005 — anon INSERT grant + policy, and pursuit_* / saccades_* columns
-- Matches commit 2fab2fd (2026-06-21 19:10): "Requires the matching Supabase migration
-- (anon INSERT grant+policy + pursuit_*/saccades_* columns), which has been applied and
-- verified." The user reported "success. no rows returned in the sql editor" just before it.
--
-- RECONSTRUCTED, not verified against original. The SCOPE is confirmed by the commit message;
-- the exact statements, policy name and column types are rebuilt.

grant insert on table public.exams to anon;

drop policy if exists "anon can insert exams" on public.exams;
create policy "anon can insert exams"
  on public.exams for insert
  to anon
  with check (true);

alter table public.exams
  add column if not exists pursuit_label    text,
  add column if not exists pursuit_metric   text,
  add column if not exists pursuit_flag     text,
  add column if not exists pursuit_value    numeric,
  add column if not exists saccades_label   text,
  add column if not exists saccades_metric  text,
  add column if not exists saccades_flag    text,
  add column if not exists saccades_value   numeric;
