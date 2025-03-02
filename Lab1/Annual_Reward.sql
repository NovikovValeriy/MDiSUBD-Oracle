CREATE OR REPLACE FUNCTION Annual_Reward(
    p_salary NUMBER,
    p_bonus_percent NUMBER
) RETURN NUMBER AS
    v_bonus_ratio NUMBER;
    v_total_compensation NUMBER;
BEGIN
    IF p_salary <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: salary cannot be negative.');
        RETURN NULL;
    ELSIF p_bonus_percent < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: bonus percent cannot be negative.');
        RETURN NULL;
    END IF;

    v_bonus_ratio := p_bonus_percent / 100;
    v_total_compensation := (1 + v_bonus_ratio) * 12 * p_salary;
    RETURN v_total_compensation;
EXCEPTION
    WHEN OTHERS THEN
    RETURN NULL;
END;