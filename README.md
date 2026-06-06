# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository!  
This project demonstrates a comprehensive data warehousing and analytics solution — from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## 🏗️ Data Architecture

The data architecture for this project follows the **Medallion Architecture** with three layers — Bronze, Silver, and Gold:

![Data Architecture](<img width="1258" height="635" alt="data_architecture" src="https://github.com/user-attachments/assets/a2ac2c46-ca52-458b-a396-cac627c337c4" />
)

| Layer | Description |
|---|---|
| **Bronze** | Stores raw data as-is from source systems. Data is ingested from CSV files into PostgreSQL. |
| **Silver** | Includes data cleansing, standardization, and normalization to prepare data for analysis. |
| **Gold** | Houses business-ready data modeled into a star schema for reporting and analytics. |

---

## 📖 Project Overview

This project involves:

1. **Data Architecture** — Designing a Modern Data Warehouse using Medallion Architecture.
2. **ETL Pipelines** — Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling** — Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting** — Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository is a strong resource for professionals and students looking to showcase expertise in:
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Architecture
- SQL Development
- Data Analytics

---

## 🚀 Project Requirements

### Data Engineering — Building the Data Warehouse

#### Objective
Develop a modern data warehouse using PostgreSQL to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources** — Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality** — Cleanse and resolve data quality issues prior to analysis.
- **Integration** — Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope** — Focus on the latest dataset only; historization of data is not required.
- **Documentation** — Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### Data Analysis — Analytics & Reporting

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.



---

## 📂 Repository Structure

```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── data_architecture.png           # Data architecture diagram
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   └── naming_conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   └── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Quality check scripts
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information
└── .gitignore                          # Files and directories ignored by Git
```

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.
