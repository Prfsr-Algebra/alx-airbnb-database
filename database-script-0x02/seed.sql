 -- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-001', 'Alice', 'Walker', 'alice@example.com', 'hash1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('uuid-002', 'Bob', 'Smith', 'bob@example.com', 'hash2', '0987654321', 'host', CURRENT_TIMESTAMP),
('uuid-003', 'Charlie', 'James', 'charlie@example.com', 'hash3', NULL, 'admin', CURRENT_TIMESTAMP);

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('prop-001', 'uuid-002', 'Lakeside Villa', 'A cozy villa near the lake.', 'Lagos, Nigeria', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('prop-002', 'uuid-002', 'Downtown Apartment', 'Modern apartment in city center.', 'Abuja, Nigeria', 80.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('book-001', 'prop-001', 'uuid-001', '2025-07-01', '2025-07-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
('book-002', 'prop-002', 'uuid-001', '2025-08-10', '2025-08-12', 160.00, 'pending', CURRENT_TIMESTAMP);

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay-001', 'book-001', 300.00, CURRENT_TIMESTAMP, 'credit_card'),
('pay-002', 'book-001', 300.00, CURRENT_TIMESTAMP, 'paypal'),
('pay-003', 'book-002', 160.00, CURRENT_TIMESTAMP, 'stripe');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rev-001', 'prop-001', 'uuid-001', 5, 'Beautiful place! Host was great.', CURRENT_TIMESTAMP),
('rev-002', 'prop-002', 'uuid-001', 4, 'Nice and clean but a bit noisy.', CURRENT_TIMESTAMP);

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg-001', 'uuid-001', 'uuid-002', 'Hi, is the property available in July?', CURRENT_TIMESTAMP),
('msg-002', 'uuid-002', 'uuid-001', 'Yes, it is! You can book now.', CURRENT_TIMESTAMP);
