-- 0006 — speech_* columns
-- Applied 2026-06-21 ~21:30, between 98c6e8f ("Speech NOT yet persisted to Supabase (needs
-- columns)") and 2a26906 ("Speech now persists to Supabase (speech_* columns)").
-- User: "I ran the SQL, keep rolling into Phase 3".
--
-- RECONSTRUCTED, not verified against original. Names verbatim from the insert payload.

alter table public.exams
  add column if not exists speech_label   text,
  add column if not exists speech_metric  text,
  add column if not exists speech_flag    text,
  add column if not exists speech_value   numeric;
