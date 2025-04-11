INSERT INTO countries (name_country) 
VALUES ('Colombia');

INSERT INTO states (state_name, id_country)
VALUES ('Santander', 1), ('Cundinamarca', 1), ('Antioquia', 1);

INSERT INTO cities (city_name, id_state)
VALUES ('Bucaramanga', 1), ('Bogota', 2), ('Medellín', 3);

INSERT INTO addresses (id_city, street_number, street_name) VALUES 
(1, '17-20', 'Cabecera'),
(1, '15-20', 'Centro'),
(1, '22-33', 'Provenza'),
(1, '20-20', 'Cabecera'),
(1, '25-15', 'Centro'),
(1, '105-12', 'Provenza'),
(1, '19-20', 'Cabecera'),
(1, '42-20', 'Centro'),
(1, '105-33', 'Provenza'),
(1, '18-20', 'Cabecera'),
(1, '50-20', 'Centro'),
(1, '105-33', 'Provenza'),
(1, '105-42', 'Provenza'),
(1, '42-10', 'Cabecera'),
(1, '25-12', 'Centro');

INSERT INTO company (company_name, nit, email, id_address) VALUES
('TechZone', '106458562312', 'techzone@gmail.com', 1);

INSERT INTO phone (phone_type, phone_number) VALUES
('movil', '2456312542'),
('movil', '41444545453'),
('movil', '12154556238'),
('movil', '51554545652'),
('movil', '31245431222'),
('movil', '31264512552'),
('movil', '32231456444'),
('fijo', '652264345'),
('fijo', '541545454'),
('fijo', '621645455'),
('fijo', '641544547'),
('fijo', '639556748'),
('fijo', '352564848'),
('fijo', '655444445'),
('fijo', '623212232');

INSERT INTO person_document (document_type, document_number) VALUES
('CC', '106468956'),
('CC', '211221545'),
('CC', '545122125'),
('CC', '554565412'),
('CC', '135455555'),
('CC', '611245453'),
('CC', '312145455'),
('CC', '312154524'),
('CC', '105455222'),
('CE', '121223545'),
('CE', '123554546'),
('CE', '144545655'),
('CE', '135644564'),
('CE', '135656445'),
('CE', '623121123');

INSERT INTO person (id_phone, id_document, id_address, email) VALUES
(1, 1, 1, 'martha@gmail.com'),
(2, 2, 2, 'maria@gmail.com'),
(3, 3, 3, 'marcela@gmail.com'),
(4, 4, 4, 'alejandra@gmail.com'),
(5, 5, 5, 'pablo@gmail.com'),
(6, 6, 6, 'pedro@gmail.com'),
(7, 7, 7, 'juan@gmail.com'),
(8, 8, 8, 'lucas@gmail.com'),
(9, 9, 9, 'martin@gmail.com'),
(10, 10, 10, 'mariela@gmail.com'),
(11, 11, 11, 'alexandra@gmail.com'),
(12, 12, 12, 'alexander@gmail.com'),
(13, 13, 13, 'liam@gmail.com'),
(14, 14, 14, 'leo@gmail.com'),
(15, 15, 15, 'paola@gmail.com');

INSERT INTO products_category (category, category_description) VALUES
('tecnologia', 'Articulos tecnologicos'),
('hogar', 'Articulos hogar');


INSERT INTO products (product_name, product_description, price, id_category, stock) VALUES
('Laptop', 'gaming laptop', 1200.50, 1, 50),
('Smartphone', 'Latest model smartphone', 799.99, 1, 10),
('Desk Chair', 'Comfortable office chair', 150.75, 2, 2),
('Coffee Table', 'Modern coffee table', 220.99, 2, 80),
('Tv', 'Cotton T-shirt in various colors', 25.50, 2, 1),
('Jeans', 'Stylish denim jeans', 45.99, 2, 180),
('Headphones', 'Noise-cancelling over-ear headphones', 299.99, 1, 10),
('Sofa', 'Comfortable 2-seat sofa', 800.00, 2, 40),
('Tablet', '10-inch tablet with high resolution', 250.99, 1, 100),
('Blender', 'High-performance kitchen blender', 99.99, 1, 60),
('Lamp', 'LED desk lamp', 40.00, 2, 150),
('Washing Machine', 'Automatic washing machine', 499.99, 2, 20),
('AC', 'Warm winter AC', 120.00, 2, 50),
('watch', 'Sporty watch for all occasions', 75.99, 2, 200),
('Smartwatch', 'Fitness-focused smartwatch', 150.50, 1, 250);

INSERT INTO stock (last_update, id_product) VALUES
('2025-04-01', 1),
('2025-04-02', 2),
('2025-04-03', 3),
('2025-04-04', 4),
('2025-04-05', 5),
('2025-04-06', 6),
('2025-04-07', 7),
('2025-04-08', 8),
('2025-04-09', 9),
('2025-04-10', 10),
('2025-04-11', 11),
('2025-04-12', 12),
('2025-04-13', 13),
('2025-04-14', 14),
('2025-04-15', 15);

INSERT INTO suppliers (supplier_name, person_id) VALUES
('Tech Supplies', 1),
('Furniture Tech', 2),
('Tecnologias', 3);

INSERT INTO products_supplier (id_supplier, id_product, quantity) VALUES
(1, 1, 50),
(1, 2, 100),
(2, 3, 120),
(2, 4, 80),
(3, 5, 300),
(3, 6, 180),
(1, 7, 70),
(2, 8, 40),
(1, 9, 100),
(1, 10, 60);

INSERT INTO customers (customer_name, person_id) VALUES
('Alejandra', 4),
('Pablo', 5),
('Pedro', 6),
('Marcela', 3);

INSERT INTO sales (sale_date, total) VALUES
('2025-04-01 10:00:00', 1000.00),
('2025-04-02 12:00:00', 500.00),
('2025-04-03 14:00:00', 250.00);

INSERT INTO sales_details (id_sale, id_product, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 5, 3);

INSERT INTO customer_sales (sales_id, customer_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO employee (employee_name, person_id, company_id) VALUES
('Juan', 7, 1),
('lucas', 8, 1),
('martin', 9, 1);