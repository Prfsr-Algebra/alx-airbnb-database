SELECT *
FROM properties
WHERE property_id IN(
    SELECT property_id
    FROM reviews
    GROUP BY reviews.property_id
    HAVING AVG(rating) > 4.0
)

SELECT *
FROM users
WHERE(
    SELECT COUNT(*)
    FROM bookings
    WHERE bookings.user_id = users.user.id
)> 3
-- Alternatively using non correlated subquery--
/*SELECT *
FROM users
WHERE user_id = ANY(
    SELECT user_id
    FROM bookings
    GROUP BY user_id
    HAVING COUNT(booking_id) > 3
)*/