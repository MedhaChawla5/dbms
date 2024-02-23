set serveroutput on 
declare 
	v_gpa number(2,1);
	v_grade varchar2(2);
begin
	for i in 1..5 loop
		select gpa into v_gpa
		from studenttable  
		where rollno = i;
		if v_gpa < 4 then
			v_grade := 'F';
			goto print_now;S
		elsif (v_gpa >=4 and v_gpa<5) then 
			v_grade := 'E';
			goto print_now;
		elsif (v_gpa >=5 and v_gpa<6) then 
			v_grade := 'D';
			goto print_now;
		elsif (v_gpa >=6 and v_gpa<7) then 
			v_grade := 'C';
			goto print_now;
		elsif (v_gpa >=7 and v_gpa<8) then 
			v_grade := 'B';
			goto print_now;
		elsif (v_gpa >=8 and v_gpa<9) then 
			v_grade := 'A';
			goto print_now;
		elsif (v_gpa >=9 and v_gpa<=10) then 
			v_grade := 'A+';
			goto print_now;
		end if;
	end loop;
<<print_now>>
dbms_output.put_line('Grade for student with rolln0' || i || ' is' || v_grade);
end;
/