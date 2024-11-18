SELECT
SUM(total_price) AS Sum_TotalPrice
FROM
pizza_sales;

SELECT
SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_OrderValue
FROM
pizza_sales;

SELECT
SUM(quantity) AS Total_PizzaSold
FROM
pizza_sales;

SELECT
MAX(order_id) AS Total_Orders
FROM
pizza_sales;


SELECT
CAST(SUM(quantity) AS decimal(10,2))/CAST(MAX(order_id) AS decimal(10,2)) AS Avg_PizzaPerOrder
FROM
pizza_sales;

SELECT
DATENAME(DW,order_date) AS Week_Day,
COUNT(DISTINCT order_id) AS Count_Orders
FROM
pizza_sales
GROUP BY
DATENAME(DW,order_date);

SELECT
DATENAME(MONTH, order_date) AS MONTH_NAME,
COUNT(DISTINCT order_id) AS Count_Orders
FROM
pizza_sales
GROUP BY
DATENAME(MONTH, order_date)
ORDER BY
Count_Orders DESC;

SELECT
pizza_category,
SUM(total_price) AS Total_Sales,
SUM(total_price) * 100 /(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT
FROM
pizza_sales
WHERE
MONTH(order_date) = 1
GROUP BY
pizza_category;

SELECT
pizza_size,
SUM(total_price) AS Total_Sales,
SUM(total_price) * 100 /(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER,order_date) = 1) AS PCT
FROM
pizza_sales
WHERE
DATEPART(QUARTER,order_date) = 1
GROUP BY
pizza_size
ORDER BY
PCT DESC;

SELECT
TOP 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM
pizza_sales
GROUP BY
pizza_name
ORDER BY
Total_Revenue DESC;

SELECT
TOP 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM
pizza_sales
GROUP BY
pizza_name
ORDER BY
Total_Quantity DESC;

SELECT
TOP 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM
pizza_sales
GROUP BY
pizza_name
ORDER BY
Total_Orders DESC;

SELECT
TOP 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM
pizza_sales
GROUP BY
pizza_name
ORDER BY
Total_Revenue;

SELECT
TOP 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM
pizza_sales
GROUP BY
pizza_name
ORDER BY
Total_Quantity;

SELECT
TOP 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM
pizza_sales
GROUP BY
pizza_name
ORDER BY
Total_Orders;