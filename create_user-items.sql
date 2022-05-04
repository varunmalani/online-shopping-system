CREATE TABLE `users_items` (
`id` int(11) PRIMARY KEY NOT NULL,
`user_id` int(11) NOT NULL,
`item_id` int(11) NOT NULL,
`status` varchar(255) NOT NULL,
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
);