CREATE OR REPLACE TRIGGER groups_autoincrement_trigger
BEFORE INSERT ON groups
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        :NEW.id := groups_sequence.NEXTVAL;
    END IF;
END;
