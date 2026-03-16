# Global Sneaker Consumer Analysis (SQL + Excel + Dashboard)

## Project Overview

This project analyzes global sneaker purchasing behavior across multiple brands, customer demographics, and countries. The goal was to transform raw consumer data into meaningful business insights that can help stakeholders, brands, and retailers make better decisions.

The dataset contains over **12,000 sneaker purchases**, covering **9 major sneaker brands** and customers across **11 countries**, representing more than **$2.9M in sneaker sales data**.

## Objectives

The main goal of this project was to answer key business questions such as:

* Which sneaker brands generate the highest revenue?
* Which countries purchase the most sneakers?
* In which seasons are sneakers purchased the most?
* Do discounts influence repurchase intent?
* Which customer segments spend the most on sneakers?

## Tools & Technologies

* SQL (PostgreSQL)
* Microsoft Excel
* Pivot Tables & Pivot Charts
* Window Functions (RANK, DENSE_RANK, AVG OVER)
* Looker Studio (for dashboard visualization)

## Dataset Features

The dataset includes the following attributes:

* Buyer demographics (age, gender, employment status)
* Housing status
* Country
* Sneaker brand
* Purchase channel
* Purchase season
* Price of sneakers
* Discount usage
* Comfort and durability ratings
* Repurchase intent

## Part of the SQL Analysis

### Top Sneaker Brands by Revenue

```sql
SELECT brand,
SUM(sneaker_price_usd) AS total_revenue
FROM sneaker_consumers
GROUP BY brand
ORDER BY total_revenue DESC;
```

### Ranking Sneakers by Price (Window Function)

```sql
SELECT brand,
sneaker_price_usd,
DENSE_RANK() OVER (ORDER BY sneaker_price_usd DESC) AS price_rank
FROM sneaker_consumers;
```

### Average Sneaker Price Comparison

```sql
SELECT buyer_id,
brand,
sneaker_price_usd,
AVG(sneaker_price_usd) OVER () AS avg_price
FROM sneaker_consumers;
```

## Key Insights

* Sneaker purchases show clear seasonal demand patterns.
* Discounts influence customer repurchase behavior.
* Some brands consistently generate higher revenue globally.
* Customer demographics influence sneaker purchasing trends.

## Project Outcome

This project demonstrates how SQL analytics and data visualization can be used to transform raw consumer data into actionable business insights for stakeholders and decision-makers.

