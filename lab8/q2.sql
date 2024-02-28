
set serveroutput on 
declare
	cursor c is select * from student order by tot_cred asc;
	stud_id student.ID%type;
	stud_name student.name%type;
	stud_dept_name student.dept_name%type;
	stud_tot_cred student.tot_cred%type;
begin
	open c;
	loop
		fetch c into stud_id , stud_name , stud_dept_name , stud_tot_cred;
		exit when c%rowcount = 10 or c%notfound;
		dbms_output.put_line(stud_id || ' ' ||stud_name|| ' ' || stud_dept_name || ' ' ||stud_tot_cred);
	end loop;
	close c;
end;
/
	

	