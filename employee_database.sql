-- Creating Employee table
CREATE TABLE employes (
    empid SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
  
);

-- Inserting data into Employee table
INSERT INTO employes (name, department, salary) VALUES
('Alice Smith', 'HR', 55000.00),
('Bob Johnson', 'HR', 55000.00),
('Charlie Brown', 'HR', 60000.00),
('David Lee', 'HR', 62000.00),
('Emma Watson', 'IT', 65000.00),
('Franklin Adams', 'IT', 70000.00),
('Grace Taylor', 'Finance', 75000.00),
('Henry Ford', 'Admin', 80000.00);

select * from employes;
-- Creating Department table
CREATE TABLE department (
    dep_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Inserting data into Department table
INSERT INTO department (department_name, location) VALUES
('HR', 'Headquarters'),
('Admin', 'Central Office'),
('IT', 'Tech Park'),
('Finance', 'Financial District'),
('Sales', 'Sales Complex'),
('Marketing', 'Marketing Hub');
select * from department;

-- Select all employees from the HR department:
select * from employes where department = 'HR';

-- Count the number of employees in each department:
select department, count(*) as total_employees from employes group by department;

-- Find employees with a salary greater than the average salary:
select * from employes where salary > (select avg(salary) from employes);

-- Find departments with more than 2 employees:
select  department from employes  group by department having count(*)>2;

-- List employees along with their department information:
select e.name, e.department, e.salary, d.location
from employes e
join department d
on e.department = d.department_name;

-- List all departments and their employees, even if there are no employees assigned:
select d.department_name, d.location, e.name, e.salary
from department d
left join employes e
on d.department_name = e.department;

-- Find the highest salary among all employees:
select max(salary)  as max_sal from employes;

-- Find the average salary for each department:
select *,avg(salary) over (partition by department) as avg_sal from employes;

-- Calculate the total salary for each department:
select *,sum(salary) over (partition by department) as total_sal from employes;

-- Rank employees by salary within each department:
select *,rank()  over (partition by department order by salary desc ) as rankk from employes;

-- Find the employee with the highest salary in each department:
select *,max(salary) over (partition by department) as max_sal from employes;

-- List employees whose names start with 'A':
select * from employes where name like 'A%';

-- Find employees with salaries between 60000 and 80000
select * from employes where salary between 60000 and 80000;

-- List departments located in 'Headquarters' or 'Tech Park':
select * from department where location in ('Headquarters', 'Tech Park');

-- Count the number of employees per character length of their name:
select length(name) as name_length, count(*) as total_employees
from employes group by length(name) order by name_length;

-- Find employees whose name contains 'son':
select * from employes where name like 'son%';

-- Find the employee with the lowest salary:
select min(salary)  as min_sal from employes;

-- Find employees whose department is not 'HR':
select * from employes where department <> 'HR';

-- List employees with a salary greater than 60000 and sorted by salary in descending order:
select * from employes where salary > 60000 order by salary desc;

-- List all employees along with their department and location, but only for departments with more than 1 employee:
select d.department_name, d.location, e.name, e.salary
from department d
join employes e
on d.department_name = e.department
where d.department_name in (
    select department
    from employes
    group by department
    having count(*) > 1
);

-- Find the department with the highest average salary among employees
select department, avg(salary) as avg_sal from employes
group by department
order by avg_sal desc;

-- List all employees who have the same salary as at least one other employee:
select * from employes
where salary in (
    select salary
    from employes
    group by salary
    having count(*) > 1
);

-- Find the employee(s) with the highest salary in each location:
select location, max(salary) as max_sal
from employes 
join department 
group by location;

-- list all departments and their average salary, sorted by avg salary descending
select 
    d.department_name, 
    d.location, 
    avg(e.salary) as avg_salary
from department d
join employes e
    on d.department_name = e.department
group by d.department_name, d.location
order by avg_salary desc;

-- Find the employee(s) with the highest salary who are not in the 'Admin' department:
select * from employes where department <> 'Admin'
and salary = (
    select max(salary)
    from employes
    where department <> 'Admin'
);

-- Find the employee(s) with the second-highest salary:
select * from employes order by salary desc limit 1 offset 1;



select * from employes;
