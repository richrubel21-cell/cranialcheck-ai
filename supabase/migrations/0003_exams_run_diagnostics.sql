-- 0003 — per-run diagnostics
-- Matches commit 7146e8b (2026-06-21 09:54) "capture run diagnostics to Supabase + surface in admin".
--
-- RECONSTRUCTED, not verified against original. Names verbatim from the insert payload; types
-- inferred from the DIAG object in cranialcheck-demo.html (booleans, delegate string, integer
-- frame counters, nullable fps numbers, joined error string).

alter table public.exams
  add column if not exists model_loaded     boolean,
  add column if not exists model_delegate   text,
  add column if not exists face_detected    boolean,
  add column if not exists calib_frames     integer,
  add column if not exists perclos_frames   integer,
  add column if not exists cn7_frames       integer,
  add column if not exists gcs_frames       integer,
  add column if not exists tongue_frames    integer,
  add column if not exists head_frames      integer,
  add column if not exists avg_iris_count   numeric,
  add column if not exists min_fps          numeric,
  add column if not exists max_fps          numeric,
  add column if not exists error_log        text;
