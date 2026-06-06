# Naming Conventions (PostgreSQL Standard)

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse, adapted for PostgreSQL.

## Table of Contents

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Rules](#bronze-rules)
   - [Silver Rules](#silver-rules)
   - [Gold Rules](#gold-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [Stored Procedure Naming Conventions](#stored-procedure-naming-conventions)

---

## General Principles

- **Naming Style**: Strictly use `snake_case` with lowercase letters and underscores (`_`) to separate words. (Highly recommended for PostgreSQL to avoid mandatory double-quoting).
- **Language**: Use English for all database object names.
- **Avoid Reserved Words**: Do not use PostgreSQL reserved keywords (e.g., `user`, `table`, `select`, `date`) as object names.

## Table Naming Conventions

### Bronze Rules
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`** - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `bronze.crm_cust_info` → Customer information from the CRM system inside the bronze schema.

### Silver Rules
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`** - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `silver.crm_cust_info` → Cleansed customer information inside the silver schema.

### Gold Rules
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
- **`<category>_<entity>`** - `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).  
  - `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).  
  - Examples:
    - `gold.dim_customers` → Dimension table for customer data.  
    - `gold.fact_sales` → Fact table containing sales transactions.  

#### Glossary of Category Patterns

| Pattern | Meaning | Example(s) |
| :--- | :--- | :--- |
| `dim_` | Dimension table | `dim_customers`, `dim_products` |
| `fact_` | Fact table | `fact_sales` |
| `report_` | Report table/view | `report_customers`, `report_sales_monthly` |

## Column Naming Conventions

### Surrogate Keys  
- All primary keys in dimension tables must use the suffix `_key`.
- **`<table_name>_key`** - `<table_name>`: Refers to the name of the table or entity the key belongs to.  
  - `_key`: A suffix indicating that this column is a surrogate key.  
  - Example: `customer_key` → Surrogate key in the `gold.dim_customers` table.
  
### Technical Columns
- All technical/audit columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.
- **`dwh_<column_name>`** - `dwh`: Prefix exclusively for system-generated warehouse metadata.  
  - `<column_name>`: Descriptive name indicating the column's purpose.  
  - Example: `dwh_create_date` → System-generated column used to store the timestamp when the record was loaded.
 
## Stored Procedure Naming Conventions

- All stored procedures used for orchestrating data pipelines must be schema-scoped and follow the naming pattern:
- **`<layer>.load_<layer>()`**
  
  - `<layer>`: Represents the schema/target layer being loaded (`bronze`, `silver`, or `gold`).
  - Example: 
    - `CALL bronze.load_bronze();` → Stored procedure for loading data into the Bronze layer.
    - `CALL silver.load_silver();` → Stored procedure for loading data into the Silver layer.
