SELECT * 
FROM bookings
INNER JOIN user ON users.user_id = bookings.user_id;

SELECT *
FROM properties
LEFT JOIN reviews ON reviews.property_id = properties.property_id

SELECT *
FROM bookings
FULL OUTER JOIN users ON users.user_id = bookings.user_id