-- 0002 — raw numeric values + subject metadata
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 2.

alter table exams
  add column perclos_value numeric,
  add column cn7_value numeric,
  add column gcs_e integer,
  add column tongue_value numeric,
  add column head_yaw_sd numeric,
  add column head_pitch_sd numeric,
  add column head_roll_sd numeric,
  add column valid_frame_pct numeric,
  add column lighting_score numeric,
  add column calibration_stability numeric,
  add column completion_rate numeric,
  add column exam_duration_sec numeric,
  add column avg_fps integer,
  add column subject_age integer,
  add column subject_sex text,
  add column subject_id text;
