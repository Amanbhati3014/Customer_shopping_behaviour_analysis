--1.what is total revenue geneated by male vs female category?
select gender,sum(purchase_amount)
from customer
group by gender

--2.which customer used a discount but still spent more than average purchase amount?
select customer_id,purchase_amount
from customer
where discount_applied = 'Yes' and purchase_amount>(select avg(purchase_amount)from customer)

--3.which are the top 5 products with the highest average review rating
select item_purchased,ROUND(avg(review_rating::numeric),2) as avg_review_rating
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5

--4.compare the average purchase amounts between standard and exprees shipping
select round(avg(purchase_amount::numeric),2)as avg_purchase_amount,shipping_type
from customer
where shipping_type in ('Express','Standard')
group by shipping_type

--5.do subscribed customers spend more?compare average spend and total revenue between subscribers and non subscriners
select subscription_status,avg(purchase_amount) as avg_spend,sum(purchase_amount) as total_revenue
from customer
group by subscription_status

--6.which 5 products have the highest percentage of purchases with discount applied?
select item_purchased,
100*sum(case when discount_applied ='Yes' then 1 else 0 end)/count(*) as discount_rate
from customer
group by item_purchased
order by discount_rate desc
limit 5

--7.segments customer into new,returning and loyal_based on their total number of previous purchases and show the count of each segment
with customer_type as(
select customer_id,previous_purchases,
case
   when previous_purchases =1 then 'new'
   when previous_purchases between 2 and 10 then 'returning'
   else 'loyal'
   end as customer_segment
   from customer
)
select customer_segment,count(*) as "no of customers"
from customer_type
group by customer_segment

--8.what are the top 3 most purchased  products ?
select category,previous_purchases
from customer
group by category,previous_purchases
order by previous_purchases desc
limit 3

-- 9.are customers who are repeat buyers(more than 5 previous purchases) also likely to subscribe ?
select subscription_status,
count(customer_id) as repeat_buyers
from customer
where previous_purchases > 5
group by subscription_status

--10. what is revenue contribution of each age group?
select age_group,sum(purchase_amount)as revenue
from customer
group by age_group
order by revenue desc

--11.rank customer by purchase amount within each category?
select customer_id,category,purchase_amount,
rank() over(partition by category order by purchase_amount desc) as rnk_in_category
from customer

--12.dense rank customer by purchase amount within season?
select customer_id,season,purchase_amount,
dense_rank() over(partition by season order by purchase_amount desc) as dense_rnk_in_season
from customer

--13.Find customers who made the highest purchase in each season ?
SELECT *
FROM customer
WHERE purchase_amount IN (
    SELECT MAX(purchase_amount)
    FROM customer
    GROUP BY season
);
--14.How does discount application affect average purchase amount?
SELECT
  discount_applied,
  ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
  SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY discount_applied;

