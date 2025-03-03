CREATE OR REPLACE PROCEDURE Create_Procedure(
    p_id NUMBER,
    p_val NUMBER
) AS
BEGIN
    INSERT INTO MyTable (id, val) VALUES (p_id, p_val);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Row added: ID = ' || p_id || ', VAL = ' || p_val);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: row with ID = ' || p_id || ' already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END Create_Procedure;