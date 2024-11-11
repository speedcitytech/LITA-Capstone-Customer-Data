-----------------------------------PROJECT 2-------------------------------------

SELECT * FROM [dbo].[LITA Capstone CustomerData] 

--------Total Number of Customers from each Region--------
SELECT Region, COUNT(CustomerID) AS Total_Customer
FROM [dbo].[LITA Capstone CustomerData] 
GROUP BY region;


-----The most Popular Subscription Type by Number of Customers------
SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS Total_Customer
FROM [dbo].[LITA Capstone CustomerData]
GROUP BY SubscriptionType;


------------Customers Who Cancelled the their Subscription within 6 Months----------------
SELECT CustomerID, SubscriptionType
FROM [dbo].[LITA Capstone CustomerData]
WHERE DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) <= 6;


SELECT CustomerID, SubscriptionType, SubscriptionStart, SubscriptionEnd,
       DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) AS SubscriptionDuration
FROM [dbo].[LITA Capstone CustomerData]
WHERE SubscriptionEnd IS NOT NULL;

SELECT CustomerID, SubscriptionType
FROM [dbo].[LITA Capstone CustomerData]
WHERE SubscriptionEnd IS NOT NULL 
AND DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) > 6;



---------Average Subscription Duration for all Customers------
SELECT AVG(DATEDIFF(month, SubscriptionStart, SubscriptionEnd)) 
AS Average_Duration
FROM [dbo].[LITA Capstone CustomerData];


------Customer with Subcriptions Longer than 12 months-----
SELECT CustomerID, SubscriptionType
FROM [dbo].[LITA Capstone CustomerData]
WHERE DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) > 12;


-----Total Revenue by Subscription Type----------------------
SELECT SubscriptionType, SUM(Revenue) AS Total_Revenue
FROM [dbo].[LITA Capstone CustomerData]
GROUP BY SubscriptionType;


------Top 3 Region by Subscription Cancellation-----------
SELECT Top 3 Region, 
COUNT(Canceled) AS Subscription_Cancellations
FROM [dbo].[LITA Capstone CustomerData]
GROUP BY Region
ORDER BY Subscription_Cancellations DESC;


---------Total Number of Active and Cancelled Subscriptions---------------
SELECT 
   SUM(CASE WHEN Canceled IS NULL THEN 1 ELSE 0 END) 
   AS Active_Subscriptions,
   SUM(CASE WHEN Canceled IS NOT NULL THEN 1 ELSE 0 END) AS Canceled_Subscriptions
FROM [dbo].[LITA Capstone CustomerData];
