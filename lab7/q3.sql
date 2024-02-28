
set serveroutput on 
declare 
	doi Date;
	dor Date;
	sub number(2) := 0;
	fine number(3) := 0;
begin
	doi := '&date_of_issue';
	dor := '&date_of_return';
	sub := dor - doi;
	if (sub <=7) then
		fine := 0;
	elsif(sub>=8 and sub<15) then
		fine := sub*1;
	elsif(sub>=16 and sub<=30) then
		fine := sub*2;
	elsif(sub>30) then
		fine := sub*5;
	end if;
	dbms_output.put_line('Fine is : '|| fine);
end;
/
	
	