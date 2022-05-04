-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
`id` int(11) PRIMARY KEY NOT NULL,
`name` varchar(255) NOT NULL,
`price` int(11) NOT NULL
);


INSERT INTO `items` (`id`, `name`, `price`) VALUES
(1, 'Cannon EOS', 36000),
(2, 'Sony DSLR', 40000),
(3, 'Sony DSLR', 50000),
(4, 'Olympus DSLR', 80000),
(5, 'Titan Model #301', 13000),
(6, 'Titan Model #201', 3000),
(7, 'HMT Milan', 8000),
(8, 'Favre Lueba #111', 18000),
(9, 'Raymond', 1500),
(10, 'Charles', 1000),
(11, 'HXR', 900),
(12, 'PINK', 1200);

SELECT * FROM items;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
`id` int(11) PRIMARY KEY NOT NULL,
`name` varchar(255) NOT NULL,
`email` varchar(255) NOT NULL,
`password` varchar(255) NOT NULL,
`contact` varchar(255) NOT NULL,
`city` varchar(255) NOT NULL,
`address` varchar(255) NOT NULL
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `contact`, `city`, `address`) VALUES
(1, 'Sajal', 'sajal.agrawal1997@gmail.com', '57f231b1ec41dc6641270cb09a56f897', '8899889988', 'Indore', '100 palace colony, Indore'),
(2, 'Ram', 'ram1234@xyz.com', '57f231b1ec41dc6641270cb09a56f897', '8899889989', 'Pune', '100 palace colony, Pune'),
(3, 'Shyam', 'shyam@xyz.com', '57f231b1ec41dc6641270cb09a56f897', '8899889990', 'Bangalore', '100 palace colony, Bangalore');


SELECT * FROM users;
-- --------------------------------------------------------

--
-- Table structure for table `users_items`
--

CREATE TABLE `users_items` (
`id` int(11) PRIMARY KEY NOT NULL,
`user_id` int(11) NOT NULL,
`item_id` int(11) NOT NULL,
`status` varchar(255) NOT NULL,
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
);

--
-- Inserting data for table `users_items`
--

INSERT INTO `users_items` (`id`, `user_id`, `item_id`, `status`) VALUES
(7, 3, 3, 'Added to cart'),
(8, 3, 4, 'Added to cart'),
(9, 3, 5, 'Added to cart'),
(10, 3, 11, 'Added to cart'),
(11, 1, 9, 'Added to cart'),
(12, 1, 2, 'Added to cart'),
(13, 1, 8, 'Added to cart');

SELECT * FROM users_items;


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