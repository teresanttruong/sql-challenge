-- table schemas

create table departments 
	(dept_no varchar(4) not null primary key,
	dept_name varchar(255) not null
	);

create table titles 
	(title_id varchar(5) not null primary key,
	title varchar(255) not null
	);

create table employees 
	(emp_no serial not null primary key,
	emp_title_id varchar(5) not null,
	birth_date date,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	sex varchar(1),
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id)
	);

create table salaries 
	(emp_no int not null,
	salary money not null,
	foreign key (emp_no) references employees(emp_no)
	);

create table dept_emp 
	(emp_no int not null,
	dept_no varchar(4) not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
	);

create table dept_manager 
	(dept_no varchar(4) not null,
	emp_no int not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
	);