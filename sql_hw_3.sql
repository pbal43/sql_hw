-- для удобства создадим интегрированную таблицу (действует только если задействованы все 5 таблиц)

create table integra as (
select employee_name, role_name, monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id);

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary
from employees
inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name
from employees
inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary
from salary
left join
(select *
from employee_salary
inner join employees
on employees.id = employee_salary.id
) a
on salary.id = a.salary_id
where a.salary_id is null;
--ИЛИ
select monthly_salary
from salary
except
(select monthly_salary
from salary
inner join employee_salary
on salary.id = employee_salary.salary_id
inner join employees
on employees.id = employee_salary.employee_id);
-- или
select monthly_salary 
from salary
left join employee_salary
on salary.id = employee_salary.salary_id 
where employee_salary.employee_id is null; 

-- 4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary
from salary
left join
(select *
from employee_salary
inner join employees
on employees.id = employee_salary.id
) a
on salary.id = a.salary_id
where a.salary_id is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name
from employees
except
(select employee_name
from employees
inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id);

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%Java_%';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%QA%' and role_name like '%Manual%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%QA%' and role_name like '%Auto%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary
from integra
where role_name like '%Juni%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary
from integra
where role_name like '%Middl%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Senio%';

-- 15. Вывести зарплаты Java разработчиков

select monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Java_devel%';

-- 16. Вывести зарплаты Python разработчиков

select monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Pyth%devel%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Jun%Pyth%devel%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Mid%JavaSc%devel%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Seni%Java_devel%';

-- 20. Вывести зарплаты Junior QA инженеров

select monthly_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%Jun%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as avg_salary
from integra
where role_name like '%Jun%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as summ_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%JavaS%dev%';

-- 23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as min_salary
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles.id = roles_employee.role_id
inner join employee_salary
on employee_salary.employee_id = employees.id
inner join salary
on salary.id = employee_salary.salary_id
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as max_salary
from integra
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(employee_name)
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(employee_name)
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles_employee.role_id = roles.id
where role_name like '%Midd%';

-- 27. Вывести количество разработчиков

select count(employee_name)
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles_employee.role_id = roles.id
where role_name like '%dev%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) as summ_salary
from integra
where role_name like '%dev%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию (чего? сделал по зп)

select *
from integra
order by monthly_salary asc;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300 (сделаю включительно)

select *
from integra
where monthly_salary between 1700 and 2300
order by monthly_salary asc;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select *
from integra
where monthly_salary < 2300
order by monthly_salary asc;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select *
from integra
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;
