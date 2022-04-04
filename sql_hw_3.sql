-- ��� �������� �������� ��������������� ������� (��������� ������ ���� ������������� ��� 5 ������)

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

--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

select employee_name, monthly_salary
from employees
inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.

select employee_name
from employees
inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id
where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

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
--���
select monthly_salary
from salary
except
(select monthly_salary
from salary
inner join employee_salary
on salary.id = employee_salary.salary_id
inner join employees
on employees.id = employee_salary.employee_id);
-- ���
select monthly_salary 
from salary
left join employee_salary
on salary.id = employee_salary.salary_id 
where employee_salary.employee_id is null; 

-- 4. ������� ��� ���������� ������� ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

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

-- 5. ����� ���� ���������� ���� �� ��������� ��.

select employee_name
from employees
except
(select employee_name
from employees
inner join employee_salary
on employees.id = employee_salary.employee_id
inner join salary
on salary.id = employee_salary.salary_id);

-- 6. ������� ���� ���������� � ���������� �� ���������.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id;

-- 7. ������� ����� � ��������� ������ Java �������������.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%Java_%';

-- 8. ������� ����� � ��������� ������ Python �������������.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%Python%';

-- 9. ������� ����� � ��������� ���� QA ���������.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%QA%';

-- 10. ������� ����� � ��������� ������ QA ���������.

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%QA%' and role_name like '%Manual%';

-- 11. ������� ����� � ��������� ��������������� QA

select employee_name, role_name
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id 
inner join roles
on roles.id = roles_employee.role_id
where role_name like '%QA%' and role_name like '%Auto%';

-- 12. ������� ����� � �������� Junior ������������

select employee_name, monthly_salary
from integra
where role_name like '%Juni%';

-- 13. ������� ����� � �������� Middle ������������

select employee_name, monthly_salary
from integra
where role_name like '%Middl%';

-- 14. ������� ����� � �������� Senior ������������

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

-- 15. ������� �������� Java �������������

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

-- 16. ������� �������� Python �������������

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

-- 17. ������� ����� � �������� Junior Python �������������

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

-- 18. ������� ����� � �������� Middle JS �������������

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

-- 19. ������� ����� � �������� Senior Java �������������

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

-- 20. ������� �������� Junior QA ���������

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

-- 21. ������� ������� �������� ���� Junior ������������

select avg(monthly_salary) as avg_salary
from integra
where role_name like '%Jun%';

-- 22. ������� ����� ������� JS �������������

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

-- 23. ������� ����������� �� QA ���������

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

-- 24. ������� ������������ �� QA ���������

select max(monthly_salary) as max_salary
from integra
where role_name like '%QA%';

-- 25. ������� ���������� QA ���������

select count(employee_name)
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 26. ������� ���������� Middle ������������.

select count(employee_name)
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles_employee.role_id = roles.id
where role_name like '%Midd%';

-- 27. ������� ���������� �������������

select count(employee_name)
from employees
inner join roles_employee
on roles_employee.employee_id = employees.id
inner join roles
on roles_employee.role_id = roles.id
where role_name like '%dev%';

-- 28. ������� ���� (�����) �������� �������������.

select sum(monthly_salary) as summ_salary
from integra
where role_name like '%dev%';

-- 29. ������� �����, ��������� � �� ���� ������������ �� ����������� (����? ������ �� ��)

select *
from integra
order by monthly_salary asc;

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300 (������ ������������)

select *
from integra
where monthly_salary between 1700 and 2300
order by monthly_salary asc;

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select *
from integra
where monthly_salary < 2300
order by monthly_salary asc;

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select *
from integra
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;
