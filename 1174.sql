-- with cte as (select customer_id, min(order_date) as first_order
-- from delivery
-- group by customer_id)

-- select 
--     round(sum(case when c.first_order = d.customer_pref_delivery_date then 1 else 0 end)* 100/ count(*),2) as immediate_percentage
-- from cte as c 
-- join delivery d 
-- on c.customer_id = d.customer_id 
-- AND c.first_order = d.order_date;

select 
    round(sum(case
      when order_date = customer_pref_delivery_date then 1 else 0 end) *100/ count(*),2) as immediate_percentage
from delivery 
where (customer_id, order_date) in 
(select customer_id, min(order_date) as first_date from delivery
group by customer_id)
