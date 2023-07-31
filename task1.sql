use assignment
select * from shopping_history

create table if not exists shopping_history1(
product varchar(30) not null,
quantity integer not null,
unit_price integer not null)

insert into shopping_history1 values
('milk',3,10),
('bread',7,3),
('bread',5,2)

select product ,sum(quantity*unit_price) as total_price from shopping_history1 group by product order by product desc

---task2---
select * from phones
select * from calls

SELECT p.name
FROM phones p
JOIN calls c ON p.phone_number = c.caller OR p.phone_number = c.callee
GROUP BY p.name
HAVING SUM(c.duration) >= 10
order by p.name;


---task3---

create table transactions(
amount integer not null,
`date` date not null)
insert into transactions(amount,date) values (1000,'2020-01-06')
insert into transactions(amount,date) values (-10,'2020-01-14')
insert into transactions(amount,date) values (-75,'2020-01-20')
insert into transactions(amount,date) values (-5,'2020-01-25')
insert into transactions(amount,date) values (-4,'2020-01-29')
insert into transactions(amount,date) values (2000,'2020-03-10')
insert into transactions(amount,date) values (-75,'2020-03-12')
insert into transactions(amount,date) values (-20,'2020-03-15')
insert into transactions(amount,date) values (40,'2020-03-15')
insert into transactions(amount,date) values (-50,'2020-03-17')
insert into transactions(amount,date) values (200,'2020-10-10')
insert into transactions(amount,date) values (-200,'2020-10-10')

select * from transactions

SELECT SUM(amount) - fee AS balance
FROM transactions
CROSS JOIN (
    SELECT SUM(amount) * 0.01 AS fee
    FROM transactions
    WHERE YEAR(date) = YEAR(CURDATE())  
) AS fees;



