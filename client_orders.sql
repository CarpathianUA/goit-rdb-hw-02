CREATE TABLE `customers`
(
    `id`       INTEGER      NOT NULL AUTO_INCREMENT UNIQUE,
    `lastname` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `addresses`
(
    `id`      INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    `address` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `customer_addresses`
(
    `customer_id` INTEGER NOT NULL,
    `address_id`  INTEGER NOT NULL,
    PRIMARY KEY (`customer_id`, `address_id`)
);

CREATE TABLE `orders`
(
    `id`          INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    `customer_id` INTEGER NOT NULL,
    `date`        DATE    NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `categories`
(
    `id`   INTEGER      NOT NULL AUTO_INCREMENT UNIQUE,
    `type` VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `order_items`
(
    `id`          INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    `order_id`    INTEGER NOT NULL,
    `category_id` INTEGER NOT NULL,
    `qty`         INTEGER NOT NULL,
    PRIMARY KEY (`id`)
);

ALTER TABLE `customer_addresses`
    ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
        ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE `customer_addresses`
    ADD FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
        ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE `orders`
    ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
        ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE `order_items`
    ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
        ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE `order_items`
    ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
        ON UPDATE NO ACTION ON DELETE NO ACTION;
