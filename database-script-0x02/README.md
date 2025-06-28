# 🧪 Airbnb Clone - Sample Data

This document outlines the **sample data** used to populate the Airbnb Clone database schema. The data is designed to simulate real-world application usage across all core entities: users, properties, bookings, payments, reviews, and messages.

---

## 🎯 Purpose

The goal of this sample data is to:

- Test table relationships and constraints
- Enable front-end or API testing with real-like values
- Demonstrate multiple bookings, hosts, and payments

---

## 📂 File

- **Filename:** `sample_data.sql`
- **Location:** Root or `/sql/` directory of the project

---

## 🧱 Data Coverage

The script includes realistic values for the following tables:

| Table       | Sample Rows | Description                                 |
|-------------|-------------|---------------------------------------------|
| `users`     | 3           | Admin, Host, and Guest                      |
| `properties`| 2           | Both listed by the same host                |
| `bookings`  | 2           | Guest booked both properties                |
| `payments`  | 3           | One booking split across two payments       |
| `reviews`   | 2           | Feedback from the guest on each property    |
| `messages`  | 2           | Message exchange between guest and host     |

---

## 🧪 Example: Users Table

```sql
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-001', 'Alice', 'Walker', 'alice@example.com', 'hash1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('uuid-002', 'Bob', 'Smith', 'bob@example.com', 'hash2', '0987654321', 'host', CURRENT_TIMESTAMP),
('uuid-003', 'Charlie', 'James', 'charlie@example.com', 'hash3', NULL, 'admin', CURRENT_TIMESTAMP);
