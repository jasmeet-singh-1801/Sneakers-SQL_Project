USE sneakers;


-- Objective 2: Customer and Product Analysis
-- 1. What is the average spending per customer?
SELECT C.FIRSTNAME,AVG(S.TotalAmount) AS avg_spending 
FROM customers AS C
JOIN sales AS S
ON C.CustomerID = S.CustomerID
GROUP BY FIRSTNAME
ORDER BY avg_spending DESC;


-- 2. Which product is the most frequently purchased by customers?
SELECT P.ProductName, COUNT(S.ProductID) as Frequent_Perchase
FROM sales AS S
JOIN products as P
ON S.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY Frequent_Perchase DESC LIMIT 1;


-- 3. How many unique customers made purchases in each city?
SELECT COUNT(Distinct(S.CustomerID)) AS Cust_Count, C.City 
FROM customers AS C
JOIN sales as S
ON C.CustomerID = S.CustomerID
GROUP BY C.City ;


-- 4. What is the distribution of product categories purchased by customers?
SELECT P.Category, COUNT(*) AS Distribution
FROM products AS P
JOIN sales AS S
ON P.ProductID = S.ProductID
GROUP BY Category;


-- 5. How many repeat customers are there in the dataset?
SELECT COUNT(*) AS Repeated_Customer
FROM(
    SELECT CustomerId
    FROM sales
    GROUP BY CustomerID
    HAVING COUNT(SaleID) > 1
)as Repeated;


-- 6. What is the average unit price of products purchased by customers?
SELECT AVG(P.UnitPrice) as Avg_Price
FROM products as P
JOIN sales AS S
ON P.ProductID = S.ProductID;


-- 7. How does the spending behavior differ between customers from different states?
SELECT C.State, AVG(S.TotalAmount) as Avg_Spending
FROM sales AS S
JOIN customers AS C
ON C.CustomerID = S.CustomerId
GROUP BY C.State;


-- 8. Which supplier provides the most popular products?
SELECT SUP.SupplierName, COUNT(Distinct S.ProductId) as Product_Count
FROM products as P
JOIN sales AS S
ON S.ProductID = P.ProductID
JOIN suppliers as SUP
ON SUP.SupplierID = P.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Product_Count DESC LIMIT 1;


-- 9. What is the most common product category purchased by customers?
SELECT P.Category , COUNT(S.ProductID) AS Purchased_Count
FROM sales as S
JOIN products as P
ON S.ProductID = P.ProductID
GROUP BY P.Category
ORDER BY Purchased_Count DESC LIMIT 1;


-- 10. How many customers purchased more than one type of product?
SELECT COUNT(*) AS Number_Of_Customer_Purchased_More_than_one_product
FROM(
    SELECT S.CustomerID 
    FROM sales AS S
    JOIN products AS P
    ON S.ProductID = P.ProductID
    GROUP BY S.CustomerID
    HAVING COUNT(Distinct S.ProductID) > 1
)as multiple_product;