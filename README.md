# Sales Analysis of a Pizza Company


## Table of Contents

- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools Used](#tools-used)
- [Data Preparation](#data-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results or Findings](#results-or-findings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)


### Project Overview

This data analysis project aims to provide insights into the sales performance of an pizza company over the past year. By analysing the various aspects of the sales data, we seek to identify trend, make data driven recommendations, and gain a deeper understanding of the company's performance.


### Data Source

Sales Data: The primary dataset used for the analysis is the 'pizza_sales2.csv' file, containing detailed inormation about each sale made by the company.


### Tools Used

- MS Excel - For data cleaning
- MySQL - For analysing the data
- PowerBI - For generating various dashboards


### Data Preparation

In the initial data preparation phase I've performed the following tasks:
1. Data loading and inspection.
2. Handling missing values.
3. Data cleaning and formatting.


### Exploratory Data Analysis

EDA involved exploring the sales data to answer key questions, such as:
- What is the Average Order Value?
  ```sql
  SELECT ROUND((SUM(total_price)/COUNT(distinct order_id)),2) AS 
  Average_order_value
  FROM pizza_sales;
  ```
- What is the total Revenue?
  ```sql
  SELECT ROUND(SUM(total_price), 2) AS Total_revenue 
  FROM pizza_sales;
  ```
- What is the daily sales trend?
  ```sql
  SELECT dayname(order_date) AS Order_day, 
  COUNT(DISTINCT order_id) AS Total_order
  FROM pizza_sales
  GROUP BY dayname(order_date)
  ORDER BY Total_order DESC;
  ```


### Data Analysis

- Monthly trend for total orders(to find in which month when the orders were maximum and mimimum)

  ```sql
  SELECT MONTHNAME(order_date) AS Month_name, 
  COUNT(DISTINCT order_id) AS Total_order
  FROM pizza_sales
  GROUP BY MONTHNAME(order_date)
  ORDER BY Total_order DESC;
  ```

- Hourly trend for total orders(to find in what time of the day when the max. orders were placed)
  ```sql
  SELECT HOUR(order_Ɵme) AS Order_hour, 
  COUNT(DISTINCT order_id) AS Total_order
  FROM pizza_sales
  GROUP BY HOUR(order_Ɵme)
  ORDER BY Total_order DESC;
  ```

- Percentage of sales by pizza category(to find what category generates the maximum revenue)
  ```sql
  SELECT pizza_category, SUM(total_price) as Total_sales,
  ROUND((SUM(total_price)*100/(SELECT SUM(total_price) from 
  pizza_sales )),2) as Sales_by_pct
  FROM pizza_sales
  GROUP BY 1
  ORDER BY Sales_by_pct DESC;
  ```

### Results or Findings

The anlysis results are summarized as follows:
- The company's sales have been steadily increasing over the past year, with a noticable peak during summer.
- Classic pizza category is the best performing category in terms of sales and revenue.


### Recommendations

Based on the analysis, I recommend the following actions:
- Invest in marketting and promotions during peak sales seasons to maximize revenue.
- Focus on expanding and promoting Classic category pizza.


### Limitations

I've to remove all zero values from unit price and total price columns because they would have affected the accuracy of my calculations from the analysis. 






  
