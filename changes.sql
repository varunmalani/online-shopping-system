-- Updating the name from the users table whose id is 1

UPDATE users
SET name = 'Raju'
WHERE id = 1;


-- Updating the email from the users table whose name is Raju

UPDATE users
SET email = 'raju.ram@gmail.com'
WHERE id = 1;

SELECT * FROM users;

-- Print all the unique item names
SELECT DISTINCT(name) AS uni_names FROM items;


-- Finding all the products purchased by Shyam 
SELECT items.name from items INNER JOIN users_items 
ON items.id = users_items.item_id
INNER JOIN users ON users_items.user_id = users.id
WHERE users.name = 'Shyam';


-- Total amount spent on each product
SELECT name, sum(price) AS total_amt_spent FROM items GROUP BY name;


-- Adding column "Verified Status" to User table

ALTER TABLE users
ADD COLUMN verified TINYINT(1);

UPDATE users
SET verified = 1
WHERE id = 1;

UPDATE users
SET verified = 1
WHERE id = 2;

UPDATE users
SET verified = 0
WHERE id = 3;



SELECT * FROM users WHERE verified = 1;

-- Adding column "available" to "items" table

ALTER TABLE items
ADD COLUMN available TINYINT(1);

UPDATE items
SET available = 1
WHERE id > 0;

UPDATE items
SET available = 0
WHERE id = 7;

UPDATE items
SET available = 0
WHERE id = 3;


-- Adding a view for users with verification pending

CREATE VIEW verification_pending AS
SELECT * FROM users
WHERE verified = 0;

SELECT * FROM verification_pending;

-- Adding a view for "out of stock" items

CREATE VIEW out_of_stock AS
SELECT * FROM items
WHERE available = 0;

SELECT * FROM out_of_stock;