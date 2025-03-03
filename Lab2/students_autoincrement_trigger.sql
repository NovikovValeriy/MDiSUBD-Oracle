CREATE OR REPLACE TRIGGER students_autoincrement_trigger
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        :NEW.id := students_sequence.NEXTVAL;
    END IF;
END;
