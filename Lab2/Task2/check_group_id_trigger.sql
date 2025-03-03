CREATE OR REPLACE TRIGGER check_group_id
BEFORE INSERT ON "GROUPS"
FOR EACH ROW
DECLARE
    v_count number;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM "GROUPS"
    WHERE ID = :NEW.ID;

    IF v_count > 0 THEN
        raise_application_error(-20002, 'Group with such ID already exists.');
    END IF;
END check_group_id;