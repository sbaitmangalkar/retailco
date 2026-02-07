-- Which product category drove the most revenue?
SELECT
    Category,
    ROUND(SUM(Total), 2) AS Total_Revenue
FROM retailco.sales_data
GROUP BY Category
ORDER BY Total_Revenue DESC
    LIMIT 1;

-- What was the best-selling product?
SELECT
    Product_Name,
    SUM(Quantity) AS Total_Units_Sold
FROM retailco.sales_data
GROUP BY Product_Name
ORDER BY Total_Units_Sold DESC
    LIMIT 1;

-- Which month had the highest sales? (Seasonal Patterns)
SELECT
    MONTHNAME(Sale_Date) AS Month,
    YEAR(Sale_Date) AS Year,
    ROUND(SUM(Total), 2) AS Monthly_Revenue
FROM retailco.sales_data
GROUP BY Year, Month, MONTH(Sale_Date)
ORDER BY Monthly_Revenue DESC;

-- Searching for "Surprises" in the data
-- To find surprises, we can look for "outliers"—things like unusually large transactions or specific salespersons significantly outperforming others in a specific region.

-- A. Top Average Transaction Value by Salesperson
-- (Shows who is landing the "big" deals rather than just many small ones).

SELECT
    Salesperson,
    ROUND(AVG(Total), 2) AS Avg_Transaction_Value,
    COUNT(*) AS Number_of_Sales
FROM retailco.sales_data
GROUP BY Salesperson
ORDER BY Avg_Transaction_Value DESC;

-- B. Regional Performance Disparity
-- (Check if one region is significantly underperforming despite having similar products).
SELECT
    Region,
    Category,
    SUM(Total) AS Regional_Category_Revenue
FROM retailco.sales_data
GROUP BY Region, Category
ORDER BY Region, Regional_Category_Revenue DESC;