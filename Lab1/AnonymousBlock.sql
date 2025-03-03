DECLARE
    v_id NUMBER := 1;
BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO MyTable (id, val) VALUES (v_id, ROUND(DBMS_RANDOM.VALUE(1, 1000)));
        v_id := v_id + 1;
    END LOOP;
    COMMIT;
END;