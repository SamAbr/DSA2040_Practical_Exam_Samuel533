# Retail Data Warehouse Schema

## Overview  
Star schema design for retail sales analytics with optimized dimensional modeling.

## Schema Structure

### Dimension Tables

#### `dim_customer`  
| Column          | Type    | Constraints               | Description                     |
|-----------------|---------|---------------------------|---------------------------------|
| customer_id     | INTEGER | PRIMARY KEY               | Surrogate key                   |
| customer_code   | TEXT    | UNIQUE NOT NULL           | Business identifier             |
| first_name      | TEXT    | NOT NULL                  | Legal first name                |
| last_name       | TEXT    | NOT NULL                  | Legal last name                 |
| gender          | TEXT    | CHECK(IN ('M','F','Other')) | Gender identity               |
| birth_date      | DATE    |                           | Date of birth                   |
| email           | TEXT    | CHECK(like '%@%')         | Valid email format              |
| phone           | TEXT    |                           | Contact number                  |
| city            | TEXT    | NOT NULL                  | City of residence               |
| state           | TEXT    | NOT NULL                  | State/province code             |
| postal_code     | TEXT    |                           | Mailing code                    |
| loyalty_tier    | TEXT    | CHECK(IN ('Basic','Silver','Gold','Platinum')) | Reward status |

#### `dim_product`  
| Column          | Type    | Constraints               | Description                     |
|-----------------|---------|---------------------------|---------------------------------|
| product_id      | INTEGER | PRIMARY KEY               | Surrogate key                   |
| sku             | TEXT    | UNIQUE NOT NULL           | Stock keeping unit              |
| product_name    | TEXT    | NOT NULL                  | Display name                    |
| category        | TEXT    | NOT NULL                  | Top-level category              |
| subcategory     | TEXT    |                           | Detailed classification         |
| brand           | TEXT    |                           | Manufacturer brand              |
| current_price   | DECIMAL(10,2) | CHECK(>0)             | Current retail price            |
| cost_price      | DECIMAL(10,2) |                           | Wholesale cost                 |
| is_active       | INTEGER | CHECK(IN (0,1))           | Discontinued flag               |

#### `dim_time`  
| Column       | Type    | Constraints        | Description                     |
|--------------|---------|--------------------|---------------------------------|
| time_id      | INTEGER | PRIMARY KEY        | Surrogate key                   |
| full_date    | DATE    | UNIQUE NOT NULL    | Calendar date                   |
| day_of_week  | INTEGER | CHECK(BETWEEN 1-7) | ISO weekday (1=Monday)          |
| is_weekend   | INTEGER | CHECK(IN (0,1))    | Weekend indicator               |
| month        | INTEGER | CHECK(BETWEEN 1-12)| Calendar month                  |
| quarter      | INTEGER | CHECK(BETWEEN 1-4) | Fiscal quarter                  |
| year         | INTEGER |                    | Calendar year                   |

#### `dim_store`  
| Column        | Type    | Constraints        | Description                     |
|---------------|---------|--------------------|---------------------------------|
| store_id      | INTEGER | PRIMARY KEY        | Surrogate key                   |
| store_code    | TEXT    | UNIQUE NOT NULL    | Location identifier             |
| store_name    | TEXT    | NOT NULL           | Display name                    |
| region        | TEXT    | NOT NULL           | Sales territory                 |
| square_meters | INTEGER | CHECK(>0)          | Retail space size               |
| opening_date  | DATE    |                    | First operational date          |

### Fact Table

#### `fact_sales`  
| Column          | Type          | Constraints                          | Description                     |
|-----------------|---------------|--------------------------------------|---------------------------------|
| sale_id         | INTEGER       | PRIMARY KEY                          | Transaction identifier          |
| customer_id     | INTEGER       | FOREIGN KEY REFERENCES dim_customer  | Buyer reference                 |
| product_id      | INTEGER       | FOREIGN KEY REFERENCES dim_product   | Product reference               |
| store_id        | INTEGER       | FOREIGN KEY REFERENCES dim_store     | Location reference              |
| time_id         | INTEGER       | FOREIGN KEY REFERENCES dim_time      | Date reference                  |
| quantity        | INTEGER       | CHECK(>0)                           | Units sold                      |
| unit_price      | DECIMAL(10,2) | CHECK(>0)                           | Price per unit                  |
| discount_amount | DECIMAL(10,2) | DEFAULT 0                           | Promotion discount              |
| tax_amount      | DECIMAL(10,2) | CHECK(>=0)                          | Government taxes                |
| payment_method  | TEXT          | CHECK(IN ('Cash','Card','Online'))  | Transaction type                |

## Key Features
1. **Optimized Analytics**: Star schema enables fast aggregations
2. **Data Integrity**: Comprehensive constraints ensure valid data
3. **Temporal Analysis**: Detailed time dimension supports trend reporting
4. **Flexible Filtering**: Dimensions support multiple slicing approaches

## Example Queries
```sql
-- Monthly sales by region
SELECT 
    t.year, t.month, s.region,
    SUM(f.quantity * f.unit_price) AS gross_sales
FROM fact_sales f
JOIN dim_time t ON f.time_id = t.time_id
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY t.year, t.month, s.region;

-- Customer lifetime value
SELECT 
    c.customer_id, 
    SUM(f.quantity * (f.unit_price - f.discount_amount)) AS total_spend
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spend DESC;
