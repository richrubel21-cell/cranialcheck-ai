-- 0008 — domains_json
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 6. Persisted by commit 6cac781.

alter table public.exams add column if not exists domains_json jsonb;
