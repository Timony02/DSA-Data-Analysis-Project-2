select * from [dbo].[KMS Sql Case Study] 

----Highest Sales Category----
SELECT TOP 1 Product_Category, ROUND(SUM(Sales), 2) AS TotalSales
FROM [dbo].[KMS Sql Case Study] 
GROUP BY Product_Category
ORDER BY TotalSales DESC


-----Top 3 and Bottom 3 Regions-----
---Top 3
SELECT TOP 3 Region, ROUND(SUM(Sales), 2) AS Totalsales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales DESC

---Bottom 3
SELECT TOP 3 Region, ROUND(SUM(Sales), 2) AS Totalsales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales ASC


----Total Sales of appliances in Ontario
SELECT SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study] 
WHERE Product_Category = 'Appliances' AND Region = 'Ontario';


-----Advice for Lowest 10 customers----
SELECT TOP 10 Customer_Name, ROUND(SUM(Sales), 2) AS Totalsales
FROM [dbo].[KMS Sql Case Study] 
GROUP BY Customer_Name
ORDER BY TotalSales ASC

---Recommendation to the Management of KMS -----
--1.Launch Personalized email campaigns or sales calls targeting these customers with offers on products they've previously
--purchased or viewed.
--2.Assign account managers or sales reps to build relationships with high-potential low-spending clients.

------Highest Shipping cost by method----
SELECT TOP 1 Ship_Mode, ROUND(SUM(Shipping_Cost), 2) AS TotalShippingCost
FROM [dbo].[KMS Sql Case Study] 
GROUP BY Ship_Mode
ORDER BY TotalShippingCost DESC


----CASE SCENARIO II----
--Most valuable customers & what they buy--
SELECT TOP 1 Customer_Name, ROUND(SUM(Profit), 2) AS TotalProfit, STRING_AGG(Product_Category, ', ') AS Categories
FROM [dbo].[KMS Sql Case Study] 
GROUP BY Customer_Name
ORDER BY TotalProfit DESC


-----Top small business customer---
SELECT TOP 1 Customer_Name, ROUND(SUM(Sales), 2) AS TotalSales
FROM [dbo].[KMS Sql Case Study] 
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY TotalSales DESC


---Top corporate customers by number of orders----
SELECT TOP 1 Customer_Name, COUNT(*) AS OrdersCount
FROM [dbo].[KMS Sql Case Study] 
WHERE Customer_Segment = 'Corporate'
GROUP BY Customer_Name
ORDER BY OrdersCount DESC


-----Most profitable consumer customer---
SELECT TOP 1 Customer_Name, SUM(Profit) AS TotalProfit
FROM [dbo].[KMS Sql Case Study] 
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY TotalProfit DESC


-----Returned items and their segments----
--There are no returned items---


------Shipping Method Vs Priority-----
SELECT Order_Priority, Ship_Mode, COUNT(*) AS OrderCount, ROUND(SUM(Shipping_Cost), 2) AS TotalShippingCost
FROM [KMS Sql Case Study]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, TotalShippingCost DESC

----No, the Company didn't appropriately spend shipping cost based on the order priority
----EXPLANATION---
---The data reveals a misalignment between shipping cost and order priority. A significant proportion of low-priority orders are
---being fulfilled using the high-cost shipping method. At the same time some high or critical priority orders are processed using
---low-cost shipping method, which may delay delivery.

----Recommendations----
--1.Use the cheaper shipping modes for low and medium priority ordes.
--2.Reserve most expensive shipping modes for high and critical priority orders only.
--3.Implement automated shipping rules in the order system that select the appropriate shipping method based on priority. 