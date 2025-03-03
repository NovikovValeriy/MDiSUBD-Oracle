CREATE OR REPLACE TRIGGER groups_check_unique_name_trigger
BEFORE INSERT OR UPDATE ON groups
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM groups WHERE NAME = :NEW.NAME;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error: Group with such name already exists');
    END IF;
END;