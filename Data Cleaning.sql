CREATE DATABASE hr;
USE hr;

SELECT *
FROM hr_data


SELECT termdate
FROM hr_data
ORDER BY termdate DESC; -- the values include wrong data such as termdate is in the future


UPDATE hr_data
SET termdate = FORMAT(CONVERT(DATETIME,LEFT(termdate,19), 120), 'yyyy-MM-dd') -- 120 is a datetime function -> yyyy-mm-dd hh:mm:ss

SELECT *
FROM hr_data

ALTER TABLE hr_data
ADD new_termdate DATE;

-- I want to change data type of termdate column to Date type but I can't change it directly. 
-- I will copy converted time values from termdate to new_termdate 

UPDATE hr_data
SET new_termdate = CASE
	WHEN termdate IS NOT NULL AND ISDATE(termdate) = 1 THEN CAST(termdate AS DATETIME) ELSE NULL END;

-- Now I am going to calculate the age of each employee
-- create new column "age"

ALTER TABLE hr_data
ADD age nvarchar(50)

-- populate new column with age
UPDATE hr_data
SET age = DATEDIFF(YEAR,birthdate, GETDATE())

SELECT age
FROM hr_data