-- select * from employee;
-- select emp_name, birthday, sal from employee;
--select emp_name as 従業員名, birthday as 生年月日, sal as 給与, cast(sal * 12 as int) as 年収 from employee;
--select emp_name as 従業員名, birthday as 生年月日, sal as 給与, (sal * 12) :: int as 年収 from employee;
--select emp_name as 従業員名, birthday as 生年月日, sal as 給与, cast(sal * 6 as int) as 半年の年収 from employee;
--select '担当者　' || emp_name || '　の誕生日は　' || birthday || '　です' from employee;
--select emp_name, to_char(birthday, 'Day, Month DD, YYYY') from employee;
--select emp_name, to_char(sal, '9G999G999D99') from employee;
select emp_name, sal, comm, sal + coalesce(comm, 0) from employee;