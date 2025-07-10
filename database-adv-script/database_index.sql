EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 'some-uuid' AND status = 'confirmed';


CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 'some-uuid' AND status = 'confirmed';