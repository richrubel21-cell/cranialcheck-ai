-- 0003 — data-quality fields + oculomotor metric columns
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 3.
-- NOTE: none of these columns are written or read by the current code (no commit ever used them).

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
