with sales_cte as 
(
select  orderDate, t1.customerNumber, t2.orderNumber, productCode, creditLimit, 
quantityOrdered * priceEach as sales_value
from customers t1
join orders t2
on t1.customerNumber = t2.customerNumber
join orderdetails t3
on t2.orderNumber = t3.orderNumber
),
sub_sales_cte as 
(
select orderDate, customerNumber, orderNumber, creditLimit, sum(sales_value) as sales_value
from sales_cte
group by orderDate, customerNumber, orderNumber, creditLimit
),
main_sales_cte as
(
select customerNumber, creditLimit, sum(sales_value) as sales_value
from sub_sales_cte
group by customerNumber, creditLimit
),
third_sales_cte as 
(
select customerNumber, sum(amount) as amount_paid
from payments
group by customerNumber
),
fourth_sales_cte as
(
select t1.customerNumber, creditLimit, sales_value, amount_paid, sales_value - creditLimit as money_owed
from main_sales_cte t1
left join third_sales_cte t2
on t1.customerNumber = t2.customerNumber
)
select *,
case when sales_value > creditLimit then 1 else 0 end as over_creditLimit
from  fourth_sales_cte