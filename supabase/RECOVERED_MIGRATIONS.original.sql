-- ============================================================
-- CranialCheck AI — exams table — full recovered migration history
-- Recovered from Claude conversation history (verbatim quotes), Sept 25 2026.
-- Apply IN ORDER to a fresh Supabase project. All statements below are as
-- originally sent/run — none are guessed reconstructions.
-- ============================================================

-- ── MIGRATION 1 (original, June 21) — base table + RLS ──
create table exams (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default now(),
  exam_mode text,
  overall_result text,
  confidence integer,
  perclos_label text,
  perclos_metric text,
  perclos_flag text,
  cn7_label text,
  cn7_metric text,
  cn7_flag text,
  gcs_label text,
  gcs_metric text,
  gcs_flag text,
  tongue_label text,
  tongue_metric text,
  tongue_flag text,
  head_label text,
  head_metric text,
  head_flag text,
  device_info text,
  session_id text
);

alter table exams enable row level security;

create policy "Allow anon insert" on exams
  for insert to anon with check (true);

create policy "Allow anon select" on exams
  for select to anon using (true);

-- ── MIGRATION 2 — raw numeric values + subject metadata ──
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

-- ── MIGRATION 3 — data-quality fields + oculomotor metric columns
--    (eye-tracking reporting standard; built ahead of the real 6-task exam) ──
alter table exams
  -- Data-quality fields (eye-tracking reporting standard)
  add column data_loss_pct numeric,
  add column perclos_loss_pct numeric,
  add column pursuit_loss_pct numeric,
  add column cn7_loss_pct numeric,
  add column tongue_loss_pct numeric,
  add column head_loss_pct numeric,
  add column video_width integer,
  add column video_height integer,
  add column calibration_accuracy numeric,
  add column calibration_precision numeric,
  add column blink_count integer,
  add column blink_ratio numeric,
  -- Per-task validity flags (was the task actually performed)
  add column pursuit_performed boolean,
  add column smile_performed boolean,
  add column brow_performed boolean,
  add column teeth_performed boolean,
  add column tongue_performed boolean,
  add column speech_performed boolean,
  -- Session / clinical metadata
  add column camera_distance_cm numeric,
  add column ambient_lighting numeric,
  -- Oculomotor metrics (for the real 6-task exam)
  add column pursuit_gain numeric,
  add column catchup_saccade_count integer,
  add column pursuit_latency_ms numeric,
  add column reversal_latency_ms numeric,
  add column convergence_stability numeric,
  add column brow_asymmetry numeric,
  add column smile_asymmetry numeric,
  add column teeth_asymmetry numeric,
  add column tongue_deviation_deg numeric,
  add column speech_words_matched integer,
  add column speech_rate_wpm numeric,
  add column speech_score numeric;

-- ── MIGRATION 4 — speech_* summary columns (Phase 2: speech motor battery) ──
alter table public.exams
  add column if not exists speech_label  text,
  add column if not exists speech_metric text,
  add column if not exists speech_flag   text,
  add column if not exists speech_value  numeric;

-- ── MIGRATION 5 — anon insert grant/policy fix + pursuit_*/saccades_* columns ──
-- 1) enable writes
grant insert on public.exams to anon;
drop policy if exists "anon can insert exams" on public.exams;
create policy "anon can insert exams" on public.exams for insert to anon with check (true);

-- 2) add missing columns
alter table public.exams
  add column if not exists pursuit_label   text,
  add column if not exists pursuit_metric  text,
  add column if not exists pursuit_flag    text,
  add column if not exists pursuit_value   numeric,
  add column if not exists saccades_label  text,
  add column if not exists saccades_metric text,
  add column if not exists saccades_flag   text,
  add column if not exists saccades_value  numeric;

-- ── MIGRATION 6 — domains_json (Phase 3: full CN coverage, no more per-column migrations) ──
alter table public.exams add column if not exists domains_json jsonb;

-- ── MIGRATION 7 — diag_json (Phase 4/5: full run-diagnostics snapshot) ──
alter table public.exams add column if not exists diag_json jsonb;

-- ============================================================
-- Data-cleanup statements that were run alongside migrations (optional,
-- not schema-relevant — include only if you want to replicate the same
-- housekeeping on the new project once real data exists):
--
-- delete from public.exams where overall_result='INVALID';
-- delete from public.exams where device_info ilike '%HeadlessChrome%';
-- delete from public.exams where device_info in ('__verify_save__','__diag_probe__')
--    or device_info ilike '%HeadlessChrome%';
-- ============================================================
