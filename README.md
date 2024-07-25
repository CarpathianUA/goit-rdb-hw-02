# Database Normalization

An overview of the normalization applied to the database schema, ensuring that it meets the requirements of the first three normal forms (1NF, 2NF, and 3NF).

### Original table:
| Номер_замовлення | Назва_товару і кількість | Адреса_клієнта | Дата_замовлення | Клієнт    |
|------------------|--------------------------|----------------|-----------------|-----------|
| 101              | Лептоп: 3, Мишка: 2      | Хрещатик 1     | 2023-03-15      | Мельник   |
| 102              | Принтер: 1               | Басейна 2      | 2023-03-16      | Шевченко  |
| 103              | Мишка: 4                 | Комп'ютерна 3  | 2023-03-17      | Коваленко |

### First Normal Form (1NF)
| Номер_замовлення | Назва_товару | Кількість | Адреса_клієнта | Дата_замовлення | Клієнт    |
|------------------|--------------|-----------|----------------|-----------------|-----------|
| 101              | Лептоп       | 3         | Хрещатик 1     | 2023-03-15      | Мельник   |
| 101              | Мишка        | 2         | Хрещатик 1     | 2023-03-15      | Мельник   |
| 102              | Принтер      | 1         | Басейна 2      | 2023-03-16      | Шевченко  |
| 103              | Мишка        | 4         | Комп'ютерна 3  | 2023-03-17      | Коваленко |

### Requirements:
- All attributes must be atomic.
- Each field should contain only one value.

### Compliance:
- Table contains atomic attributes (no multiple values in a single field).

## Second Normal Form (2NF)

### Requirements:
- The model must comply with 1NF.
- Every non-key attribute must depend on the whole primary key.

### Compliance:
The provided schema is in 2NF - each non-key attribute depends on the entire primary key. There are no partial dependencies.

Here is the provided database schema:

```sql
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
```

## Third Normal Form (3NF)

### Requirements:
- The model must comply with 2NF.
- No non-key attribute should depend on another non-key attribute (no transitive dependencies).

### Compliance:
- In the `customers` table, there are no transitive dependencies.
- In the `addresses` table, there are no transitive dependencies.
- In the `customer_addresses` table, there are no transitive dependencies.
- In the `orders` table, there are no transitive dependencies.
- In the `categories` table, there are no transitive dependencies.
- In the `order_items` table, there are no transitive dependencies.

3NF is shown in [client_orders_schema.png](https://github.com/CarpathianUA/goit-rdb-hw-02/blob/main/client_orders_schema.png), together with DB schema entities.

## Conclusion

The database schema adheres to the requirements of 1NF, 2NF, and 3NF, ensuring that data is structured efficiently to avoid redundancy and maintain integrity.
