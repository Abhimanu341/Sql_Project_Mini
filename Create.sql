/*=========================================
     E‑COMMERCE MINI‑DATASET
=========================================*/


/* customers */
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,       
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100)
);

/* categories */
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50)
);

/* products */
CREATE TABLE products (
    product_id  SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category_id  INT REFERENCES categories(category_id),
    unit_cost    NUMERIC(10,2)           
);

/* orders */
CREATE TABLE orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date  DATE
);

/* order_items */
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id   INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity   INT,
    unit_price NUMERIC(10,2)
);


INSERT INTO customers (first_name,last_name,email) VALUES
  ('Asha','Verma','asha@example.com'),
  ('Brian','Lee','brian@example.com'),
  ('Chloe','Ng','chloe@example.com'),
  ('Dev','Patel','dev@example.com');

/* categories */
INSERT INTO categories (category_name) VALUES
  ('Electronics'), ('Books'), ('Clothing');

/* products */
INSERT INTO products (product_name,category_id,unit_cost) VALUES
  ('Smartphone',1,300),
  ('Laptop',1,650),
  ('Novel',2,5),
  ('T‑Shirt',3,4);

/* orders  */
INSERT INTO orders (customer_id,order_date) VALUES
  (1,CURRENT_DATE-28),
  (2,CURRENT_DATE-10),
  (3,CURRENT_DATE-40),
  (1,CURRENT_DATE-5),
  (4,CURRENT_DATE-3);

/* order_items */
INSERT INTO order_items (order_id,product_id,quantity,unit_price) VALUES
  (1,1,1,500),      -- bigger than cost so profit exists
  (2,2,2,900),
  (3,3,5,10),
  (4,2,1,900),
  (4,4,3,10),
  (5,1,2,500);

/* ---------- 3. ANALYSIS QUERIES ---------- */
