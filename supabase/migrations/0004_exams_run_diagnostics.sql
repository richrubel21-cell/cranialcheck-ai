-- 0004 — per-run diagnostics columns
--
-- RECONSTRUCTED, not verified against original — MISSING from RECOVERED_MIGRATIONS.sql.
-- Commit 7146e8b (2026-06-21 09:54) started sending these 13 fields and admin.html reads them.
-- They must have existed live: f34b57c verified inserts returning 201, and PostgREST rejects any
-- insert that names an unknown column (resilientInsert only retries without diag_json). Without
-- this file every save fails on a restored project.
-- Names verbatim from the insert payload; types inferred from the DIAG object. Its position
-- relative to 0003 is unknown (harmless: both are additive).

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
