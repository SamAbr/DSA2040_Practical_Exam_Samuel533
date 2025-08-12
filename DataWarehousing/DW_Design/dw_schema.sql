-- dw_schema.sql
PRAGMA foreign_keys = ON;

-- Dimension: Customer
CREATE TABLE IF NOT EXISTS dim_customer (
    customer_id     INTEGER PRIMARY KEY,        -- surrogate key
    customer_code   TEXT UNIQUE,                -- natural/business key (optional)
    first_name      TEXT,
    last_name       TEXT,
    gender          TEXT,
    birth_date      DATE,
    email           TEXT,
    phone           TEXT,
    city            TEXT,
    state_province  TEXT,
    country         TEXT,
    postal_code     TEXT,
    customer_since  DATE
);

-- Dimension: Product
CREATE TABLE IF NOT EXISTS dim_product (
    product_id      INTEGER PRIMARY KEY,
    product_sku     TEXT UNIQUE,
    product_name    TEXT NOT NULL,
    category        TEXT,
    sub_category    TEXT,
    brand           TEXT,
    manufacturer    TEXT,
    list_price      REAL,
    cost_price      REAL,
    size            TEXT,
    color           TEXT,
    current_status  TEXT    -- e.g., 'active', 'discontinued'
);

-- Dimension: Time
CREATE TABLE IF NOT EXISTS dim_time (
    time_id         INTEGER PRIMARY KEY,
    the_date        DATE UNIQUE,   -- actual calendar date
    day             INTEGER,
    week            INTEGER,
    month           INTEGER,
    quarter         INTEGER,
    year            INTEGER,
    is_weekend      INTEGER        -- 0/1
);

-- Dimension: Store / Location
CREATE TABLE IF NOT EXISTS dim_store (
    store_id        INTEGER PRIMARY KEY,
    store_code      TEXT UNIQUE,
    store_name      TEXT,
    street_address  TEXT,
    city            TEXT,
    state_province  TEXT,
    country         TEXT,
    zip_code        TEXT,
    region          TEXT
);

-- Fact: Sales
CREATE TABLE IF NOT EXISTS sales_fact (
    sales_id            INTEGER PRIMARY KEY,
    time_id             INTEGER NOT NULL,
    customer_id         INTEGER,          -- nullable for anonymous sales
    product_id          INTEGER NOT NULL,
    store_id            INTEGER,          -- nullable for online sales
    quantity            INTEGER NOT NULL CHECK(quantity >= 0),
    unit_price          REAL NOT NULL,    -- sale unit price
    discount_amount     REAL DEFAULT 0,   -- discount applied on transaction
    sales_amount        REAL NOT NULL,    -- derived: quantity*unit_price - discount_amount (store computed or ETL)
    cost_amount         REAL,             -- optional: quantity * cost_price for margin calc
    transaction_id      TEXT UNIQUE,      -- upstream transaction id (optional)
    created_at          DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (time_id)     REFERENCES dim_time(time_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id)  REFERENCES dim_product(product_id),
    FOREIGN KEY (store_id)    REFERENCES dim_store(store_id)
);