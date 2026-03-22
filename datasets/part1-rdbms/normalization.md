## Anomaly Analysis

## Insert Anomaly
In the orders_flat.csv file, all data (customer, product, order, and sales representative) is stored in a single table. This creates an insert anomaly because a new customer or product cannot be added without also creating an order.

For example, if we want to add a new customer like “Vikram Singh” with customer_id C005, but he has not placed any order yet, we cannot insert his details because order_id, product_id, and quantity fields are required. This forces us to insert incomplete or dummy data, leading to inconsistency.

---

## Update Anomaly
Update anomaly occurs when the same information is repeated across multiple rows, and updating it in one place requires updating it everywhere.

For example, if customer “Rohan Mehta” (customer_id C001) appears in multiple rows with different orders, his email or city is repeated in each row. If his email changes, we must update it in all rows. If we miss one row, the database will contain inconsistent information (different emails for the same customer).

---

## Delete Anomaly
Delete anomaly occurs when deleting a row unintentionally removes important related data.

For example, if a customer has only one order and we delete that row, we also lose all information about that customer. For instance, deleting the only order of “Vikram Singh” would remove his customer details entirely from the dataset, even though we may still want to keep customer records.

## Normalization Justification

Keeping all data in a single table may seem simple at first, but it leads to several serious issues such as redundancy, inconsistency, and data anomalies. In the given orders_flat.csv dataset, customer, product, order, and sales representative information are all stored together. This causes repeated data. For example, the same customer details (name, email, city) are repeated for every order they place. Similarly, product and sales representative information is duplicated across multiple rows.

This redundancy leads to update anomalies. If a customer’s email or city changes, it must be updated in multiple rows. Missing even one row can result in inconsistent data. It also creates insert anomalies, where we cannot add a new customer or product unless there is an associated order. Likewise, delete anomalies occur when removing an order also removes important information about customers or products.

Normalization solves these issues by dividing the data into multiple related tables such as Customers, Orders, Products, and SalesReps. Each table stores only relevant information, reducing duplication. Relationships are maintained using primary and foreign keys. This ensures data consistency, improves data integrity, and makes updates easier and safer.

Therefore, normalization is not over-engineering but a necessary step for maintaining accurate, scalable, and reliable databases.