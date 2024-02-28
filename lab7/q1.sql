set serveroutput on 
declare 
	v_roll number(1);
	v_gpa number(2,1);
begin
	v_roll :='&rollnumber';
	select s.gpa into v_gpa
	from studenttable s 
	where s.rollno = v_roll;
	dbms_output.put_line('GPA for student with roll number '|| v_roll || ' is ' || v_gpa);
end;
/