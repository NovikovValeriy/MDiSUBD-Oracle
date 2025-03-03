create or replace trigger groups_cascade_delete
before delete on groups
for each row
begin
    delete from students where group_id = :old.id;
end groups_cascade_delete;