CREATE TABLE Groups (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    c_val NUMBER,
    CONSTRAINT check_c_val CHECK ( c_val >= 0 )
);

CREATE TABLE Students (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    group_id NUMBER,
    CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES GROUPS (id)
);