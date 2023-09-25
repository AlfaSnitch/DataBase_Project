--inserting
prompt inserting into table employee
set serveroutput on
declare 
eid employee.employe_id%type:=7;
name employee.name%type:='demo';
email employee.email%type:= 'demooo@gmail.com';
jd employee.join_date%type:=date'2022-04-01';
salary employee.salary%type:=20000;
phone employee.phone_no%type:='0198920';
status employee.employe_status%type:='regular';
begin
insert into employee values(eid,name,email,jd,salary,phone,status);
end;
/

--cursor and loop
prompt plsql command to get customer details using cursors
set serveroutput on
declare
cid customer.customer_id%type;
customer_name customer.name%type;
customer_mail customer.email%type;
cursor c is select cid,name,email from customer;
begin
open c;
fetch c into cid,customer_name,customer_mail;
while c%found loop
dbms_output.put_line('Id: '||cid||' Name: '||customer_name||' Mail: '||customer_mail);
dbms_output.put_line('--------------------------------------------------------------');
fetch c into cid,customer_name,customer_mail;
end loop;
close c;
end;
/

/*
--updating status of  the customer
set serveroutput on
declare
cid customer.customer_id%type:=1;
points customer.loyalty_points%type;
status customer.membership_status%type;
begin
select loyalty_points into points from customer where customer_id = cid;
if points>=1000 then 
    status:='gold';
elsif points>=500 then
    status:='silver';
else
    status:='bronze';
end if;

update customer set membership_status = status
where customer_id = cid;
dbms_output.put_line('Membership status has been updated to '||status);
end;
/
*/
-- procedure to update status of a customoer based on loyalty points
set serveroutput on
drop function fun;
create or replace function fun(var1 in int) return varchar2 is -- var1 is customer_is
value customer.membership_status%type;
declare
points customer.loyalty_points%type;
st customer.membership_status%type;
begin
    select membership_status,loyalty_points into value,points from customer where customer_id=var1;
    if points>=1000 then 
        value:='gold';
    elsif points>=500 then
        value:='silver';
    else
        value:='bronze';
    end if;
    --update the value
    update customer set membership_status = value
    where customer_id = var1;
    return status;
end;
/
