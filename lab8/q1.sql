
--create table salary_raise(ID references instructor, raise_date date , raise_amt numeric(8,2));

DECLARE 
	CURSOR c(dname instructor.dept_name%type) IS SELECT instructor.ID, salary FROM instructor WHERE dept_name = dname;
	 inst_id instructor.ID%type;
	 inst_salary instructor.salary%type;
BEGIN 
OPEN c('&departmentname');
	 LOOP 
		FETCH c INTO inst_ID, inst_salary; 
		IF c %FOUND THEN UPDATE instructor SET salary = inst_salary*1.05 WHERE instructor.ID = inst_id ;
		INSERT INTO salary_raise VALUES(inst_id, sysdate, inst_salary * 0.05);
		ELSE exit;
		END IF ;
	 END LOOP; 
CLOSE c;
end;
/ 
		
	
