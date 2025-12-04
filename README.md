# SQL Data Warehouse from Scratch

This project demonstrates building a modern SQL-based data warehouse using a multi-layer architecture (Bronze, Silver, Gold) to transform raw operational data into business-ready analytics for BI and reporting.

## 📂 Architecture Overview

Data flows through three core layers:

1. **Bronze Layer:** Raw data ingestion with no transformations
2. **Silver Layer:** Cleansed and standardized data
3. **Gold Layer:** Business-ready data models optimized for analytics

The system consumes raw CSV files exported from CRM and ERP sources, loads them into SQL Server, applies transformations, and outputs analytical models for dashboards and ad-hoc SQL queries.

---

## 🏗️ Data Sources

### CRM (Customer Relationship Management)

Stores customer-centric sales data:

* Contacts
* Leads and opportunities
* Sales activities
* Support tickets

### ERP (Enterprise Resource Planning)

Stores core business operations data:

* Products
* Orders
* Inventory
* Procurement
* Finance

**Format:** CSV files in folders

---

## 🥉 Bronze Layer: Raw Data

* **Object Type:** Tables
* **Load:** Batch, full load, truncate and insert
* **Transformations:** None
* **Data Model:** None (as-is)

Purpose:

* Store original source data without modification
* Provide reproducibility and traceability

---

## 🥈 Silver Layer: Cleansed, Standardized Data

* **Object Type:** Tables
* **Load:** Batch, full load, truncate and insert
* **Transformations:**

  * Data cleansing
  * Standardization
  * Normalization
  * Derived columns
  * Data enrichment
* **Data Model:** None (as-is)

Purpose:

* Clean and enhance data to create a trusted foundation

---

## 🥇 Gold Layer: Business-Ready Data

* **Object Type:** Views
* **Load:** None (logical views)
* **Transformations:**

  * Data integration
  * Aggregations
  * Business logic
* **Data Model:**

  * Star schema
  * Flat tables
  * Aggregated tables

Purpose:

* Enable fast and flexible analytics
* Standardize business metrics

---

## ⭐ Star Schema Design

A star schema consists of:

### Fact Table

Contains numeric measures and foreign keys:

* Sales amount
* Quantity
* Discounts

### Dimension Tables

Store descriptive attributes:

* Customers
* Products
* Calendar dates
* Stores/regions

Benefits:

* Faster queries
* Cleaner reporting
* Consistent definitions

---

## 🧰 Tools and Technologies

* SQL Server
* ETL/ELT pipelines
* BI tools (Power BI, Tableau)
* CSV ingestion

---

## 📊 Consumption Layer

Used by:

* BI dashboards and reports
* Ad-hoc SQL analytics

With capabilities:

* KPI tracking
* Sales performance
* Customer analytics

---

## 🚀 Project Outcomes

This project delivers:

* A fully-functional warehouse architecture
* Cleaned and business-modeled data
* Scalable analytics foundation
* BI-ready data models

---

## 📁 Repository Structure

```
/bronze           # Raw data load scripts
/silver           # Standardization and cleansing logic
/gold             # Star schema and business logic
/data             # Sample CSV files (CRM, ERP)
/bi               # Dashboard files (optional)
README.md         # Project docs
```

---

## 🔧 Setup Instructions

1. Clone the repo
2. Load sample CSV files into Bronze tables
3. Run Silver transformation scripts
4. Create Gold views
5. Connect BI tool to Gold layer

---

## 📌 Key Concepts

* Medallion Architecture
* ETL/ELT pipelines
* Data quality and governance
* Dimensional modeling
* Business metrics standardization

---

## 🧠 Future Enhancements

* Incremental loads
* CDC (change data capture)
* Data lake integration
* Role-based security
* Automation with orchestration

---

## 📜 License

MIT
# sql-data-warehouse-project
Building a modern data warehouse with SQL Server, including ETL processes, data modeling, and analytics.
