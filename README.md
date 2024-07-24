# Database Normalization

An overview of the normalization applied to the database schema, ensuring that it meets the requirements of the first three normal forms (1NF, 2NF, and 3NF).

## First Normal Form (1NF)

### Requirements:
- All attributes must be atomic.
- Each field should contain only one value.

### Compliance:
- All tables contain atomic attributes (no multiple values in a single field).

## Second Normal Form (2NF)

### Requirements:
- The model must comply with 1NF.
- Every non-key attribute must depend on the whole primary key.

### Compliance:
- In the `customers` table, all attributes depend on the primary key `id`.
- In the `addresses` table, all attributes depend on the primary key `id`.
- In the `customer_addresses` table, all attributes depend on the composite primary key (`customer_id`, `address_id`).
- In the `orders` table, all attributes depend on the primary key `id`.
- In the `categories` table, all attributes depend on the primary key `id`.
- In the `order_items` table, all attributes depend on the primary key `id`.

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

## Conclusion

The database schema adheres to the requirements of 1NF, 2NF, and 3NF, ensuring that data is structured efficiently to avoid redundancy and maintain integrity.
