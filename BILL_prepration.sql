use  billing_client_prepration;

show tables;

desc employee;



alter table employeee_work
add employee_id int ;



alter table employeee_work
add foreign key (employee_id) references employee(employee_id);

alter table employeee_work
add client_id int ;

alter table employeee_work
add foreign key (client_id) references client(client_id);

desc employeee_work;

alter table employeee_work
add foreign key (client_id) references client(client_id)
on update cascade
on delete cascade;

alter table employeee_work
add foreign key (employee_id) references employee(employee_id)
on update cascade
on delete cascade;

insert into client(client_name,client_region,GST)
values('yash','gujrat',10);

select* from  client;

insert into employee(employee_name,employee_rate)
values('james','100');

select * from employee;

insert into employeee_work(client_name,Working_day,Working_hours)
values('bill',2/2/2012,8);

select SUM(Working_hours) AS total_WorkingHours FROM employeee_work
where client_name='bill';

alter table employeee_work
modify column employee_id int not null;
