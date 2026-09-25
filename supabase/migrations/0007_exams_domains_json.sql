-- 0007 — domains_json: every domain result for the run (CN V/IX-X/XI, antisaccade, NPC, OKN,
-- HINTS, RT, PLR, FIELD gaze...) without further per-column migrations.
-- Applied 2026-06-21 ~22:00, before commit 6cac781. User: "run the domains_json migration" →
-- "i ran the supabase sql migration". 2a26906 called it "a one-line jsonb migration";
-- f34b57c verified "real insert 201 incl. domains_json".
--
-- RECONSTRUCTED, not verified against original (column name + jsonb type are confirmed).

alter table public.exams add column if not exists domains_json jsonb;
