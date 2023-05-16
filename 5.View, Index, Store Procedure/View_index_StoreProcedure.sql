create database bt5;
use bt5;

create table products(
    id int not null primary key ,
    code varchar(50),
    name varchar(50),
    price double,
    amount double,
    description varchar(50),
    status varchar(25)
);

insert into products(id,code,price,amount,description,status)
values
(1,'P001',100,10,'Description for product 1','Active'),
(2,'P002',200,20,'Description for product 2','InActive'),
(3,'P003',300,30,'Description for product 3','Active'),
(4,'P004',100,40,'Description for product 4','InActive');
select * from products;

CREATE UNIQUE INDEX idx_product_code ON products (code);
CREATE INDEX idx_product_name_price ON products (name, price);

EXPLAIN SELECT * FROM products WHERE name = 'Product 1' AND price = 100;

CREATE VIEW product_view AS
SELECT code, name, price, status
FROM products;

SELECT * FROM product_view;

ALTER VIEW product_view AS
    SELECT code, name, price, amount, product_view.status
    FROM products;

DROP VIEW IF EXISTS product_view;

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM products;
END;

CREATE PROCEDURE AddProduct(
    IN code VARCHAR(50),
    IN name VARCHAR(255),
    IN price double,
    IN amount INT,
    IN description VARCHAR(500),
    IN status VARCHAR(20)
)
BEGIN
    INSERT INTO Products (
        code,
        name,
        price,
        amount,
        description,
        status
    ) VALUES (
                 code,
                 name,
                 price,
                 amount,
                 description,
                 status
             );
END;

CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(255),
    IN p_price double,
    IN p_amount INT,
    IN p_desc VARCHAR(500),
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Products SET
                        code = p_code,
                        name = p_name,
                        price = p_price,
                        amount = p_amount,
                        description = p_desc,
                        status = p_status
    WHERE id = p_id;
END;

CREATE PROCEDURE DeleteProduct(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE id = p_id;
END;

CALL GetAllProducts();



