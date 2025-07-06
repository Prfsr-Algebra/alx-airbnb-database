SELECT user_id, COUNT(*) AS total_booking
FROM bookings
GROUP BY bookings.user_id

SELECT p.property_id, p.name, b.booking_id, COUNT(b.booking_id),
RANK() OVER(
    ORDER BY COUNT(b.booking_id)
) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON b.property_id = p.property_id
GROUP BY p.property_id, p.name
SELECT p.property_id, p.name, b.booking_id, COUNT(b.booking_id),
ROW_NUMBER() OVER(
    ORDER BY COUNT(b.booking_id)
) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON b.property_id = p.property_id
GROUP BY p.property_id, p.name
