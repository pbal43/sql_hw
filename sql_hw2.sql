--1) —оздать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name varchar(50) not null
);


--2) Ќаполнить таблицу employees 70 строками. (сделаем через пайтон)

--import psycopg2
--import names
--import random
--
--conn = psycopg2.connect(dbname = 'qa_ddl_26_51',
--                        user = 'padawan_user_51',
--                        password = '123',
--                        host = '159.69.151.133',
--                        port = '5056')
--
--cursor = conn.cursor()
--
--# заполним именами таблицу employees
--for i in range(0,70):
--    if conn:
--        print('connected')
--        name = names.get_first_name()
--        q_values = "'" + name + "'"
--        create_query = 'insert into public.employees(' \
--                       'employee_name)' \
--                       'values (' + q_values + ')'
--        cursor.execute(create_query)
--        conn.commit()
--cursor.close()
--conn.close()

--3)	—оздать таблицу salary (но она уже была и заполнена ненужными данными. пропишем команду, как создать таблицу,
--затем удалим колонку и добавим колонку (помен€ть на NULL нельз€), после чего заполним)
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

-- 4)	Ќаполнить таблицу salary 15 строками (сделаем вручную):
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);

--5)	—оздать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--6)	Ќаполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id, salary_id)
values (3, 7),
	   (1, 4),
	   (5, 9),
	   (40, 13),
	   (23, 4),
	   (11, 2),
	   (52, 10),
	   (15, 13),
	   (26, 4),
	   (16, 1),
	   (33, 7),
	   (71, 3),
	   (72, 8),
	   (73, 9),
	   (74, 10),
	   (75, 11),
	   (76, 12),
	   (77, 13),
	   (78, 14),
	   (79, 15),
	   (80, 16),
	   (2, 9),
	   (4, 10),
	   (6, 11),
	   (7, 15),
	   (8, 16),
	   (9, 9),
	   (10, 10),
	   (12, 11),
	   (13, 9),
	   (14, 10),
	   (17, 11),
	   (18, 15),
	   (19, 16),
	   (20, 9),
	   (21, 1),
	   (22, 2),
	   (24, 5),
	   (25, 7),
	   (28, 8);

-- 7)	—оздать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique

create table roles(
id serial primary key,
role_name int not null unique
);

--8)	ѕомен€ть тип столба role_name с int на varchar(30)

alter table roles 
alter column role_name type varchar(30) using role_name::varchar(30);

--9)	Ќаполнить таблицу roles 20 строками
insert into roles(role_name)
values ('Junior_Python_developer'),
	   ('Middle_Python_developer'),
	   ('Senior_Python_developer'),
	   ('Junior_Java_developer'),
	   ('Middle_Java_developer'),
	   ('Senior_Java_developer'),
	   ('Junior_JavaScript_developer'),
	   ('Middle_JavaScript_developer'),
	   ('Senior_JavaScript_developer'),
	   ('Junior_Manual_QA_engineer'),
	   ('Middle_Manual_QA_engineer'),
	   ('Senior_Manual_QA_engineer'),
	   ('Project_Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales_manager'),
	   ('Junior_Automation_QA_engineer'),
	   ('Middle_Automation_QA_engineer'),
	   ('Senior_Automation_QA_engineer');

--10)	—оздать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ дл€ таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ дл€ таблицы roles, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

--11)	Ќаполнить таблицу roles_employee 40 строками

insert into roles_employee(employee_id, role_id)
values  (7, 2),
		(20, 4),
		(3, 9),
 		(5, 13),
 		(23, 4),
 		(11, 2),
 		(10, 9),
 		(22, 13),
 		(21, 3),
		(34, 4),
		(6, 7),
		(1, 2),
		(2, 4),
		(4, 9),
 		(8, 9),
 		(9, 4),
 		(12, 2),
 		(13, 9),
 		(14, 18),
 		(15, 11),
		(16, 15),
		(17, 7),
		(18, 2),
		(19, 5),
		(39, 8),
 		(40, 14),
 		(24, 4),
 		(25, 9),
 		(26, 9),
 		(27, 16),
 		(28, 8),
		(29, 7),
		(30, 11),
		(31, 19),
		(32, 17),
		(33, 18),
 		(35, 13),
 		(36, 19),
 		(37, 2),
 		(38, 20);
