# SQL Data Analysis Project

## Overview

This project demonstrates the use of SQL to extract and analyze data from an ecommerce dataset. The goal is to perform various data analysis tasks, including sales summaries, customer segmentation, and identifying high-performing products. The queries are written to fulfill common data analysis requirements and optimize query performance.

## Tools Used

- **Database**: PostgreSQL (or MySQL/SQLite depending on your setup)
- **SQL Features**: `SELECT`, `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `CREATE VIEW`, `Subqueries`, `Indexes`
  
## Dataset

The project uses a simulated ecommerce dataset, consisting of the following tables:

- **orders**: Contains order data with customer information and order dates.
- **order_items**: Contains item-level details for each order (including product, quantity, and price).
- **products**: Contains product-level information (name, cost, etc.).
- **categories**: Categorizes products.
- **customers**: Information about customers.

### Table Schema

1. **orders**
    - `order_id`: Unique identifier for each order
    - `customer_id`: Foreign key referencing `customers`
    - `order_date`: Date the order was placed

2. **order_items**
    - `order_item_id`: Unique identifier for each order item
    - `order_id`: Foreign key referencing `orders`
    - `product_id`: Foreign key referencing `products`
    - `quantity`: Number of units sold
    - `unit_price`: Price per unit

3. **products**
    - `product_id`: Unique identifier for each product
    - `product_name`: Name of the product
    - `category_id`: Foreign key referencing `categories`
    - `unit_cost`: Cost per unit of the product

4. **categories**
    - `category_id`: Unique identifier for product categories
    - `category_name`: Name of the category

5. **customers**
    - `customer_id`: Unique identifier for customers
    - `customer_name`: Name of the customer
    - `email`: Email address of the customer

## Analysis Queries

This repository contains SQL queries that analyze the ecommerce dataset. The queries cover the following tasks:

1. **30-Day Sales Snapshot**: Calculates daily orders, units sold, and revenue for the past 30 days.
2. **Best-Selling Category**: Identifies the category with the highest sales volume for the current month.
3. **High-Spending Customers**: Lists customers who have spent more than ₹5000.
4. **Profit Calculation View**: Creates a view showing product-level profit calculations based on sales and cost.
5. **Customers Who Bought Every Category**: Identifies customers who have purchased at least one item from every category.
6. **Products Never Sold**: Lists products that have never been sold.
7. **Suggested Index for Optimization**: Adds an index to optimize queries for order date filtering.

## Setup and Usage

### Prerequisites

- **PostgreSQL/MySQL/SQLite** installed on your machine
- **SQL Client**: Any SQL editor (e.g., pgAdmin, DBeaver) to run the queries

