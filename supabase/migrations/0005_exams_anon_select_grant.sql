-- 0005 — table-level SELECT grant for anon
--
-- RECONSTRUCTED, not verified against original — MISSING from RECOVERED_MIGRATIONS.sql.
-- 0001 creates the "Allow anon select" RLS policy but no GRANT. On 2026-06-21 the admin failed
-- with "permission denied for table exams" (prompt in ~/.claude/history.jsonl) — a missing-GRANT
-- error, not an RLS one — and was fixed before 2fab2fd. 0006 shows the same pattern for INSERT
-- (policy existed, grant had to be added). The admin dashboard and the demo's "previous screen"
-- panel both read with the anon key.

grant select on public.exams to anon;
