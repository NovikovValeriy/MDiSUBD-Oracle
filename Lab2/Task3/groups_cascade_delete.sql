CREATE OR REPLACE TRIGGER groups_cascade_delete_trigger
BEFORE DELETE ON "GROUPS"
FOR EACH ROW
BEGIN
    trigger_state.cascade_delete_students_is_active := TRUE;
    DELETE FROM STUDENTS WHERE GROUP_ID = :OLD.ID;    
    trigger_state.cascade_delete_students_is_active := FALSE;
END;