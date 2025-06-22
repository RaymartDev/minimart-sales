# 🛒 MiniMart Sales DB

A pure SQL portfolio project that simulates a retail store's backend database. It features well-structured data for customers, orders, products, categories, and inventory movement. This project demonstrates SQL schema design, normalization, data manipulation, and analytics querying using MySQL.

---

## 📚 Project Overview

**Goal:**  
To showcase relational database design and data analysis skills using only SQL.

**Use Cases:**
- Track customer orders
- Manage product inventory
- Analyze revenue trends
- Identify top-selling products
- Evaluate customer purchase behavior

---

## 🗂️ Schema Overview

```text 
customers ─────┐
               └──▶ orders ───▶ order_items ◀── products ◀── categories
                      │
                   inventory
```


**Entities:**
- `customers`: stores customer contact info
- `orders`: stores each transaction
- `order_items`: line-item detail of products sold
- `products`: product list with prices and category
- `categories`: groups products (e.g. beverages, snacks)
- `inventory`: tracks stock-in and stock-out events

---

## 🧱 Database Structure

### Table: `customers`
| Column     | Type         | Description           |
|------------|--------------|-----------------------|
| id         | INT          | Primary key           |
| name       | VARCHAR(100) | Customer name         |
| email      | VARCHAR(150) | Contact email         |
| phone      | VARCHAR(20)  | Contact phone         |

### Table: `products`
| Column     | Type          | Description           |
|------------|---------------|-----------------------|
| id         | INT           | Primary key           |
| name       | VARCHAR(150)  | Product name          |
| category_id| INT           | FK to `categories`    |
| price      | DECIMAL(10,2) | Unit price            |

### Table: `orders`
| Column      | Type          | Description           |
|-------------|---------------|-----------------------|
| id          | INT           | Primary key           |
| customer_id | INT           | FK to `customers`     |
| order_date  | DATE          | Date of transaction   |
| total_amount| DECIMAL(10,2) | Computed order total  |

*More tables documented in `schema.sql`*

---

## 🔢 Sample Data

The project includes:
- 20+ products across 3+ categories
- 15+ customers
- 30+ orders with realistic timestamps
- Inventory logs showing stock movements

Run `seed_data.sql` to populate the database.

---

## 📊 Analytical Queries

**Included in `queries.sql`:**
- Total revenue by month
- Top 5 best-selling products
- Customer lifetime value (LTV)
- Daily sales summary
- Inventory levels and low stock alert
- Average order value
- Most frequent customers

---

## ⚙️ Tech Stack

| Tool       | Description                      |
|------------|----------------------------------|
| MySQL      | RDBMS for schema and queries     |
| MySQL Workbench | DB visualization + testing  |
| dbdiagram.io | ERD diagram visualization      |
| Markdown   | Documentation & explanation     |

---
## 📁 File Structure

```text
📦 sql-portfolio-minimart/
┣ 📄 schema.sql
┣ 📄 seed_data.sql
┣ 📄 queries.sql
┣ 🖼 erd.png
┗ 📄 README.md
```

## 📬 Contact

**Raymart Sarmiento**  
📧 raymart.sarmiento23@gmail.com / raymart.sarmiento23@outlook.com <br>
🌐 [LinkedIn](https://www.linkedin.com/in/raymart-s-lob/)  

---