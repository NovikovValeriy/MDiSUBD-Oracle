CREATE OR REPLACE PROCEDURE Delete_Procedure(
    p_id NUMBER
) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM MyTable WHERE id = p_id;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: row rith с ID = ' || p_id || ' was not found.');
    ELSE
        DELETE FROM MyTable WHERE id = p_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Row deleted: ID = ' || p_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END Delete_Procedure;