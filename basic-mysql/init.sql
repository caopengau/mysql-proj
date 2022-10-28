GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

USE testing;

DROP TABLE IF EXISTS `orders`;

DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS coffee;

/*NEVER store passwords in clear text as it's done here!!!*/
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL,
	password TEXT NOT NULL,
	role ENUM('admin', 'consumer')
);

INSERT INTO
	users (name, email, password, role)
VALUES
	('test', 'test@mail.ch', 'test', 'consumer'),
	('admin', 'admin@mail.ch', 'admin', 'admin');

CREATE TABLE coffee (
	id SERIAL PRIMARY KEY,
	blend_name char(64),
	origin char(64),
	variety char(64),
	notes char(64),
	intensifier char(64),
	price float
);

INSERT INTO
	coffee (
		blend_name,
		origin,
		variety,
		notes,
		intensifier,
		price
	)
VALUES
	(
		'Good-morning Symphony',
		'Dipilto, Nicaragua',
		'Kona',
		'crisp, coating, concord grape, fresh wood, maple syrup',
		'astringent',
		23.7
	),
	(
		'KrebStar Mug',
		'Central Valley, Costa Rica',
		'Yellow Bourbon',
		'mild, tea-like, pineapple, barley, musty',
		'delicate',
		40.0
	);

CREATE TABLE `orders` (
	id SERIAL PRIMARY KEY,
	coffeeId BIGINT UNSIGNED NOT NULL,
	userId BIGINT UNSIGNED NOT NULL,
	quantity INT NOT NULL,
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_coffeeId FOREIGN KEY (coffeeId) REFERENCES coffee(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_userId FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- insert data into orders table
INSERT INTO
	`orders` (coffeeId, userId, quantity)
VALUES
	(1, 1, 2),
	(2, 2, 1);