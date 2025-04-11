--Procedimientos 
--Un procedimiento almacenado para registrar una venta.
CREATE OR REPLACE FUNCTION register_sale(
    customer_id INTEGER,            
    product_id INTEGER,             
    quantity INTEGER,               
    sale_total DOUBLE PRECISION     
)
RETURNS VOID AS $$
DECLARE
    available_stock INTEGER;
    sale_id INTEGER;
BEGIN
    
    SELECT stock INTO available_stock
    FROM products
    WHERE id = product_id;

    IF available_stock < quantity THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto con ID %.', product_id;
    END IF;

    INSERT INTO sales (sale_date, total)
    VALUES (CURRENT_TIMESTAMP, sale_total)
    RETURNING id INTO sale_id;

--Validar que el cliente exista.
CREATE OR REPLACE FUNCTION validate_customer(
    customer_id INTEGER 
)
RETURNS VOID AS $$
BEGIN

    IF NOT EXISTS (SELECT 1 FROM customers WHERE id = customer_id) THEN
        RAISE EXCEPTION 'El cliente con ID % no existe.', customer_id;
    ELSE
        RAISE NOTICE 'El cliente con ID % existe.', customer_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

--Verificar que el stock sea suficiente antes de procesar la venta.
CREATE OR REPLACE FUNCTION check_stock_before_sale(
    product_id INTEGER,           
    quantity INTEGER              
)
RETURNS VOID AS $$
DECLARE
    available_stock INTEGER;      
BEGIN

    IF NOT EXISTS (SELECT 1 FROM products WHERE id = product_id) THEN
        RAISE EXCEPTION 'El producto con ID % no existe.', product_id;
    END IF;

    SELECT stock INTO available_stock
    FROM products
    WHERE id = product_id;

    IF available_stock < quantity THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto con ID %: Disponible % pero se requieren %.', product_id, available_stock, quantity;
    ELSE
        RAISE NOTICE 'Stock suficiente para el producto con ID %: Disponible % para una venta de %.', product_id, available_stock, quantity;
    END

--Si no hay stock suficiente, Notificar por medio de un mensaje en consola usando RAISE.
--Si hay stock, se realiza el registro de la venta.