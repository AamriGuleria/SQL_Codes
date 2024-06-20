select t1.name from Employees t1
left join
select unique_id from EmployeeUNI 
on
t1.id=t2.id;