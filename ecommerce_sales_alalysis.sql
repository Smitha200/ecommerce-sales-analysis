-- ================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- ================================

-- Step 1: Create Database
CREATE DATABASE ecommerce;

-- Step 2: Use Database
USE ecommerce;
-- Step 3: Create Table

CREATE TABLE superstore (
Row_ID INT,
Order_ID TEXT,
Order_Date TEXT,
Ship_Date TEXT,
Ship_Mode TEXT,
Customer_ID TEXT,
Customer_Name TEXT,
Segment TEXT,
Country_Region TEXT,
City TEXT,
State_Province TEXT,
Postal_Code TEXT,
Region TEXT,
Product_ID TEXT,
Category TEXT,
Sub_Category TEXT,
Product_Name TEXT,
Sales FLOAT,
Quantity INT,
Discount FLOAT,
Profit FLOAT
);

-- Step 4: Load Data (Run Once Only)
SET GLOBAL local_infile =1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/samplesuperstore_clean.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
-- -----------------------------------------------------------

-- Step 5: Data check
-- Number of Records
SELECT COUNT(*) FROM superstore;

-- ------------------------------------------------------------
-- Step 6: Analysis Queries + Insights
-- ------------------------------------------------------------

-- 1. Total Revenue
-- Insight: Identify which category generates highest sales
SELECT SUM(Sales) As Total_Revenue
FROM superstore;
-- --------------------------------------------------------------
-- 2. Sales by Category
-- Insight: Identify which category generates highest sales
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;
-- ------------------------------------------------------
-- 3. Profit by Region
-- Insight: Find most profitable region
SELECT Region, SUM(Profit) As Total_Profit
FROM superstore
GROUP BY Region;
-- -------------------------------------------------------
-- 4. Top 10 Products by Revenue
-- Insight: Few products contribute major revenue (Pareto principle)
SELECT Product_Name, SUM(Sales) As Revenue
FROM superstore
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;
-- -------------------------------------------------

-- 5. Monthly Sales Trend
-- Insight: Understand customer segmentation impact 
SELECT
	DATE_FORMAT(Order_Date, '%Y-%m') As Month,
    SUM(Sales) As Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;
-- --------------------------------------------------

-- 6. Sales by Segment
-- Insight: Understand customer segmentation impact
SELECT Segment, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;
-- --------------------------------------------

-- 7. Top 5 cities by Sales
-- Insight: Identify high-performing locations
SELECT City, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;
-------------------------------------------------

-- 8. Average Discount Impact
-- Insight: Check how discount affects profit
SELECT
	AVG(Discount) AS Avg_Discount,
    AVG(Profit) AS Avg_Profit
FROM superstore;

-- ============================================
-- END OF PROJECT
-- ============================================