truncate table  mytable;

insert into mytable (id, val) values (1, 1);
insert into mytable (id, val) values (2, 2);
insert into mytable (id, val) values (3, 3);
insert into mytable (id, val) values (4, 4);

select check_even_odd() from dual;