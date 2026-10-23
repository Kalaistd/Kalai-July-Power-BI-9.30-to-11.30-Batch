CREATE TABLE emp (
  empno decimal(4,0) NOT NULL,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno decimal(2,0) default NULL
);

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  deptno decimal(2,0) default NULL,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);

INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
INSERT INTO dept VALUES ('30','SALES','CHICAGO');
INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');


select *  from emp

select * from dept


---------------------------------------------------------------------

--operators

select 3 + 23

select 3 - 23

select 3 * 23

select 10/5

select 11%2


select * from emp


select * from emp
where job='CLERK'


UPDATE EMP
SET SAL=SAL+50
WHERE JOB = 'CLERK'

UPDATE EMP
SET SAL=SAL-50
WHERE EMPNO=7876



SELECT * FROM EMP
WHERE SAL = 3000



SELECT * FROM EMP
WHERE SAL <= 3000

SELECT * FROM EMP
WHERE SAL >= 3000


SELECT * FROM EMP
WHERE SAL <> 3000


SELECT * FROM EMP
WHERE JOB <> 'CLERK'



SELECT * FROM EMP
WHERE JOB != 'CLERK'






SELECT * FROM EMP
WHERE JOB = 'MANAGER' AND SAL > 2500


SELECT * FROM EMP
WHERE JOB = 'CLERK' OR SAL > 2500

-----------------------

--special operators

select * from emp
where ename like 'A%'


select * from emp
where ename like '%N'


select * from emp
where ename like '%TIN'

select * from emp
where ename like '__A%'

select * from emp
where ename ilike 'a%'




select * from emp
where job = 'SALESMAN' OR JOB = 'CLERK' OR JOB = 'MANAGER'


SELECT * FROM EMP
WHERE JOB IN ('CLERK','SALESMAN','MANAGER','KALAI')


SELECT * FROM EMP
WHERE JOB NOT IN ('CLERK','SALESMAN','MANAGER','KALAI')



select * from emp
where sal between 3000 and 5000


select * from emp
where comm is null


select * from emp
where comm is not null


----------------------

--fns


select job,count(*) from emp
group by job

select sum(sal)
from emp

select min(sal)
from emp

select max(sal)
from emp

select avg(sal)
from emp


select job,sum(sal)
from emp
group by job




select job,count(*),sum(sal),min(sal),max(sal),avg(sal)
from emp
group by job



----order by

select job,count(*),sum(sal) as total_salary
from emp
group by job
order by total_salary 


select job,count(*),sum(sal) as total_salary
from emp
group by job
order by total_salary asc



select job,count(*),sum(sal) as total_salary
from emp
group by job
order by total_salary desc


select job,count(*),sum(sal) as total_salary
from emp
group by job
order by 3 desc



select job,count(*),sum(sal) as total_salary
from emp
group by job
order by 3 desc
limit 3


select * from emp

------------having
select job,count(*),sum(sal) as total_salary
from emp
group by job
having count(*) >= 3




----date fns

-- CURRENT_DATE → Returns today’s date
	SELECT current_date; -- 2026-04-04

-- NOW() → Current date and time with time zone
	SELECT NOW(); -- 2026-04-04 17:26:00+05:30

-- EXTRACT(field FROM source) → Extracts parts of a date/time
	SELECT EXTRACT(YEAR FROM CURRENT_DATE); -- 2026
	SELECT EXTRACT(MONTH FROM CURRENT_DATE); -- 4


	select *,extract(year from hiredate)
	from emp

-- DATE_TRUNC('unit', timestamp) → Truncates to a unit (day, month, year, etc.)
	SELECT DATE_TRUNC('month', NOW()); -- 2026-04-04 00:00:00

SELECT DATE_TRUNC('year', NOW());

SELECT DATE_TRUNC('day', NOW());


-- AGE(timestamp, timestamp) → Difference between two dates
	SELECT AGE('2026-10-21', '2020-05-23'); -- 6 years
	
-- TO_DATE(text, format) → Convert string to date
	SELECT TO_DATE('04-04-2026', 'DD-MM-YYYY');


	select '2026-10-21'
	
-- TO_TIMESTAMP(text, format) → Convert string to timestamp
	SELECT TO_TIMESTAMP('2026-04-04 17:26', 'YYYY-MM-DD HH24:MI');
	
-- Add Days  

SELECT DATE '2026-05-18' + 5; -- 2026-05-25

Subtract dates   


SELECT DATE '2026-05-18' - 5;

SELECT DATE '2026-04-18' - DATE '2026-04-01'; -- 17


------------------------------------------------------------------

--text fns


-- i. LENGTH(string) → Returns length 
	SELECT LENGTH('PostgreSQL'); -- 10

-- ii. UPPER(string), LOWER(string) → Case conversion
	-- Converts text to uppercase or lowercase.
	
	SELECT UPPER('postgresql'); -- POSTGRESQL
	
	SELECT LOWER('HELLO'); -- hello

-- iii. CONCAT(str1, str2, …) → Concatenate strings

	-- SELECT CONCAT(col1, col2);
	SELECT CONCAT('Hello','World'); -- Hello World

SELECT CONCAT('Hello'|| '*'||'World');


select * from emp


select concat(ename,'-',deptno)
from emp


 -- POSITION(substring IN string) → Find position
	SELECT POSITION('SQL' IN 'PostgreSQL'); -- 8

-- v. REPLACE(string, from, to) → Replace substring
	SELECT REPLACE('2026-04-04', '-', '/'); -- 2026/04/04



-- vi. TRIM([LEADING|TRAILING|BOTH] chars FROM string) → Remove characters
	SELECT TRIM(' ' FROM '  hello      world'); -- hello

-- vii. LEFT(string, n) / RIGHT(string, n) → Extract characters from left/right
	SELECT LEFT('PostgreSQL', 4);  -- Post
	SELECT RIGHT('PostgreSQL', 3); -- SQL


	select '   hello   world'


------------------------------------------------

--constraints

-- Example: Students Table with Full Constraints
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,                          -- PRIMARY KEY + SERIAL
    first_name VARCHAR(50) NOT NULL, 		  			    -- NOT NULL
    last_name VARCHAR(50) NOT NULL,                  	    -- NOT NULL
    email VARCHAR(100) UNIQUE NOT NULL,             	    -- UNIQUE + NOT NULL
    age INT CHECK (age >= 18 AND age <= 60),        	    -- CHECK constraint
    status VARCHAR(10) DEFAULT 'non-active',           	    -- DEFAULT value
    class_id INT,                                   	    -- will be used for FOREIGN KEY
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- DEFAULT timestamp
    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE SET NULL -- FOREIGN KEY
);


CREATE TABLE classes (
	class_id SERIAL PRIMARY KEY,
	class_name VARCHAR(50) NOT NULL);


INSERT INTO students (first_name, last_name, email, age, status, class_id)VALUES
	('','Kumar', 'vishnu333.kumar@example.com', 55, 'active', 1),
	('Anita', 'Sharma', 'anita3.sharma@example.com', 23, DEFAULT, 2),
	('Rahul', 'Mehta', 'rahul3.mehta@example.com', 30, 'non-active', 3),
	('Priya', 'Singh', 'priya3.singh@example.com', 28, 'active', NULL); -- NULL allowed for foreign key


INSERT INTO classes (class_name) VALUES('Computer Science'),('Mathematics'),('Physics');



select * from classes


select * from students



