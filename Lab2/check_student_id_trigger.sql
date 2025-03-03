CREATE OR REPLACE TRIGGER check_student_id
BEFORE INSERT ON students
FOR EACH ROW
DECLARE
    v_count number;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM students
    WHERE id = :NEW.id;

    IF v_count > 0 THEN
        raise_application_error(-20002, 'Student with such ID already exists.');
    END IF;
END check_student_id;

