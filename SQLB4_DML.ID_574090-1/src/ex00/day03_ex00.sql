SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
FROM person AS p
JOIN person_visits AS pv ON p.id = person_id
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
JOIN menu AS m ON pz.id = m.pizzeria_id
WHERE (p.name = 'Kate')
    AND (m.price BETWEEN 800 AND 1000)
ORDER BY 1, 2, 3;
