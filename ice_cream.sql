DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(30) NOT NULL UNIQUE, 
    job_title VARCHAR(30) NOT NULL
);

\COPY employees FROM './data/employees.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS stores CASCADE;
CREATE TABLE stores(
    id SERIAL PRIMARY KEY,
    store_name VARCHAR(20)
);
\COPY stores FROM './data/stores.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS employee_store;
CREATE TABLE employee_store(
    id SERIAL PRIMARY KEY,
    store_id INT,
    employee_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
\COPY employee_store FROM './data/employee_store.csv' WITH CSV HEADER;


DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
    id SERIAL PRIMARY KEY,
    cone_type VARCHAR(10),
    ice_cream_type VARCHAR(20),
    quantity_sold BIGINT,
    price DECIMAL(4,2),
    store_id INT,
    customer_id INT
);
\COPY sales FROM './data/sales.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS boxes_of_cones;

CREATE TABLE boxes_of_cones(
    id SERIAL PRIMARY KEY,
    type_of_cone VARCHAR(10) UNIQUE,
    quantity BIGINT
);
\COPY boxes_of_cones FROM './data/boxes_of_cones.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS buckets_of_ice_cream;

CREATE TABLE buckets_of_ice_cream(
    id SERIAL PRIMARY KEY,
    flavor VARCHAR(50) UNIQUE,
    quantity BIGINT
);
\COPY buckets_of_ice_cream FROM './data/buckets_of_ice_cream.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS timesheets;
CREATE TABLE timesheets(
    id SERIAL PRIMARY KEY,
    time_in TIMESTAMP,
    time_out TIMESTAMP,
    employee_id INT NOT NULL, 
    hours_worked INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
\COPY timesheets FROM './data/timesheets.csv' WITH CSV HEADER;


DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(30),
    customer_purchases INT
);
\COPY customers FROM './data/customers.csv' WITH CSV HEADER;

-- Create Customers table that stores (customer id, customer name, sales), connect sales as FOREIGN KEY to sales table?
