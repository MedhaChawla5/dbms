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
			update studenttable set lettergrade = v_grade where rollno = i;
		elsif (v_gpa >=4 and v_gpa<5) then 
			v_grade := 'E';
			update studenttable set lettergrade = v_grade where rollno = i;
		elsif (v_gpa >=5 and v_gpa<6) then 
			v_grade := 'D';
			update studenttable set lettergrade = v_grade where rollno = i;
		elsif (v_gpa >=6 and v_gpa<7) then 
			v_grade := 'C';
			update studenttable set lettergrade = v_grade where rollno = i;
		elsif (v_gpa >=7 and v_gpa<8) then 
			v_grade := 'B';
			update studenttable set lettergrade = v_grade where rollno = i;
		elsif (v_gpa >=8 and v_gpa<9) then 
			v_grade := 'A';
			update studenttable set lettergrade = v_grade where rollno = i;
		elsif (v_gpa >=9 and v_gpa<=10) then 
			v_grade := 'A+';
			update studenttable set lettergrade = v_grade where rollno = i;
		end if;
	end loop;
end;
/
	