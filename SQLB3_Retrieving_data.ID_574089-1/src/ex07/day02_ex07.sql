SELECT pz.name, m.pizza_name, m.price
FROM person AS p
JOIN person_visits AS pv ON p.id = pv.person_id
JOIN menu AS m ON pv.pizzeria_id = m.pizzeria_id
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
WHERE p.name = 'Dmitriy' 
    AND pv.visit_date = '2022-01-08' 
    AND m.price < 800;


