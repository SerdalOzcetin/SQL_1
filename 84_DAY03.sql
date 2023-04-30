CREATE TABLE employees
(
id	CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789,'John Walker','Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890,'Brad Pitt','Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901,'Eddie Murphy','Texas', 3600, 'IBM');
INSERT INTO employees VALUES(456789012,'Eddie Murphy','Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123,'Eddie Murphy','Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012,'Brad Pitt','Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710,'Mark Stone','Pennsylvania', 2500, 'IBM');




CREATE TABLE companies
(
company_id CHAR(9),
company VARCHAR(20),
number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100,'IBM',12000);
INSERT INTO companies VALUES(101,'GOOGLE',18000);
INSERT INTO companies VALUES(102,'MICROSOFT',10000);
INSERT INTO companies VALUES(103,'APPLE',21000);



--FIND THE COMPANY, NUMBER_OF_EMPLOYEES AND AVG SALARY FOR BOTH COMPANY
SELECT company,number_of_employees,(SELECT AVG(salary) FROM employees
								    WHERE companies.company=employees.company) AS avg_salary_per_company
FROM companies;

--FIND THE COMPANY_ID, COMPANY, THE HIGHEST AND LOWEST SALARY VALUES
SELECT company_id, company, (SELECT MAX(salary) FROM employees 
							 WHERE companies.company=employees.company) AS max_salary,
							 
							 (SELECT MIN(salary) FROM employees 
							 WHERE companies.company=employees.company) AS min_salary
FROM companies;


--LİKE CONDİTİON: IT IS USED WITH WİLDCARD 
--1) % WİLCARD: IT REPRESENTS ZERO OR MORE CHARACTERS

--QUERY TNE NAME WHOSE FIRST LETTER IS 'E'
SELECT name
FROM employees
WHERE name LIKE 'E%';

--QUERY TNE NAME WHOSE LAST LETTER IS 'e'
SELECT name
FROM employees
WHERE name LIKE '%e';

--QUERY TNE NAME WHOSE FIRST LETTER 'B', LAST LETTER IS 't'
SELECT name
FROM employees
WHERE name LIKE 'B%t';

--QUERY TNE NAME WHOSE LETTERS INCLUDE 'a'
SELECT name
FROM employees
WHERE name LIKE '%a%';

--QUERY TNE NAME WHOSE LETTERS INCLUDE 'e' or 'r'
SELECT name
FROM employees
WHERE name LIKE '%e%r%' OR name LIKE '%r%e%';

--1) _ WİLCARD: IT REPRESENTS ONE CHARACTER
-- QUERY THE "STATE" WITH THE SECOND LETTER 'e' AND FOURTH LETTER 'n'

SELECT state
FROM employees
WHERE state LIKE '_e_n%';

-- QUERY THE "STATE" WITH THE SECOND LATEST LETTER 'i'
SELECT state
FROM employees
WHERE state LIKE '%i_';

-- QUERY THE "STATE" WITH THE SECOND LETTER 'e' AND AT LEAST HAS 6 CHARACTERS
SELECT state
FROM employees
WHERE state LIKE '_e____%';

-- QUERY THE "STATE" WITH THE LETTER 'i' IN ANY LETTER AFTER THE SECOND LETTER
SELECT state
FROM employees
WHERE state LIKE '__%i%';


CREATE TABLE words
(
word_id CHAR(10) UNIQUE,
word VARCHAR(50) NOT NULL,
number_of_letters SMALLINT
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);


--NOT LIKE CONDITION
--QUERY THE "WORD" WITHOUT 'h' IN ANY LETTERS
SELECT word
FROM words
WHERE word NOT LIKE '%h%';

--QUERY THE "WORD" WITHOUT THE LATEST LETTER 't' OR 'f'
SELECT word
FROM words
WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';

--QUERY "word" VALUES THAT START WITH ANY CHARACTER AND ARE NOT FOLLEWED BY 'a' OR 'e'
SELECT word
FROM words
WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%';

--REGULAR EXPRESSION CONDITION:
--QUERY THE 'word' VALUES WHOOSE FİRST CHARACTER İS 'h', LAST CHARACTER İS 't', AND SECOND CHARACTER İS , 'o', 'a' OR 'i'
--1.WAY BY USİNG LIKE. IT IS NOT RECOMMENDED BECAUSE OF THE REPEATING 'OR' AND 'LIKE'
SELECT word
FROM words
WHERE word LIKE 'ho%t' OR word LIKE 'ha%t' OR word LIKE 'hi%t';

--2.WAY WITH REGEX
SELECT word
FROM words
WHERE word ~ 'h[oai](.*)t';


--QUERY THE VALUES OF 'word' WHOSE FIRST CHARACTER IS 'h', LAST CHARACTER IS 't', SECOND CHARACTER IS ANY CHARACTER FROM 'a' TO 'e'
SELECT word
FROM words
WHERE word ~ 'h[a-e](.*)t';

--QUERY 'word' VALUES WHOSE FIRST CHARACTER IS 's', 'a' or 'y'
SELECT word
FROM words
WHERE word ~ '^[say](.*)';


--QUERY 'word' VALUES WITH END CHARACTER 'm', 'a' or 'f'
SELECT word
FROM words
WHERE word ~ '(.*)[maf]$';

--QUERY THE VALUES OF 'word' WITH FIRST CHARACTER 's', AND LAST CHARACTER 'a'
SELECT word
FROM words
WHERE word ~ '^[s](.*)[a]$'; -- ıf you wan to use sıngle character, no need to use '[]'.


--QUERY THE VALUES OF 'word' WITH  CHARACTER 'a'
SELECT word
FROM words
WHERE word ~ 'a'; --'a' ==> '%a%'

--QUERY THE 'word' VALUES THAT START WITH ANY CHARACTER FROM 'd' TO 't' AND HAVE 'l' AS THEIR THIRD CHARACTER.
SELECT word
FROM words
WHERE word ~ '^[d-t].l(.*)';

--QUERY THE 'word' VALUES THAT START WITH ANY TWO CHARACTERS FROM 'd' TO 't' AND HAVE  ANY TWO CHARACTER IN AFTER THE FIRST ONE AND HAVE 'e' AS THEIR THIRD CHARACTER.
SELECT word
FROM words
WHERE word ~ '^[d-t]..e(.*)';



CREATE TABLE workers
(
id	CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789,'John Walker','Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890,'Brad Pitt','Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901,'Eddie Murphy','Texas', 3600, 'IBM');
INSERT INTO workers VALUES(456789012,'Eddie Murphy','Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123,'Eddie Murphy','Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012,'Brad Pitt','Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710,'Mark Stone','Pensylvania', 2500, 'IBM');


--QUERY THE 'name' VALUES EXCEPT THOSE STARTING WITH 'E' AND ENDING WITH 'y'.
--1.WAY EITH NOT LIKE

--2. WAY WITH REGULAR EXPESSION
SELECT name 
FROM workers
WHERE name ~ '^[^E](.*)[^y]$';

--QUERY THE 'name' VALUES THAT START WITH 'E' AND END WITH 'y'
SELECT name 
FROM workers
WHERE name ~ '^[E](.*)[y]$';

--QUERY THE 'name' VALUES THAT START WITH 'J','B' OR 'E' AND END WITH 'r' OR 't'.
SELECT name 
FROM workers
WHERE name ~ '^[JBE](.*)[rt]$';

--QUERY THE 'name' VALUES THAT START WITH 'J','B' OR 'E' OR END WITH 'r' OR 't'.
SELECT name 
FROM workers
WHERE name ~ '^[JBE]' OR name ~ '[rt]$';

--QUERY THE 'name' VALUES THAT START WITHOUT 'J','B' AND 'E' OR END WITHOUT 'r' OR 't'.
SELECT name 
FROM workers
WHERE name ~ '^[^JBE](.*)[^rt]$';

--QUERY THE 'name' VALUES THAT START WITHOUT 'J','B' OR 'E' OR END WITHOUT 'r' OR 't'.
SELECT name 
FROM workers
WHERE name ~ '^[^JBE]' OR name ~ '[^rt]$';

--QUERY THE 'name' VALUES WITH 'a'
SELECT name 
FROM workers
WHERE name ~ '[a]';

--QUERY THE 'name' VALUES WITH 'a' OR 'k'
SELECT name 
FROM workers
WHERE name ~ '[ak]';

---------------------------------
SELECT name 
FROM workers
WHERE name ~ '^[A-K].a(.*)';

---------------------------------
SELECT name 
FROM workers
WHERE name ~ '^[A-K]..i(.*)';

---------------------------------
SELECT state 
FROM workers
WHERE state ~ '..[ox]';

---------------------------------
SELECT state 
FROM workers
WHERE state ~ '^..[^ox]';

--ORDER BY : IT IS USED TO ORDER THE RECORDS IN ASCENDING OR DESCENDING WAY
--			AND IT IS ONLY USED WITH "SELECT"

--ORDER THE RECORDS IN ASCENDING WAY ACCORDING TO THEIR 'number_of_letters'
SELECT*
FROM words
ORDER BY number_of_letters; --NO NEED TO USE "ASC" IF YOU WAN TO ORDER IN ASCENDING WAY

--ORDER THE RECORDS IN DESCENDING WAY ACCORDING TO THEIR 'number_of_letters'
SELECT*
FROM words
ORDER BY number_of_letters DESC;

--------------------------
SELECT*
FROM words
ORDER BY word DESC;

--IN STEAD OF COLUMN NAME IT CAN BE USED THE COLUMN NUMBER
SELECT*
FROM words
ORDER BY 3 DESC;



SELECT*
FROM workers;


SELECT*
FROM words;


SELECT*
FROM companies;

SELECT*
FROM employees;
