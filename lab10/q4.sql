/*Create a transparent audit system for a table Client_master (client_no, name, 
address, Bal_due). The system must keep track of the records that are being 
deleted or updated. The functionality being when a record is deleted or modified 
the original record details and the date of operation are stored in the auditclient 
(client_no, name, bal_due, operation, userid, opdate) table, then the delete or 
update is allowed to go through.
*/


/*create table client_master(
    client_no number ,
    name varchar(100) ,
    address varchar(50) ,
    bal_due number);*/

/*create table auditclient (
    client_no number,
    name varchar(100),
    bal_due number,
    operation varchar2(10),
    userid varchar2(50),
    opdate date
);*/

set serveroutput on;

create or replace trigger ca_t
after delete or update on client_master
for each row
declare
    op varchar2(10);
begin
    if deleting then
        op := 'DELETE';
    else
        op := 'UPDATE';
    end if;

    insert into auditclient values (:old.client_no, :old.name, :old.bal_due, op, user, sysdate);
end;
/