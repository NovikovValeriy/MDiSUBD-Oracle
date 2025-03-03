CREATE OR REPLACE FUNCTION Generate_Insert(id_in NUMBER) RETURN VARCHAR2 IS
    v_val NUMBER;
    result VARCHAR2(200);
BEGIN
    SELECT val INTO v_val FROM MyTable WHERE id = id_in;
    result := 'INSERT INTO MyTable (id, val) VALUES (' || id_in || ', ' || v_val || ');';
    RETURN result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        return 'Error: ID ' || id_in || ' is not found in MyTable.';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
