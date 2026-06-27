# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, git commit messages, and other objects in the data warehouse.

## **Table of Contents**

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Rules](#bronze-rules)
   - [Silver Rules](#silver-rules)
   - [Gold Rules](#gold-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [Stored Procedure](#stored-procedure)
5. [Git Commit Messages](#git-commit-messages)
---

## **General Principles**

- **Naming Conventions**: Use snake_case, with lowercase letters and underscores (`_`) to separate words.
- **Language**: Use English for all names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### **Bronze Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.

### **Silver Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.

### **Gold Rules**
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
- **`<category>_`**  
  - `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).  
  - `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).  
  - Examples:
    - `dim_customers` → Dimension table for customer data.  
    - `fact_sales` → Fact table containing sales transactions.  

#### **Glossary of Category Patterns**

| Pattern     | Meaning                           | Example(s)                              |
|-------------|-----------------------------------|-----------------------------------------|
| `dim_`      | Dimension table                  | `dim_customer`, `dim_product`           |
| `fact_`     | Fact table                       | `fact_sales`                            |
| `report_`   | Report table                     | `report_customers`, `report_sales_monthly`   |

## **Column Naming Conventions**

### **Surrogate Keys**  
- All primary keys in dimension tables must use the suffix `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Refers to the name of the table or entity the key belongs to.  
  - `_key`: A suffix indicating that this column is a surrogate key.  
  - Example: `customer_key` → Surrogate key in the `dim_customers` table.
  
### **Technical Columns**
- All technical columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.
- **`dwh_<column_name>`**  
  - `dwh`: Prefix exclusively for system-generated metadata.  
  - `<column_name>`: Descriptive name indicating the column's purpose.  
  - Example: `dwh_load_date` → System-generated column used to store the date when the record was loaded.
 
## **Stored Procedure**

- All stored procedures used for loading data must follow the naming pattern:
- **`load_<layer>`**.
  
  - `<layer>`: Represents the layer being loaded, such as `bronze`, `silver`, or `gold`.
  - Example: 
    - `load_bronze` → Stored procedure for loading data into the Bronze layer.
    - `load_silver` → Stored procedure for loading data into the Silver layer.

---

## **Git Commit Messages**

This project strictly adheres to the **Conventional Commits Specification** to maintain a structured, clean, and highly tracking-friendly repository history.

### **Commit Format**
Every commit message must follow this structure:  
`type(scope): short description in lowercase`

### **Allowed Types**
- **`feat`**: Adding a brand new capability or file (e.g., creating a new table or view).
- **`fix`**: Correcting an error or broken query (e.g., fixing a broken script join or database syntax).
- **`chore`**: Maintenance tasks that don't affect SQL logic (e.g., setting up folders, gitkeeps, or configs).
- **`refactor`**: Rewriting/optimizing a query for performance without changing its final output.
- **`docs`**: Changes restricted entirely to documentation files (like README or naming conventions).

### **Allowed Scopes**
The scope must reflect the exact component or data layer being altered:
- **`repo`**: Repository-wide initial setup, updates, or universal standards.
- **`docs`**: Any modifications to documentation files inside the `docs/` directory.
- **`bronze`**: Scripts or tables related to data landing and staging ingestion.
- **`silver`**: Logic related to cleansing, deduplication, and transformation steps.
- **`gold`**: Star schema modeling, fact tables, and final analytics dimensions.

### **Examples**
- `feat(bronze): add crm_customer_info staging table script`
- `fix(silver): repair timestamp datatype format mismatch`
- `docs(repo): append conventional commits guidelines to naming conventions`
