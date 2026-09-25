-- 0009 — diag_json
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 7. Persisted by commit f34b57c.

alter table public.exams add column if not exists diag_json jsonb;
