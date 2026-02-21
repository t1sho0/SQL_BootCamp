SELECT p.name
FROM person AS p 
JOIN person_order as po ON p.id = po.person_id
JOIN menu AS m ON po.menu_id = m.id
WHERE (p.address = 'Moscow' OR p.address = 'Samara')
    AND (p.gender = 'male')
    AND (m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza')
ORDER BY 1 DESC;

