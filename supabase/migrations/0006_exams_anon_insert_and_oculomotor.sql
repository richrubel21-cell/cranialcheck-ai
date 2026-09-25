-- 0006 — anon insert grant/policy fix + pursuit_*/saccades_* columns
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 5. Matches commit 2fab2fd (2026-06-21 19:10).
-- ORDER: the recovered file lists this AFTER speech; git history + prompt history put it BEFORE
-- (2fab2fd 19:10 < 2a26906 21:38), so it is numbered before speech here.

-- 1) enable writes
grant insert on public.exams to anon;
drop policy if exists "anon can insert exams" on public.exams;
create policy "anon can insert exams" on public.exams for insert to anon with check (true);

-- 2) add missing columns
alter table public.exams
  add column if not exists pursuit_label   text,
  add column if not exists pursuit_metric  text,
  add column if not exists pursuit_flag    text,
  add column if not exists pursuit_value   numeric,
  add column if not exists saccades_label  text,
  add column if not exists saccades_metric text,
  add column if not exists saccades_flag   text,
  add column if not exists saccades_value  numeric;
