CREATE OR REPLACE TRIGGER check_student_id
BEFORE INSERT ON "STUDENTS"
FOR EACH ROW
DECLARE
    v_count number;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM "STUDENTS"
    WHERE ID = :NEW.ID;

    IF v_count > 0 THEN
        raise_application_error(-20002, 'Student with such ID already exists.');
    END IF;
END check_student_id;

