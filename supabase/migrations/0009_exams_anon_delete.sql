-- 0009 — anon DELETE for the admin "CLEAR ALL" button
--
-- UNVERIFIED — NO EVIDENCE THIS WAS EVER APPLIED. admin.html (since 45e7b03) calls
-- sb.from('exams').delete() with the anon key, which needs this grant + policy to work, but no
-- commit or prompt mentions it. Included so a restored project matches what the code expects.
-- WARNING: this lets anyone holding the public anon key wipe the table. Skip this file if you'd
-- rather clear data from the Supabase dashboard.

grant delete on table public.exams to anon;

drop policy if exists "anon can delete exams" on public.exams;
create policy "anon can delete exams"
  on public.exams for delete
  to anon
  using (true);
