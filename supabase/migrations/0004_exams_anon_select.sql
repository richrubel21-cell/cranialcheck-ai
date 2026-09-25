-- 0004 — let the anon-key admin dashboard (and the demo's "previous screen" panel) read exams
-- Applied 2026-06-21 afternoon, between commits 7d59d6e and ac96019, after the admin showed
-- "permission denied for table exams" (prompt preserved in ~/.claude/history.jsonl).
--
-- RECONSTRUCTED, not verified against original. "permission denied for table" is a GRANT error
-- (an RLS policy miss returns zero rows instead), so the fix must have included a GRANT; the
-- policy and its name are inferred. Both admin.html and cranialcheck-demo.html use only the anon key.

grant usage on schema public to anon;
grant select on table public.exams to anon;

drop policy if exists "anon can read exams" on public.exams;
create policy "anon can read exams"
  on public.exams for select
  to anon
  using (true);
