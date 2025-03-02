CREATE OR REPLACE PROCEDURE Update_Procedure(
    p_id NUMBER,
    p_new_val NUMBER
) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM MyTable WHERE id = p_id;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: row with ID = ' || p_id || ' was not found.');
    ELSE
        UPDATE MyTable SET val = p_new_val WHERE id = p_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Row updated: ID = ' || p_id || ', VAL = ' || p_new_val);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END Update_Procedure;