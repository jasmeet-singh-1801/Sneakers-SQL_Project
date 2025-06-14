
## 📊 Supplier-Focused Sneaker Sales Analysis

This SQL project dives into the supplier dynamics of a sneaker sales dataset. Through a series of focused queries, we evaluate supplier performance, product distribution, pricing trends, and more — all through powerful data-driven insights.

---

## 🧾 Database Snapshot

**Database Name**: `sneakers`

**Primary Tables Used**:

* `sales`
* `products`
* `suppliers`

The analysis centers around supplier-based metrics such as sales volume, unit price, and product distribution.

---

## 🎯 Objective: Supplier Performance Deep-Dive

### 1. Total Sales by Supplier

```sql
SELECT SUP.SupplierName, SUM(S.TotalAmount) AS Sales_Amount
FROM sales AS S
JOIN products AS P ON S.ProductID = P.ProductID
JOIN suppliers AS SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName;
```

![Total Sales by Supplier](ss/Q1.png)

---

### 2. Supplier with Highest Average Unit Price

```sql
SELECT SUP.SupplierName, AVG(P.UnitPrice) AS Avg_Price
FROM products AS P
JOIN suppliers AS SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Avg_Price DESC LIMIT 1;
```

![Highest Avg Unit Price](ss/Q2.png)

---

### 3. Number of Unique Products per Supplier

```sql
SELECT COUNT(DISTINCT P.ProductId) AS Different_Product, SUP.SupplierName
FROM suppliers AS SUP
JOIN products AS P ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName;
```

![Unique Products per Supplier](ss/Q3.png)

---

### 4. Average Sales Amount by Supplier

```sql
SELECT SUP.SupplierName, AVG(S.TotalAmount) AS Avg_Sales
FROM sales AS S
JOIN products AS P ON S.ProductID = P.ProductId
JOIN suppliers SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName;
```

![Avg Sales per Supplier](ss/Q4.png)

---

### 5. Supplier with Highest Total Quantity Sold

```sql
SELECT SUP.SupplierName, SUM(S.Quantity) AS Sales_Quantity
FROM sales AS S
JOIN products AS P ON P.ProductID = S.ProductID
JOIN suppliers SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Sales_Quantity DESC LIMIT 1;
```

![Top Supplier by Quantity](ss/Q5.png)

---

### 6. Most Common Product Category by Supplier

```sql
SELECT SUP.SupplierName, P.Category, COUNT(*) AS Number_Comman_Category
FROM products AS P
JOIN suppliers AS SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName, P.Category
ORDER BY Number_Comman_Category DESC;
```

![Common Category per Supplier](ss/Q6.png)

---

### 7. Sales Comparison Across Suppliers

```sql
SELECT SUP.SupplierName, SUM(TotalAmount) AS Total_Sales
FROM sales AS S
JOIN products AS P ON S.ProductID = P.ProductID
JOIN suppliers AS SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName 
ORDER BY Total_Sales DESC;
```

![Supplier Sales Comparison](ss/Q7.png)

---

### 8. Product Category Distribution by Supplier

```sql
SELECT SUP.SupplierName, P.Category, COUNT(*) AS Distribution
FROM products AS P
JOIN suppliers AS SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName, P.Category;
```

![Category Distribution](ss/Q8.png)

---

### 9. Supplier Representation in Top 10 Selling Products

```sql
WITH TOP_10 AS (
    SELECT ProductID, SUM(TotalAmount) AS Total_Sales
    FROM sales 
    GROUP BY ProductID
    ORDER BY Total_Sales DESC LIMIT 10
)
SELECT SUP.SupplierName, COUNT(*) AS Product_Count
FROM TOP_10 AS T
JOIN products AS P ON T.ProductID = P.ProductID
JOIN suppliers AS SUP ON P.SupplierID = SUP.SupplierID
GROUP BY SUP.SupplierName
ORDER BY Product_Count DESC;
```

![Top Supplier in Top Products](ss/Q9.png)

---

### 10. Average Sales per Product Category by Supplier

```sql
SELECT SUP.SupplierName, P.Category, AVG(S.TotalAmount) AS Avg_Sales
FROM sales AS S
JOIN products AS P ON S.ProductID = P.ProductID
JOIN suppliers AS SUP ON SUP.SupplierID = P.SupplierID
GROUP BY SUP.SupplierName, P.Category;
```

![Avg Sales per Category per Supplier](ss/Q10.png)

---

## 🗂️ Folder Structure

```
.
├── Supplier_Product_Performance.sql
├── README.md
├── ss/
│   ├── Q1.png
│   ├── Q2.png
│   ├── Q3.png
│   ├── Q4.png
│   ├── Q5.png
│   ├── Q6.png
│   ├── Q7.png
│   ├── Q8.png
│   ├── Q9.png
│   └── Q10.png
└── Data
```

---

## 🧠 Key Skills Applied

* SQL Joins (INNER JOIN, CTE)
* Aggregations & Grouping
* Business Intelligence Metrics
* Data Normalization Concepts
* Supplier & Product Trend Analysis
* Clean Query Structuring + Visual Pairing

---

## 🙌 Feedback & Contributions

This is a personal SQL portfolio project built to sharpen data querying and storytelling skills.

If you’d like to suggest improvements, discuss queries, or fork the project — feel free! Your insights are always welcome.

---
