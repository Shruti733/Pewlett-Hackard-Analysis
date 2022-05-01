-- Query for retirement table
t.from_date , t.to_date INTO retirement_titles
FROM employees AS eM
LEFT JOIN titles AS t
ON em.emp_no = t.emp_no 
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Query for unique title table
SELECT DISTINCT ON (emp_no) emp_no, first_name,last_name,title
INTO unique_titles_table
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no,to_date DESC;

-- Query for retiring title table
SELECT COUNT(emp_no),title
INTO Retiring_Titles
FROM unique_titles_table
GROUP BY (title)
ORDER BY (count) DESC;
DROP TABLE Retiring_Titles;

-- Query for mentorship eligibility
SELECT DISTINCT ON (em.emp_no) em.emp_no ,em.first_name,em.last_name, em.birth_date,
d.from_date,d.to_date,
t.title
INTO mentorship_eligibilty
FROM employees AS em
LEFT JOIN dept_emp AS d
ON em.emp_no = d.emp_no
LEFT JOIN titles AS t
ON em.emp_no = t.emp_no
WHERE (d.to_date = '9999-01-01') AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ;