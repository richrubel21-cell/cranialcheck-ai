-- 0010 — anon DELETE for the admin "CLEAR ALL" button
--
-- UNVERIFIED — NO EVIDENCE THIS WAS EVER APPLIED (absent from RECOVERED_MIGRATIONS.sql too; the
-- recovered cleanup deletes were run in the SQL editor, not via the anon key). admin.html calls
-- sb.from('exams').delete() with the anon key, which only works with this grant + policy.
-- WARNING: this lets anyone holding the public anon key wipe the table. Skip this file if you'd
-- rather clear data from the Supabase dashboard.

grant delete on public.exams to anon;

drop policy if exists "anon can delete exams" on public.exams;
create policy "anon can delete exams"
  on public.exams for delete
  to anon
  using (true);
