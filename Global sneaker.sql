CREATE TABLE sneaker_consumers (
    buyer_id INT,
    gender VARCHAR(10),
    age INT,
    age_group VARCHAR(20),
    employment_status VARCHAR(50),
    housing_status VARCHAR(50),
    country VARCHAR(50),
    brand VARCHAR(50),
    sneaker_price_usd NUMERIC,
    purchase_channel VARCHAR(50),
    purchase_season VARCHAR(20),
    reason_for_purchase VARCHAR(50),
    discount_used VARCHAR(5),
    comfort_rating INT,
    durability_rating INT,
    repurchase_intent VARCHAR(5)
);

COPY sneaker_consumers
FROM '/Users/adeking/Desktop/GlobalSales/GlobalSneakcsv.csv'
DELIMITER ','
CSV HEADER;

select * from sneaker_consumers;

select brand,
sum(sneaker_price_usd) as revenue
from sneaker_consumers
group by brand
order by revenue desc;

select country,
count(*) as total_purchases
from sneaker_consumers
group by country
order by total_purchases desc;

select discount_used,
avg(case when repurchase_intent = 'Yes' Then 1 Else 0 End) As repurchase_rate
from sneaker_consumers
group by discount_used;

select purchase_season,
count(*) as total_sales
from sneaker_consumers
group by purchase_season
order by total_sales desc;

select age_group,
avg(sneaker_price_usd) as avg_spending
from sneaker_consumers
group by age_group
order by avg_spending desc;

select brand,
sum(sneaker_price_usd) as revenue,
rank() over (order by sum(sneaker_price_usd) desc) as brand_rank
from sneaker_consumers
group by brand;

select buyer_id, brand, sneaker_price_usd,
avg(sneaker_price_usd) over () as avg_price
from sneaker_consumers;

****OR

select buyer_id, brand, sneaker_price_usd,
avg(sneaker_price_usd) over () as avg_price,
case 
    when sneaker_price_usd > avg(sneaker_price_usd) over () then 'Above Average'
    when sneaker_price_usd < avg(sneaker_price_usd) over () then 'below Average'
    else 'Average'
end as price_category
from sneaker_consumers;

select *
from (
    select country,
           brand,
           count(*) as purchases,
           rank() over (partition by country order by count(*) desc) as rank
    from sneaker_consumers
    group by country, brand
) t
where rank = 1;

select buyer_id, brand, sneaker_price_usd,
dense_rank() over (order by sneaker_price_usd desc) as price_rank
from sneaker_consumers
limit 5;

select brand,
avg(comfort_rating) as avg_comfort,
avg(durability_rating) as avg_durability
from sneaker_consumers
group by brand
order by avg_comfort desc;