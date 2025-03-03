truncate table mytable;

insert into mytable (id, val) values (1, 150);
insert into mytable (id, val) values (2, 124);
insert into mytable (id, val) values (3, 666);

select Generate_insert(1) from dual;