
declare 
	v_gpa number(2,1);
begin
	for i in 1..5 loop
		select gpa into v_gpa
		from studenttable  
		where rollno = i;
		if v_gpa < 4 then
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'F');
		elsif (v_gpa >=4 and v_gpa<5) then 
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'E');
		elsif (v_gpa >=5 and v_gpa<6) then 
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'D');
		elsif (v_gpa >=6 and v_gpa<7) then 
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'C');
		elsif (v_gpa >=7 and v_gpa<8) then 
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'B');
		elsif (v_gpa >=8 and v_gpa<9) then 
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'A');
		elsif (v_gpa >=9 and v_gpa<=10) then 
			dbms_output.put_line('Grade for student with rolln0 ' || i || ' is' || 'A+');
		end if;
	end loop;
end;
/