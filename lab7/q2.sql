set serveroutput on 
declare 
	v_roll number(1);
	v_gpa number(2,1);
begin
	v_roll :='&rollnumber';
	select gpa into v_gpa
	from studenttable  
	where rollno = v_roll;
	if v_gpa < 4 then
		dbms_output.put_line('Grade = '|| 'F');
	elsif (v_gpa >=4 and v_gpa<5) then 
		dbms_output.put_line('Grade = '|| 'E');
	elsif (v_gpa >=5 and v_gpa<6) then 
		dbms_output.put_line('Grade = '|| 'D');
	elsif (v_gpa >=6 and v_gpa<7) then 
		dbms_output.put_line('Grade = '|| 'C');
	elsif (v_gpa >=7 and v_gpa<8) then 
		dbms_output.put_line('Grade = '|| 'B');
	elsif (v_gpa >=8 and v_gpa<9) then 
		dbms_output.put_line('Grade = '|| 'A');
	elsif (v_gpa >=9 and v_gpa<=10) then 
		dbms_output.put_line('Grade = '|| 'A+');
	end if;
end;
/