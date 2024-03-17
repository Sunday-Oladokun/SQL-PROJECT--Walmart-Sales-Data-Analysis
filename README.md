# SQL PROJECT- Walmart Sales Data Analysis

### Introduction

The following report presents an in-depth analysis of sales data from Walmart, focusing on various aspects including sales trends, product performance, customer behavior, and more. This analysis is conducted to derive actionable insights that can aid strategic decision-making processes within the organization.

### Database Creation and Data Overview

The initial step involved creating a dedicated database named "WalmartSalesData" to store the sales data. Within this database, a table named "sales" was created to capture detailed transactional information. This table encompasses essential attributes such as invoice ID, branch, city, customer type, gender, product line, pricing details, date, time, payment method, and additional financial metrics.

Description of Walmart Sales Data Table:

| Column Name       | Description                                              | Data Type    |
|-------------------|----------------------------------------------------------|--------------|
| invoice_id        | Unique identifier for each sales transaction             | VARCHAR(35)  |
| branch            | Identifier for the branch where the sale occurred        | VARCHAR(10)  |
| city              | Name of the city where the sale took place               | VARCHAR(35)  |
| customer_type     | Type of customer (e.g., Member, Normal)                  | VARCHAR(30)  |
| gender            | Gender of the customer (e.g., Male, Female)              | VARCHAR(8)   |
| product_line      | Category or type of the product sold                     | VARCHAR(100) |
| unit_price        | Price of a single unit of the product                    | DECIMAL(10,2)|
| quantity          | Number of units sold in the transaction                  | INT          |
| VAT               | Value-added tax (percentage) applied to the transaction  | FLOAT(6,4)   |
| total             | Total sales amount including tax                         | DECIMAL(12,4)|
| date              | Date of the sales transaction                            | DATETIME     |
| time              | Time of the sales transaction                            | TIME         |
| payment_method    | Method of payment used for the transaction               | VARCHAR(15)  |
| cost_goods        | Cost of goods sold for the transaction                   | DECIMAL(10,2)|
| gross_margin_percent | Percentage of gross margin for the transaction         | FLOAT(11,9)  |
| gross_income      | Gross income generated from the transaction              | DECIMAL(12,4)|
| rating            | Customer rating for the product                          | FLOAT(2,1)   |

This table provides a comprehensive overview of the structure of the Walmart sales data, including the column names, descriptions of each column, and their respective data types. Each column captures essential information about the sales transactions, enabling thorough analysis and interpretation of the data.

Upon loading the data into the table, it was noted that the gender column needed modification to accept values such as 'Female' or 'Male', hence an alteration was made accordingly.

### Feature Engineering

Feature engineering plays a crucial role in data analysis as it involves transforming raw data into meaningful features that can enhance model performance or aid in understanding the data better. In this analysis, two key features were engineered:

- Time of Day: The time attribute was categorized into 'Morning', 'Afternoon', or 'Evening' to analyze sales patterns based on different times of the day.
  
- Day of Week: The date attribute was utilized to extract the weekday, facilitating analysis based on weekly trends.

### Exploratory Data Analysis (EDA)

EDA is pivotal in understanding the underlying patterns, relationships, and trends within the data. The analysis encompasses several aspects:

- General Insights: Identified unique cities and branches, along with their distribution across branches.
  
- Product Analysis: Explored various aspects including the diversity of product lines, popular payment methods, best-selling products, revenue trends by month, and cost of goods sold.
  
- Sales Trends: Investigated sales patterns based on time of day, weekdays, customer types, and geographical locations.

- Customer Analysis: Segmented customers based on gender, payment methods, and analyzed their purchasing behavior.

### Key Findings

1. Unique Cities and Branches:
   - Walmart operates in three unique cities: Yangon (Branch A), Naypyitaw (Branch C), and Mandalay (Branch B).

2. Product Line Analysis:
   - The store offers a diverse range of product lines including Electronic Accessories, Fashion Accessories, Food and Beverages, Health and Beauty, Home and Lifestyle, and Sports and Travel.

3. Preferred Payment Methods:
   - The most frequent payment methods are Ewallet, Credit Card, and Cash, with 342, 309, and 344 transactions respectively.

4. Best-selling Product Lines:
   - Fashion Accessories, Food and Beverages, and Electronic Accessories are the top-selling product lines based on transaction count.

5. Monthly Revenue:
   - January records the highest total revenue of $116,291.87, followed by March with $108,867.15.

6. Highest Cost of Goods Sold (COGS):
   - January also sees the highest cost of goods sold at $110,754.16.

7. Top Revenue-Generating Product Line:
   - Food and Beverages emerge as the product line generating the highest revenue, totaling $56,144.84.

8. City with Highest Revenue:
   - Naypyitaw leads in revenue generation, with total revenue amounting to $110,490.78.

9. Product Line with Highest Tax Payment (VAT):
   - Home and Lifestyle products incur the highest average tax payment of approximately 16.03%.

10. Branches Outperforming Average Sales:
    - Branches A, C, and B have sold more products compared to the average, with 1,849, 1,828, and 1,795 units respectively.

Recommendations

1. Targeted Marketing Strategies:
   - Concentrate marketing efforts in cities like Naypyitaw, focusing on the top-selling product lines such as Food and Beverages and Fashion Accessories.

2. Payment Method Optimization:
   - Encourage the use of Ewallet and Credit Card payments through promotional offers or loyalty programs to capitalize on preferred payment methods.

3. Inventory Management:
   - Ensure adequate stock levels for top-selling product lines to meet demand, especially during peak revenue-generating months like January.

4. Branch Performance Enhancement:
   - Implement strategies to further boost sales in branches A, C, and B, leveraging their above-average sales performance.

5. Customer Engagement Initiatives:
   - Tailor marketing campaigns and promotions to resonate with customer preferences, especially focusing on the high-revenue-generating city Naypyitaw.

6. Tax Management Strategies:
   - Explore opportunities to optimize tax payments, particularly for product lines with high average tax percentages like Home and Lifestyle.

7. Operational Efficiency Improvements:
   - Streamline operations based on peak sales hours identified, ensuring sufficient staffing and resources during these times to enhance customer experiences.

8. Product Line Diversification:
   - Consider expanding the product offerings within the top-selling categories to cater to diverse customer preferences and increase revenue streams.

### Conclusion

In conclusion, the comprehensive analysis of Walmart sales data has provided valuable insights into various aspects of the business operations. Through the examination of transactional records, significant findings have emerged regarding product performance, customer behavior, revenue trends, and more. By leveraging these insights, Walmart can make informed decisions to optimize performance, enhance customer satisfaction, and drive sustainable growth in the highly competitive retail landscape.

The analysis highlighted key areas for improvement and strategic focus, including targeted marketing strategies, payment method optimization, inventory management, and branch performance enhancement. Moreover, insights into tax management, operational efficiency, and product line diversification offer valuable avenues for further exploration and action.

Walmart can utilize these findings to refine its business strategies, tailor its offerings to customer preferences, and capitalize on revenue-generating opportunities. By adopting a data-driven approach to decision-making, Walmart can stay ahead of market trends, foster customer loyalty, and maintain its position as a leader in the retail industry.

### Future Directions

While the current analysis provides valuable insights, there are several avenues for future exploration and enhancement:

1. Customer Segmentation and Personalization: Further analysis can delve into customer segmentation based on purchasing behavior, demographics, and psychographics to tailor marketing campaigns and promotions more effectively.

2. Predictive Analytics: Implementing predictive models can forecast sales trends, anticipate customer demand, and optimize inventory management and pricing strategies.

3. Supply Chain Optimization: Analyzing supply chain data can identify inefficiencies, streamline processes, and improve product availability and delivery times.

4. Market Basket Analysis: Examining transactional data to understand purchasing patterns and associations between products can inform cross-selling and upselling strategies.

5. Sentiment Analysis: Utilizing natural language processing techniques to analyze customer reviews and feedback can provide insights into product satisfaction levels and identify areas for improvement.

6. Expansion Opportunities: Exploring new markets and geographical locations based on revenue trends and customer demographics can drive expansion strategies and market penetration.

7. Sustainability Initiatives: Analyzing sales data to identify opportunities for eco-friendly products and sustainability initiatives can align with consumer preferences and corporate social responsibility goals.

By embracing these future directions and continuing to leverage data-driven insights, Walmart can remain agile, innovative, and competitive in the dynamic retail landscape, ensuring continued success and growth in the years to come.