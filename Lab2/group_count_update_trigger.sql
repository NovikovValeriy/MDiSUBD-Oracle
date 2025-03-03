CREATE OR REPLACE TRIGGER group_count_update_trigger
AFTER INSERT OR UPDATE OR DELETE ON STUDENTS
FOR EACH ROW
BEGIN
    IF NOT trigger_state.cascade_delete_students_is_active THEN
        IF INSERTING THEN
            UPDATE GROUPS
            SET C_VAL = C_VAL + 1
            WHERE ID = :NEW.GROUP_ID;
        ELSIF UPDATING THEN
            IF :OLD.GROUP_ID != :NEW.GROUP_ID THEN
                UPDATE GROUPS
                SET C_VAL = C_VAL - 1
                WHERE ID = :OLD.GROUP_ID;
    
                UPDATE GROUPS
                SET C_VAL = C_VAL + 1
                WHERE ID = :NEW.GROUP_ID;
            END IF;
        ELSIF DELETING THEN
            UPDATE GROUPS
            SET C_VAL = C_VAL - 1
            WHERE ID = :OLD.GROUP_ID;
        END IF;
    END IF;
END;