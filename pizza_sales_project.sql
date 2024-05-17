-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------Problem Statement(KPIs)-------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------

# (Q1) Total Revenue:
SELECT ROUND(SUM(total_price), 2) AS Total_revenue 
FROM pizza_sales;

# (Q2) Average oredr value:
SELECT ROUND((SUM(total_price)/COUNT(distinct order_id)),2) AS Average_order_value
FROM pizza_sales;

# (Q3) Total Pizzas sold:
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;

# (Q4) Total orders:
SELECT COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales;

# (Q5)	Average pizzas per order:
SELECT (SUM(quantity)/COUNT(distinct order_id)) AS Avg_pizza_per_order
FROM pizza_sales;



-- ---------------------------------------------------------------------------------------------------------
-- --------------------------------------TREND ANALYSIS-----------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------

# (Q1) Daily trend for total orders:
SELECT dayname(order_date) AS Order_day, COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
GROUP BY dayname(order_date)
ORDER BY Total_order desc;


# (Q2) Monthly trend for total orders:
SELECT MONTHNAME(order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY Total_order desc;


# (Q3) Hourly trend for total orders:
SELECT HOUR(order_time) AS Order_hour, COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY Total_order desc;


# (Q4) Percentage of sales by pizza category:
SELECT pizza_category, SUM(total_price) as Total_sales,
	   ROUND((SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales )),2) as Sales_by_pct
FROM pizza_sales
GROUP BY 1
ORDER BY Sales_by_pct DESC;


# (Q5) Percentage of sales by pizza size:
SELECT pizza_size, SUM(total_price) as Total_sales,
	   ROUND((SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales )),2) as Sales_by_pct
FROM pizza_sales
GROUP BY 1
ORDER BY Sales_by_pct DESC;


# (Q6) Total pizzas sold by pizza category:
SELECT pizza_category, COUNT(pizza_category) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category;


# (Q7) Top 5 best selling pizzas by revenue:
SELECT pizza_name, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue desc
LIMIT 5;

# (Q8) Bottom 5 best selling pizza by revenue:
SELECT pizza_name, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC
LIMIT 5;

# (Q9) Top 5 best selling pizzas by Total quantity:
SELECT pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT 5;

# (Q10) Bottom 5 best selling pizzas by Total quantity:
SELECT pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC
LIMIT 5;

# (Q11) Top 5 best selling pizzas by Total orders:
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC
LIMIT 5;

# (Q12) Bottom 5 best selling pizzas by Total orders:
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC
LIMIT 5;














