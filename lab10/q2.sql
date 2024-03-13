/*Based on the University database schema in Lab: 2, write a row trigger to insert 
the existing values of the Instructor (ID, name, dept-name, salary) table into a new 
table Old_ Data_Instructor (ID, name, dept-name, salary) when the salary table is 
updated.*/

--create table odi(id number(5), name varchar(20) , dept_name varchar(20) , salary numeric(8,2));

set serveroutput on;
create or replace trigger odi_t
before update of salary on instructor
for each row
begin
    insert into odi values(:OLD.id , :OLD.name, :OLD.dept_name , :OLD.salary);
end;
/

-- update instructor set salary = 1.1* salary where dept_name = 'Comp. Sci.';