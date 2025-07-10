CREATE TABLE bookings_2025 PARTITION OF bookings
-- partitioning.sql

-- 1. Rename the existing bookings table
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create new partitioned bookings table
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions (example: by year)
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Recreate indexes for each partition if needed
-- e.g., (optional) CREATE INDEX idx_bookings_user_id ON bookings_2023(user_id);

-- 5. Insert old data into the new table
INSERT INTO bookings
SELECT * FROM bookings_old;

-- Optional: Drop the old table once migration is confirmed
-- DROP TABLE bookings_old;
