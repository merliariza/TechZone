CREATE DATABASE techzone_db;
\c techzone_db;

CREATE TABLE countries(
    id serial PRIMARY KEY,
    name_country CHARACTER VARYING(50)
);

CREATE TABLE states(
    id serial PRIMARY KEY,
    state_name CHARACTER VARYING(50),
    id_country INTEGER,
    FOREIGN KEY (id_country) REFERENCES countries(id)
);

CREATE TABLE cities(
    id serial PRIMARY KEY,
    city_name CHARACTER VARYING(50),
    id_state INTEGER,
    FOREIGN KEY (id_state) REFERENCES states(id)
);

CREATE TABLE addresses(
    id serial PRIMARY KEY,
    id_city INTEGER,
    street_number CHARACTER VARYING(12),
    street_name CHARACTER VARYING(50),  
    FOREIGN KEY (id_city) REFERENCES cities(id)
);

CREATE TABLE company(
    id serial PRIMARY KEY,
    company_name CHARACTER VARYING(50),
    nit CHARACTER VARYING(20),
    email CHARACTER VARYING(80),
    id_address INTEGER,
    FOREIGN KEY (id_address) REFERENCES addresses(id)
);

CREATE TABLE phone(
    id serial PRIMARY KEY,
    phone_type CHARACTER VARYING(10),
    phone_number CHARACTER VARYING(20)
);

CREATE TABLE person_document(
    id serial PRIMARY KEY,
    document_type CHARACTER VARYING(10),
    document_number CHARACTER VARYING(20)
);

CREATE TABLE person(
    id serial PRIMARY KEY,
    id_phone INTEGER,
    id_document INTEGER,
    id_address INTEGER,
    email CHARACTER VARYING(80),
    FOREIGN KEY (id_phone) REFERENCES phone(id),
    FOREIGN KEY (id_document) REFERENCES person_document(id),
    FOREIGN KEY (id_address) REFERENCES addresses(id)
);

CREATE TABLE products_category(
    id serial PRIMARY KEY,
    category CHARACTER VARYING(20),
    category_description TEXT
);

CREATE TABLE products(
    id serial PRIMARY KEY,
    product_name CHARACTER VARYING(50),
    product_description TEXT,
    price DOUBLE PRECISION,
    id_category INTEGER,
    stock INTEGER,
    FOREIGN KEY (id_category) REFERENCES products_category(id)
);

CREATE TABLE stock(
    id serial PRIMARY KEY,
    last_update DATE,
    id_product INTEGER,
    FOREIGN KEY (id_product) REFERENCES products(id)
);

CREATE TABLE suppliers(
    id serial PRIMARY KEY,
    supplier_name CHARACTER VARYING(50),
    person_id INTEGER,
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE products_supplier(
    id serial PRIMARY KEY,
    id_supplier INTEGER,
    id_product INTEGER,
    quantity INTEGER,
    FOREIGN KEY (id_supplier) REFERENCES suppliers(id),
    FOREIGN KEY (id_product) REFERENCES products(id)
);

CREATE TABLE customers(
    id serial PRIMARY KEY,
    customer_name CHARACTER VARYING(50),
    person_id INTEGER,
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE sales(
    id serial PRIMARY KEY,
    sale_date TIMESTAMP,
    total DOUBLE PRECISION
);

CREATE TABLE sales_details (
    id serial PRIMARY KEY,
    id_sale INTEGER,
    id_product INTEGER,
    quantity INTEGER,
    FOREIGN KEY (id_product) REFERENCES products(id),
    FOREIGN KEY (id_sale) REFERENCES sales(id)
);

CREATE TABLE customer_sales(
    id serial PRIMARY KEY,
    sales_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (sales_id) REFERENCES sales(id)
);

CREATE TABLE employee(
    id serial PRIMARY KEY,
    employee_name CHARACTER VARYING(50),
    person_id INTEGER,
    company_id INTEGER,
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);