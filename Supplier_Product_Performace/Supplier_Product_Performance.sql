USE sneakers;


-- 1. What is the total sales amount for each supplier?
SELECT SUP.SupplierName, SUM(S.TotalAmount) AS Sales_Amount
FROM sales AS S
JOIN products AS P
ON S.ProductID = P.ProductID
JOIN suppliers AS SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName;


-- 2. Which supplier has the highest average unit price for their products?
SELECT SUP.SupplierName,AVG(P.UnitPrice) as Avg_Price
FROM products AS P
JOIN suppliers AS SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Avg_Price DESC LIMIT 1;


-- 3. How many different products are provided by each supplier?
SELECT COUNT(DISTINCT P.ProductId) AS Different_Product, SUP.SupplierName
FROM suppliers AS SUP
JOIN products AS P
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName;


-- 4. What is the average total sales amount for products supplied by each supplier?
SELECT SUP.SupplierName, AVG(S.TotalAmount) AS Avg_Sales
FROM sales AS S
JOIN products AS P
ON S.ProductID = P.ProductId
JOIN suppliers SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName;


-- 5. Which supplier's products have the highest total sales quantity?
SELECT SUP.SupplierName,SUM(S.Quantity) AS Sales_Quantity
FROM sales AS S
JOIN products AS P
ON P.ProductID = S.ProductID
JOIN suppliers SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Sales_Quantity DESC LIMIT 1;


-- 6. What is the most common category of products supplied by each supplier?
SELECT SUP.SupplierName ,P.Category, Count(*) as Number_Comman_Category
FROM products AS P
JOIN suppliers AS SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName,P.Category
ORDER BY Number_Comman_Category DESC ;



-- 7. How does the performance of products from different suppliers compare?
SELECT SUP.SupplierName, SUM(TotalAmount) AS Total_Sales
FROM sales AS S
JOIN products AS P
ON S.ProductID = P.ProductID
JOIN suppliers as SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName 
ORDER BY Total_Sales DESC;


-- 8. What is the distribution of product categories provided by each supplier?
SELECT SUP.SupplierName, P.Category, COUNT(*) AS Distribution
FROM products AS P
JOIN suppliers AS SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName , P.Category ;


-- 9. How many products from each supplier are in the top 10 best-selling products?

-- Used CTE to extract top 10 products by sales
WITH TOP_10 AS (
    SELECT ProductID, SUM(TotalAmount) AS Total_Sales
    FROM sales 
    GROUP BY ProductID
    ORDER BY Total_Sales DESC Limit 10
)
-- Used the Top 10 CTE to join it with other tables, and count how many of those top product each supplier provides

SELECT SUP.SupplierName, COUNT(*) AS Product_Count
FROM TOP_10 AS T
JOIN products as P
ON T.ProductID = P.ProductID
JOIN suppliers AS SUP
ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Product_Count DESC;


-- 10. What is the average sales amount per product category for each supplier?
SELECT SUP.SupplierName,P.Category,AVG(S.TotalAmount) as Avg_Sales
FROM sales as S
JOIN products as P
ON S.ProductID = P.ProductID
JOIN suppliers AS SUP
ON SUP.SupplierID = P.SupplierID
GROUP BY SUP.SupplierName,P.Category;

