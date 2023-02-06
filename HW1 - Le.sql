#Q1, how many employees are there?
Select * from employees limit 10;
Select * from departments; 
Select last_name, title from employees, titles limit 100; #did not have to link together for simple joins and workbench does it automatically

Select salary from salaries limit 100;
#ORDER by salary DESC;

#avg salary for employees for marketing department --> match employees to department and match through the employee table 

# 1. Write SQL Code to count the number of employees – 1 pts
Select count(*) from employees;

#2. Write SQL Code to output the current name of all of the departments -2 pts
Select * from departments;

# 3. How many employees are in Finance? -2 pts

select count(*)
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no 
join departments
on departments.dept_no = dept_emp.dept_no
where dept_name = 'Finance';


#4. How many women work in development? – 3 pts --> 37 min
select employees.gender, departments.dept_name, count(*)
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no 
join departments
on departments.dept_no = dept_emp.dept_no
where dept_name = 'Development' AND gender = 'F';


#5. What is the top salary in the company? 3 pts
select max(salary) from salaries;

#6. What is the average salary for Marketing? 4 pts
select AVG(salary)
from salaries 
join dept_emp
on salaries.emp_no = dept_emp.emp_no
join departments
on departments.dept_no = dept_emp.dept_no
where dept_name = 'Marketing';








#7. What is the lowest salary in the company, who is it and what is their title and department? 5 pts

select employees.first_name, employees.last_name, titles.title, department.dept_name
from employees
join salaries
on employees.emp_no = salaries.emp_no
join dept_emp
on dept_emp.dept_no = salaries.emp_no
join titles
on titles.emp_no = dept_emp.emp_no
where salaries.salary = min(salary)

select min(salary) from salaries;
#link salary through employee& titel with emp_no, then link departments with dept_emp through dept_no
#8. Who is the oldest person at the company and what is their age? 5 pts

select first_name, last_name, birth_date
from employees
where birth_date = select(max(birth_date);
