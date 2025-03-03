CREATE OR REPLACE TRIGGER students_autoincrement_trigger
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF :NEW.ID IS NULL THEN
        :NEW.ID := students_sequence.NEXTVAL;
    END IF;
END;
