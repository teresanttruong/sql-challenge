--data analysis queries

--list all employees: employee number, last, first, sex, salary
select e.emp_no, e.last_name, e.first_name, e.sex , s.salary from employees as e
left join salaries as s on e.emp_no = s.emp_no
;

--list employees first, last, hire date for those hired in 1986
select first_name, last_name, hire_date from employees where extract('year' from hire_date) = 1986
;

--list the managers, department number, name, employee number, last, first
select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name from departments as d
left join dept_manager on d.dept_no = dept_manager.dept_no
left join employees as e on dept_manager.emp_no = e.emp_no
;

--list department number for each employee, employee number, last, first, department name
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees as e
left join dept_emp on dept_emp.emp_no = e.emp_no
left join departments as d on dept_emp.dept_no = d.dept_no
;

--first, last, & sex for each employee where first = 'Hercules' & last starts with 'B'
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%'
;

--list of all employees in 'Sales' employee number, last, first
select e.emp_no, e.last_name, e.first_name from employees as e where e.emp_no in
	(select j.emp_no from dept_emp as j where j.dept_no in
		(select d.dept_no from departments as d where d.dept_name = 'Sales')
	);

--list all employees in 'Sales' & 'Development' employee number, last, first, department name
select e.emp_no, e.last_name, e.first_name, d.dept_name from employees as e
left join dept_emp as j on e.emp_no = j.emp_no
	left join departments as d on j.dept_no = d.dept_no where e.emp_no in 
	(select j.emp_no from dept_emp where j.dept_no in 
		(select d.dept_no from departments where d.dept_name = 'Sales' or d.dept_name = 'Development')
	);

--frequency counts in descending order of all employee last names
select last_name, count(last_name) as "frequency" from employees
group by last_name
order by count(last_name) desc
;