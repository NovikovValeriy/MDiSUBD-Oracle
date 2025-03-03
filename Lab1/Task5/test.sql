truncate table mytable;

call Create_Procedure(1, 10);
call Create_Procedure(2, 20);
call Create_Procedure(3, 30);

select * from mytable;

call Update_Procedure(3, 300);

select * from mytable;

call Delete_Procedure(2);

select * from mytable;