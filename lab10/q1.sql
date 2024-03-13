/*create table lct (
      Time_Of_Change TIMESTAMP,
      id number,
      course_id varchar(10),
      sec_id varchar(10),
      semester varchar(10),
      year number,
      grade varchar(2)
   );*/

set serveroutput on;
create or replace trigger lct_t
after insert or update or delete on takes
for each row
declare
	toc timestamp := systimestamp;
begin
	if inserting then
		insert into lct values(toc,:NEW.id, :NEW.course_id, :NEW.sec_id, :NEW.semester, :NEW.year, :NEW.grade);
	elsif updating then
		insert into lct values(toc,:OLD.ID, :OLD.course_id, :OLD.sec_id, :OLD.semester, :OLD.year, :OLD.grade);
	elsif deleting then
		insert into lct values(toc,:OLD.ID, :OLD.course_id, :OLD.sec_id, :OLD.semester, :OLD.year, :OLD.grade);
	end if;
end;
/

--update takes set grade = 'A' where id = '00128';