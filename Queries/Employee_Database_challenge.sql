
----------------------------------------------DELIVERABLE 1-------------------------------------------

select e.emp_no,e.first_name,e.last_name, t.title,t.from_date,t.to_date
into retirement_titles
from employees as e
join titles as t on e.emp_no = t.emp_no
where (e.birth_date between '01/01/1952' and '12/31/1955')
order by e.emp_no;

select * from retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(emp_no) as count,title 
into retiring_titles
from unique_titles
group by title
order by count desc;

----------------------------------DELIVERABLE 2----------------------------------------------

select distinct on (e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date,t.title
into mentorship_eligibilty
from employees as e join dept_emp as d on
e.emp_no = d.emp_no
join titles as t on
e.emp_no = t.emp_no
where (e.birth_date between '01/01/1965' and '12/31/1965')
and d.to_date = '1/1/9999'
order by e.emp_no;

-----------------------------------DELIVERABLE 3-------------------------------------------------

select u.emp_no,u.first_name,u.last_name,u.title,d.dept_no,de.dept_name
into titles_dept
from unique_titles as u left join dept_emp as d on
u.emp_no = d.emp_no and d.to_date = '1/1/9999'
left join departments as de
on de.dept_no = d.dept_no
order by u.emp_no;

select count(emp_no) as count_emp,dept_name
into emp_count_dept
from titles_dept
group by dept_name
order by count_emp;


select m.emp_no,m.first_name,m.last_name,m.birth_date,m.from_date,m.to_date,m.title,d.dept_no,de.dept_name
into mentorship_dept
from mentorship_eligibilty as m left join dept_emp as d
on m.emp_no = d.emp_no
and m.from_date = d.from_date
and m.to_date = d.to_date
left join departments as de
on d.dept_no = de.dept_no
order by emp_no;

select count (emp_no) as count, dept_name
into mentorship_dept_count
from mentorship_dept
group by dept_name
order by count ;





