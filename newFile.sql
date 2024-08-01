#customer ,order and product (CRM)

CREATE TABLE custmer (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) DEFAULT NULL
);

ALTER TABLE custmer ADD column (address text(100) NOT NULL);

INSERT INTO custmer (name,address) VALUE ("jayant","dhampur");
INSERT INTO custmer (name,address) VALUE ("tushar","bijnor");
INSERT INTO custmer (name,address) VALUE ("jatin","nagina");
INSERT INTO custmer (name,address) VALUE ("krishna","rampur");
INSERT INTO custmer (name,address) VALUE ("aman","chambal");

SELECT * FROM custmer;

CREATE TABLE products (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) DEFAULT NULL,
    price decimal(10,2) NOT NULL
);

INSERT INTO products (name,price) VALUE ("tea",59);
INSERT INTO products (name,price) VALUE ("coffee",79);
INSERT INTO products (name,price) VALUE ("oreo",99);
INSERT INTO products (name,price) VALUE ("bread",190);
INSERT INTO products (name,price) VALUE ("burger",90);
INSERT INTO products (name,price) VALUE ("sandwitch",199);
INSERT INTO products (name,price) VALUE ("pizza",299);

SELECT * FROM products;
SELECT count(*) FROM products;
SELECT name FROM products ORDER BY name desc;

SELECT name FROM custmer WHERE name like "j%" ORDER by name limit 2;

CREATE TABLE orders (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    custmerid bigint NOT NULL,
    orderno varchar(255) NOT NULL,
    ordered datetime NOT NULL
);
ALTER TABLE orders ADD constraint orders_custmer_fk  FOREIGN KEY (custmerid) references custmer(id);

INSERT INTO orders (custmerid,orderno,ordered) VALUE (4,"tt963",current_time);
INSERT INTO orders (custmerid,orderno,ordered) VALUE (6,"tt963",current_time);
INSERT INTO orders (custmerid,orderno,ordered) VALUE (8,"tt963",current_time);
SELECT * FROM orders;


CREATE TABLE order_items(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    orderid BIGINT NOT NULL,
    productid BIGINT NOT NULL
)

ALTER TABLE order_items ADD CONSTRAINT order_items_orders_fk FOREIGN KEY (orderid) references orders(id);


ALTER TABLE order_items ADD CONSTRAINT order_items_product_fk FOREIGN KEY (productid) references products(id);

INSERT INTO order_items (orderid,productid) VALUE (3,3);
INSERT INTO order_items (orderid,productid) VALUE (4,6);

SELECT * FROM order_items;


