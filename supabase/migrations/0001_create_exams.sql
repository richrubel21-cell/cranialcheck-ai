-- 0001 — base exams table
-- Matches commit 45e7b03 (2026-06-21 09:00) "feat: Supabase integration + admin dashboard".
--
-- RECONSTRUCTED, not verified against original. No SQL from the original session survives.
-- Column NAMES come verbatim from the insert payload in cranialcheck-demo.html @ 45e7b03.
-- Column TYPES, defaults and the id/created_at columns are inferred from how the code uses them:
--   * admin.html deletes with .neq('id','00000000-0000-0000-0000-000000000000') → id is uuid
--   * admin.html / fetchPrevExam order by created_at → timestamptz default now()
--   * confidence = Math.round(...*100) → integer 0-100

create extension if not exists pgcrypto;

create table if not exists public.exams (
  id              uuid primary key default gen_random_uuid(),
  created_at      timestamptz not null default now(),

  exam_mode       text,        -- hardcoded 'TRIAGE' until 6cac781; now TRIAGE/ACUTE/EXTENDED/FIELD
  overall_result  text,        -- CLEAR / WATCH / URGENT / INVALID / ERROR ...
  confidence      integer,     -- 0-100

  perclos_label   text, perclos_metric text, perclos_flag text,
  cn7_label       text, cn7_metric     text, cn7_flag     text,
  gcs_label       text, gcs_metric     text, gcs_flag     text,   -- GCS step since retired; code still sends nulls
  tongue_label    text, tongue_metric  text, tongue_flag  text,
  head_label      text, head_metric    text, head_flag    text
);

-- RECONSTRUCTED: RLS assumed on (the 0004/0005 fixes only make sense if it was).
alter table public.exams enable row level security;
