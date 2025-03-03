CREATE OR REPLACE TRIGGER groups_autoincrement_trigger
BEFORE INSERT ON "GROUPS"
FOR EACH ROW
BEGIN
    IF :NEW.ID IS NULL THEN
        :NEW.ID := groups_sequence.NEXTVAL;
    END IF;
END;
