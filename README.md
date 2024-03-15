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

Several significant findings emerged from the analysis:

- The highest revenue-generating city was identified.
- Certain branches outperformed others in terms of product sales.
- Popular products, preferred payment methods, and peak sales hours were determined.
- Customer segmentation revealed insights into gender-based purchasing behavior.
- Average ratings provided insights into product satisfaction levels.
- Tax implications varied across cities, customer types, and product lines.

### Recommendations

Based on the analysis, the following recommendations are proposed:

- Focus marketing efforts on high-revenue cities and branches.
- Optimize product offerings based on sales performance and customer preferences.
- Enhance customer experiences through targeted promotions and tailored services.
- Monitor and adjust pricing strategies to maximize profitability.
- Explore opportunities to expand product lines or introduce new offerings based on popular trends.

### Conclusion

In conclusion, the analysis of Walmart sales data has provided valuable insights into various facets of the business operations. By leveraging these insights, Walmart can make informed decisions to optimize performance, enhance customer satisfaction, and drive sustainable growth in the highly competitive retail landscape.

### Future Directions

Future analyses could delve deeper into specific aspects such as customer churn analysis, market basket analysis, and predictive modeling to forecast sales trends and anticipate future demands accurately.

This comprehensive report encapsulates the essence of the Walmart sales data analysis, offering actionable insights and recommendations to drive strategic initiatives and foster business success.
