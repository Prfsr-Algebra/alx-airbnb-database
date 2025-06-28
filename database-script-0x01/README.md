# 🏡 Airbnb Clone - Database Schema

This project defines the relational database schema for an Airbnb clone project. It includes users, properties, bookings, payments, reviews, and messaging features — all normalized and connected through well-defined foreign key relationships.

---

## 📦 Schema Overview

The schema includes the following tables:

- **users**: Stores account and role information (guest, host, admin)
- **properties**: Listings created by hosts
- **bookings**: Reservation details between users and properties
- **payments**: Transaction records for bookings
- **reviews**: User feedback on properties
- **messages**: Internal communication between users

Each table is designed with proper data types, constraints, and indexes to optimize performance and maintain integrity.

---

## 🧱 Entity Descriptions

### 1. `users`
Stores user details including authentication and roles.

| Column         | Type      | Description                      |
|----------------|-----------|----------------------------------|
| `user_id`      | UUID      | Primary Key                      |
| `email`        | VARCHAR   | Unique, indexed, required        |
| `role`         | VARCHAR   | ENUM-like (`guest`, `host`, `admin`) |

### 2. `properties`
Listings hosted by users.

| Column         | Type      | Description                      |
|----------------|-----------|----------------------------------|
| `property_id`  | UUID      | Primary Key                      |
| `host_id`      | UUID      | FK → `users(user_id)`            |
| `pricepernight`| DECIMAL   | Nightly rate                     |

### 3. `bookings`
Reservation record linked to both property and user.

| Column         | Type      | Description                      |
|----------------|-----------|----------------------------------|
| `booking_id`   | UUID      | Primary Key                      |
| `user_id`      | UUID      | FK → `users(user_id)`            |
| `property_id`  | UUID      | FK → `properties(property_id)`   |
| `status`       | VARCHAR   | ENUM-like (`pending`, `confirmed`, `canceled`) |

### 4. `payments`
Tracks individual or multiple payments for a booking.

| Column         | Type      | Description                      |
|----------------|-----------|----------------------------------|
| `payment_id`   | UUID      | Primary Key                      |
| `booking_id`   | UUID      | FK → `bookings(booking_id)`      |
| `amount`       | DECIMAL   | Payment value                    |

### 5. `reviews`
User ratings and comments on properties.

| Column         | Type      | Description                      |
|----------------|-----------|----------------------------------|
| `review_id`    | UUID      | Primary Key                      |
| `rating`       | INT       | From 1 to 5                      |

### 6. `messages`
Private messages between users.

| Column         | Type      | Description                      |
|----------------|-----------|----------------------------------|
| `sender_id`    | UUID      | FK → `users(user_id)`            |
| `recipient_id` | UUID      | FK → `users(user_id)`            |

---

## 🔐 Constraints & Indexing

- All primary keys are UUIDs and auto-indexed.
- Additional indexes on:
  - `email` in `users`
  - `host_id` in `properties`
  - `user_id` and `property_id` in `bookings`
  - `booking_id` in `payments`


---

## 🗃️ ER Diagram

You can view the full Entity-Relationship Diagram here:

> **[Click to view ERD](./ERD/airbnb-clone-ERD.png)**

---

## 📁 File Structure

