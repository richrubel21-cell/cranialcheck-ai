-- 0007 — speech_* summary columns
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 4. Persisted by commit 2a26906.

alter table public.exams
  add column if not exists speech_label  text,
  add column if not exists speech_metric text,
  add column if not exists speech_flag   text,
  add column if not exists speech_value  numeric;
