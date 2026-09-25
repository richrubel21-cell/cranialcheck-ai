-- 0001 — base table + RLS + anon insert/select policies (June 21)
-- VERBATIM from RECOVERED_MIGRATIONS.sql, MIGRATION 1 (recovered from Claude conversation history).

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
