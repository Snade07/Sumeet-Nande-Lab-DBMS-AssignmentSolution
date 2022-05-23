# question 3
select count(cus_gender) as TotalNoOfCustomers, cus_gender 
from 
(
select cus_gender, cus_name from customer as cus
inner join
(
select ord_id, cus_id from `order` where ord_amount >= '3000'
)
as o
on cus.cus_id = o.cus_id
group by cus.cus_id
)
as T
group by cus_gender

#Question 4

select cus_name, pro_name, ord_id, ord_date, ord_amount from customer as c, product p, supplier_pricing as sp, 
`order` as o 
where c.cus_id = '2'
and c.cus_id = o.cus_id
and p.pro_id = sp.pro_id
and o.pricing_id = sp.pricing_id;

# Question 5

select sup.sup_id, supp_name, supp_city, supp_phone 
from supplier as sup
inner join
(
select * from supplier_pricing group by 
sup_id having count(sup_id) > 1 
) as sp
on sup.sup_id = sp.sup_id;

#Question 6

select cat.CAT_ID, CAT_NAME, PRO_ID, PRO_NAME, min(MIN_PRICE) from category as cat
inner join
(
select prod.PRO_ID, PRO_NAME, CAT_ID, MIN_PRICE from product as prod
inner join
(select pro_id as PRO_ID, min(supp_price) as MIN_PRICE from supplier_pricing 
group by pro_id) as sp
on prod.pro_id = sp.pro_id)
as pro_sp
on cat.cat_id = pro_sp.CAT_ID
group by cat_id

#Question 7

select p.pro_id, p.pro_name from product as p 
inner join 
(
select pro_id, sp.pricing_id from supplier_pricing as sp
inner join
(select pricing_id from `order` where ord_date > "2021-10-05") as o
on sp.pricing_id = o.pricing_id
) as sp_o
on p.pro_id = sp_o.pro_id

#Question 8

select customer.cus_name,customer.cus_gender from customer 
where customer.cus_name like 'A%' or customer.cus_name like '%A';
