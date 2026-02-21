SELECT order_date, p.name || '(age:' || p.age || ')' AS person_information
FROM person_order as p_o
JOIN person AS p ON p.id = p_o.person_id
ORDER BY order_date ASC, person_information ASC;