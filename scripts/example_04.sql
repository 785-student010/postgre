-- select * from employee;
-- select emp_name, birthday, sal from employee;
--select emp_name as 従業員名, birthday as 生年月日, sal as 給与, cast(sal * 12 as int) as 年収 from employee;
--select emp_name as 従業員名, birthday as 生年月日, sal as 給与, (sal * 12) :: int as 年収 from employee;
--select emp_name as 従業員名, birthday as 生年月日, sal as 給与, cast(sal * 6 as int) as 半年の年収 from employee;
--select '担当者　' || emp_name || '　の誕生日は　' || birthday || '　です' from employee;
--select emp_name, to_char(birthday, 'Day, Month DD, YYYY') from employee;
--select emp_name, to_char(sal, '9G999G999D99') from employee;
--select emp_name, sal, comm, sal + coalesce(comm, 0) from employee;
-- select emp_name, 
--     case
--         when gender = 1 then '男性'
--                         else '女性'
--     end
-- from employee;
-- select emp_name, 
--     case gender
--         when 1 then '男性'
--                else '女性'
--     end
-- from employee;
-- select emp_name, 
--        birthday, 
--        sal, 
--        comm, 
--        sal + 
--         case
--             when comm is null then 0
--                          else comm 
--         end
-- from employee;
--select * from employee order by hiredate;
--select * from employee order by sal desc;
--select * from employee order by gender desc, sal;
-- select 
--     emp_name,   
--     birthday, 
--     sal, comm, 
--     sal + 
--     case
--       when comm is null then 0
--                         else comm 
--      end as 月収
-- from employee
-- order by 2 desc;
-- select * 
-- from employee
-- order by sal desc
-- limit 3 offset 1;


--select * from product;
--select prod_name, cost, discount from product;
-- select
--     prod_name,
--     prod_name,
--     cost,
--     discount,
--     cost * discount as 割引価格
-- from product;
-- select
--     prod_name,
--     prod_name,
--     cost,
--     discount,
--     cost * 
--     case
--         when discount is null then 1
--                               else discount
--     end as 割引価格
-- from product;
-- select
--     prod_name,
--     prod_name,
--     cost,
--     discount,
--     to_char(cost * 
--     case
--         when discount is null then 1
--                               else discount
--     end, '9G999G999D99') as 割引価格
-- from product;

-- select 
--     emp_name, 
--     sal
-- from employee
-- where sal >= 2000;
-- select 
--     emp_name,
--     sal,
--     gender
-- from employee
-- where gender = 2;
-- select 
--     emp_name,
--     sal
-- from employee
-- where emp_name = '安部　弘江';
-- 
-- select 
--     emp_name,
--     sal
-- from employee
-- where sal >= 2000 and sal <= 3000; 
--    between sal 2000 and 3000  betweenは等号を含んだ範囲となる
-- select 
--     emp_name,
--     sal,
--     emp_id
-- from employee
-- where emp_id in (2, 4, 7);
-- select 
--     emp_name,
--     sal
-- from employee
-- where sal between 200 and 1000;  --betweenは等号を含んだ範囲となる
-- select 
--     emp_name,
--     sal,
--     emp_id
-- from employee
-- where emp_id not in (2, 4, 7);
-- select * from customer
-- where address like '%大阪市%';
-- select * from customer
-- where address not like '東京都%'; --前方検索　東京都以外
-- select cust_id, cust_name from customer 
-- where cust_name like '_田%';
-- select cust_id, cust_name from customer
-- where cust_name like '_田%' and cust_name like '%子';
-- where cust_name like '_田%子';
-- select * from employee
-- where comm is not null;


-- select * from product
-- where cost >= 20000;
-- select cust_id, cust_name from customer
-- where fax is null;
-- select cust_id, cust_name, tel from customer
-- where tel not like '03%' and tel not like '06%';
-- select 
--     psales_no, 
--     sales_no,
--     prod_id,
--     price desc
-- from sales;
-- where psales_no between 110 and 119;

--select count(*) from employee;  --行数が表示される
-- select               --集計のselect文　ある集団を設定する必要がある
--     count(*),
--     sum(sal)
-- from employee;

-- select 
--     count(*) - count(comm)--全体-comm持っている人＝comm持っていない人
-- from employee;

-- select 
--     dept_id,
--     count(*),
--     sum(sal),
--     avg(sal),
--     min(sal),
--     max(sal)
-- from employee
-- group by dept_id
-- order by dept_id;

-- select 
--     gender,
--     count(*)
-- from employee
-- group by gender
-- order by gender;

-- select
--     dept_id,
--     gender,
--     count(*),
--     avg(sal)
-- from employee
-- group by dept_id, gender
-- order by dept_id, gender;

select 
    dept_id,
    sum(sal),
    avg(sal),
    min(sal),
    max(sal)
from employee
group by dept_id
    having sum(sal) <= 5000
order by dept_id;