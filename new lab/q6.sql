set serveroutput on 
declare 
	maxm number(2,1) := 0;
	max_stud number(1);
	v_gpa number(2,1);
begin 
	for i in 1..5 loop
		select gpa into v_gpa
		from studenttable
		where rollno = i;
		if v_gpa > maxm then
			maxm := v_gpa;
			max_stud := i;
		end if;
	end loop;
	dbms_output.put_line('Student with maximum gpa is '|| 'Roll number' || max_stud);
end;
/
		