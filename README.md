# LITA Capstone Customer Data Analysis - Project 2

# Project Overview
This project explores customer data for a subscription service, with a focus on identifying trends, customer segmentation, and subscription behaviors. By analyzing the customer demographics, subscription durations, and revenue sources, we aim to inform strategies to improve retention, target marketing, and grow revenue.
Dataset. This project focuses on exploring and analyzing customer subscription data for a subscription-based business. Our analysis provides insights into customer demographics, subscription trends, popular services, and key metrics that help understand customer behavior and potential areas for improvement.

### Data Overview
- Customer ID: Unique identifier for each customer.
- Region: Geographic region of the customer.
- Subscription Type: The type of subscription purchased.
- Subscription Start/End Dates: The duration of each subscription.
- Revenue: The revenue generated from each subscription.
- Cancellation Date: If applicable, the date of cancellation.

#### Key Insights
1. #### Customer Distribution by Region:
- The regions show diverse customer concentrations, with some regions having significantly higher customer counts. This is visualized in Power BI using a column chart.
- Insight: Regions with lower customer counts can be targeted for marketing to increase overall reach.

- ##### Key Queries and Findings
- Customer Count by Region
- SELECT region, COUNT(customer_id) AS customer_count
FROM customer_data
GROUP BY region;
Insight: Shows the distribution of customers across different regions, helping identify regions with a high customer base.
Most Popular Subscription Type

2. #### Subscription Trends:
- Most Popular Subscription Type: Certain types show more popularity, suggesting customer preference.
- Insight: Popular subscriptions provide insights into what services or offers resonate with customers.

3. #### Customer Retention and Cancellations:
- Customers Who Canceled Within 6 Months: High early cancellation rates indicate a need to investigate customer satisfaction during the initial period.
- Insight: Regions with higher cancellation rates can benefit from targeted retention strategies.

5. Average Subscription Duration:
- Analyzing the duration reveals the average length of customer subscriptions, with trends that may indicate loyalty or satisfaction levels.
- Insight: Long-term subscribers are key for revenue consistency, while short-term subscriptions may need improvement in retention strategies.

6. Top Revenue-Generating Regions and Subscription Types:
- A donut chart in Power BI shows the revenue contribution by each region, highlighting high-performing areas.
- Insight: These findings guide which regions and subscription types are driving the most revenue, indicating where additional resources might be allocated.

Project Files
•	data/: Contains the dataset used for analysis.
•	sql/: SQL queries for deeper analysis, such as customer segmentation and revenue by subscription type.
•	power_bi/: The Power BI file, customer_data_dashboard.pbix, provides a visual dashboard of insights.
•	analysis/: Contains the report, including key findings and interpretations.

SQL Query:
SELECT region, COUNT(customer_id) AS customer_count
FROM customer_data
GROUP BY region;
Insight: Shows the distribution of customers across different regions, helping identify regions with a high customer base.
Most Popular Subscription Type

SQL Query:
sql
Copy code
SELECT subscription_type, COUNT(customer_id) AS subscription_count
FROM customer_data
GROUP BY subscription_type
ORDER BY subscription_count DESC;
Insight: Identifies the most popular subscription types, allowing us to focus on high-demand services.
Customers Who Canceled Within 6 Months

SQL Query:
sql
Copy code
SELECT customer_id, subscription_type
FROM customer_data
WHERE DATEDIFF(month, subscription_start_date, cancellation_date) <= 6;
Insight: Helps identify potential dissatisfaction by tracking early cancellations, informing retention strategies.
Average Subscription Duration

SQL Query:
sql
Copy code
SELECT AVG(DATEDIFF(month, subscription_start_date, subscription_end_date)) AS avg_duration
FROM customer_data;
Insight: Reveals the average length of subscriptions, helping assess customer retention.
Customers with Subscriptions Over 12 Months

SQL Query:
sql
Copy code
SELECT customer_id, subscription_type
FROM customer_data
WHERE DATEDIFF(month, subscription_start_date, CURRENT_DATE) > 12;
Insight: Identifies loyal customers with long-term subscriptions.
Total Revenue by Subscription Type

SQL Query:
sql
Copy code
SELECT subscription_type, SUM(revenue) AS total_revenue
FROM customer_data
GROUP BY subscription_type;
Insight: Shows which subscription types are the most profitable.
Top 3 Regions by Cancellations

SQL Query:
sql
Copy code
SELECT region, COUNT(cancellation_date) AS cancellations
FROM customer_data
GROUP BY region
ORDER BY cancellations DESC
LIMIT 3;
Insight: Indicates regions with the highest cancellation rates for targeted retention campaigns.
Total Active vs. Canceled Subscriptions

SQL Query:
SELECT 
  SUM(CASE WHEN cancellation_date IS NULL THEN 1 ELSE 0 END) AS active_subscriptions,
  SUM(CASE WHEN cancellation_date IS NOT NULL THEN 1 ELSE 0 END) AS canceled_subscriptions
FROM customer_data;
Insight: Provides an overview of current active vs. canceled subscriptions.
Power BI Visualizations
The Power BI dashboard includes interactive visuals to make the insights more accessible.

Total Customers by Region - Map Chart:

Insight: Displays customer distribution across regions, allowing for targeted regional marketing.
Popular Subscription Types - Bar Chart:

Insight: Highlights the most popular subscription types, useful for product development focus.
Average Subscription Duration - Gauge Chart:

Insight: Illustrates average subscription duration, providing a benchmark for customer retention.
Revenue by Subscription Type - Column Chart:

Insight: Showcases total revenue from each subscription type, helping prioritize revenue-generating services.
Top 3 Regions by Cancellations - Donut Chart:

Insight: Visualizes cancellation hotspots for regional retention analysis.
Summary
The analysis reveals that while certain regions have high customer counts, some of these areas also experience higher rates of subscription cancellations. The majority of revenue is derived from a few popular subscription types, indicating an opportunity for upselling other services. Additionally, customers who canceled early in their subscription tenure may indicate areas for service improvement or loyalty incentives.

Recommendations
Focus on Retention: Implement loyalty programs or targeted offers in high-cancellation regions.
Expand Popular Subscriptions: Prioritize promotions and product enhancements for high-demand subscription types.
Engage Long-Term Customers: Offer exclusive benefits to customers with extended subscriptions to maintain loyalty.
Monitor Early Cancellations: Track customers at risk of canceling within the first 6 months to offer timely interventions.

Conclusion
The LITA Capstone Customer Data Analysis project successfully uncovers key insights into customer distribution, popular services, and subscription trends. Using these findings, the company can make data-driven decisions to enhance customer satisfaction, increase revenue, and strategically address customer retention challenges.






