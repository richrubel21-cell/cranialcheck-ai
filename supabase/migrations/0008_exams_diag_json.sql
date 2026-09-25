-- 0008 — diag_json: full DIAG snapshot per run (frame counts, calibration, timings, screen).
-- Introduced by commit f34b57c (2026-06-22 08:03), which noted inserts WITH diag_json 400'd
-- "until migration". Existence later verified live by da278fb / 1ef5325
-- ("domains_json & diag_json columns present as real JSON").
--
-- RECONSTRUCTED, not verified against original (column name + jsonb type are confirmed).

alter table public.exams add column if not exists diag_json jsonb;
