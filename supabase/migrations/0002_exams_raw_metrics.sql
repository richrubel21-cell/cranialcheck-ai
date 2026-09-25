-- 0002 — raw numeric values, quality sub-scores, subject metadata
-- Matches commit 3e48152 (2026-06-21 09:10) "feat: capture all raw metrics to Supabase".
--
-- RECONSTRUCTED, not verified against original. Names verbatim from the insert payload; types
-- inferred. Unknown whether these were ALTERs or folded into the original CREATE — kept separate
-- here to mirror commit history.

alter table public.exams
  add column if not exists perclos_value          numeric,   -- 0-100 (%)
  add column if not exists cn7_value              numeric,   -- asymmetry decimal (3dp)
  add column if not exists gcs_e                  integer,   -- GCS eye score
  add column if not exists tongue_value           numeric,   -- aperture decimal (3dp)
  add column if not exists head_yaw_sd            numeric,   -- degrees
  add column if not exists head_pitch_sd          numeric,
  add column if not exists head_roll_sd           numeric,
  add column if not exists valid_frame_pct        numeric,   -- 0-100
  add column if not exists lighting_score         numeric,
  add column if not exists calibration_stability  numeric,
  add column if not exists completion_rate        numeric,
  add column if not exists exam_duration_sec      numeric,
  add column if not exists avg_fps                numeric,
  add column if not exists subject_age            integer,   -- always null today (schema-ready)
  add column if not exists subject_sex            text,      -- always null today
  add column if not exists subject_id             text,      -- always null today
  add column if not exists device_info            text,      -- navigator.userAgent
  add column if not exists session_id             text;      -- demo access code or 'guest'
