CREATE OR REPLACE PACKAGE trigger_state AS
    cascade_delete_students_is_active BOOLEAN := FALSE;
END;