/*3. Based on the University Schema, write a database trigger on Instructor that checks 
the following:
 The name of the instructor is a valid name containing only alphabets.
 The salary of an instructor is not zero and is positive
 The salary does not exceed the budget of the department to which the 
instructor belongs.*/

set serveroutput on;
create or replace Trigger q3t 
before insert or update on instructor
for each row
declare
    bud number;
begin
    if not regexp_like(:new.name , '^[A-Za-z]+$') then
        dbms_output.put_line('Invalid instructor name. Name should contain only alphabets.');
    end if;

    if :new.salary < 0 then 
        dbms_output.put_line('Salary must be positive');
    end if;
    
    select budget into bud from department where dept_name = :new.dept_name;

    if(:new.salary > bud) then
        dbms_output.put_line('Salary exceeds budget of the department');

    end if;
end;
/


