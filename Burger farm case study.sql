use sys;

##Q1_total_food_items_orderd?
Select count(*) as 'no of orders' from runner_orders;

##Q2_unique_customer_orders
Select count(distinct(order_id)) as 'unique orders' from customer_orders;

##Q3_successful_orders_delivered_by_each_runner?
Select runner_id, count(distinct(order_id)) as "successful orders" from runner_orders where cancellation is null
 group by runner_id;
 
 ##Q4_how_many_of_each_type_of_food_is_delivered?
  Select n.burger_name, count(c.burger_id) as "total food items delivered" 
  from customer_orders as c join runner_orders as r on c.order_id = r.order_id 
  join burger_names as n on c.burger_id = n.burger_id
  where r.distance!=0
  group by n.burger_name;
  
  ##Q5_How_many_vegetarian_and_meatlovers were ordered_by_each_customer?
  Select c.customer_id, n.burger_name, count(n.burger_name) as "order count"
  from customer_orders as c join burger_names as n on c.burger_id = n.burger_id
  group by c.customer_id, n.burger_name
  order by c.customer_id, n.burger_name asc;

##Q6 What was the total volume of burgers ordered for each hour of the day?
select extract(hour from order_time) as hour_of_day, count(order_id) as burger_count from customer_orders
group by extract(hour from order_time);

##Q7 how many runners signed up for each 1 week period?
select extract(week from registration_date) as registration_week, count(runner_id) as runner_signup from burger_runner
group by extract(week from registration_date);

##Q8  What was the average distance travelled for each customer?
Select c.customer_id, avg(r.distance) as "avg distance"
from customer_orders as c join runner_orders as r
on c.order_id = r.order_id where r.distance!=0
group by c.customer_id;
