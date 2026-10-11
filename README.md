Northwind Sales Analysis Dashboard

Project Overview

The Northwind Sales Analysis Dashboard is a data analytics project developed using SQL Server and Power BI. The project combines orders, customers, products, and categories to analyze sales performance and generate meaningful business insights.

Project Objectives

- Perform multi-table joins using SQL.
- Analyze total sales, orders, and customer performance.
- Identify top-performing products and categories.
- Analyze sales trends over time.
- Compare sales performance across countries.
- Build an interactive Power BI dashboard.
- Generate five business insights to support decision-making.

Tools and Technologies

- SQL Server: Data querying, joins, aggregations, and validation.
- SQL Server Management Studio (SSMS): Writing and executing SQL queries.
- Microsoft Power BI Desktop: Dashboard development and visualization.
- DAX: Calculating sales metrics and KPIs.

Dataset

This project uses the Northwind sample database, which contains sales and order information.

Main Tables Used

- "Customers" — Customer and company information.
- "Orders" — Order dates, order IDs, and customer references.
- "Order Details" — Product quantities, unit prices, and discounts.
- "Products" — Product names and category references.
- "Categories" — Product category information.
- "Employees" — Employee details associated with orders.

SQL Analysis

SQL queries were used to:

1. Inspect database tables and row counts.
2. Join customers, orders, order details, and products.
3. Calculate total sales, total orders, and total customers.
4. Analyze sales by product.
5. Analyze sales by category.
6. Identify high-revenue customers.
7. Analyze monthly sales trends.
8. Compare sales by country.
9. Analyze discounts and validate table relationships.
10. Prepare data for Power BI reporting.

Sales Calculation

Net sales are calculated after discounts:

Net Sales = Quantity * UnitPrice * (1 - Discount)

This calculation is applied at the order-detail level before aggregating sales.

Power BI Dashboard

The interactive dashboard includes:

- KPI Cards: Total Sales, Total Orders, and Total Customers.
- Sales by Customer: Highlights customers generating the highest revenue.
- Sales Trend: Shows sales performance over time.
- Sales by Product: Identifies high-revenue products.
- Sales by Category: Compares product category performance.
- Sales by Country: Compares sales across customer countries.
- Interactive Slicers: Filter data by order date, country, and category.

Key Business Insights

The analysis is designed to identify:

1. The highest-revenue product.
2. The highest-revenue customer.
3. The strongest sales period.
4. The best-performing product category.
5. The country generating the highest sales.

Specific findings and sales figures should be documented using the actual results from the SQL queries and Power BI dashboard.

Data Quality and Validation

- Checked relationships between tables using matching keys.
- Used distinct counts for order and customer metrics.
- Validated joins to identify missing references.
- Calculated sales at the order-detail level to avoid double counting.
- Aggregated sales after applying discounts.

Conclusion

This project demonstrates practical skills in SQL querying, relational data analysis, data validation, DAX calculations, and Power BI dashboard development. It transforms relational sales data into visual reports that help identify product performance, customer contribution, sales trends, and geographic opportunities.# Northwind-Sales-Analysis-Dashboard
Multi-table sales analysis using SQL Server and Power BI to analyze revenue, customers, products, categories, and sales trends through an interactive dashboard and business insights.
