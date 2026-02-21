SELECT m.pizza_name AS pizza_name,
    pz.name AS pizzeria_name
FROM person
JOIN person_order AS po ON person.id = po.person_id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY 1, 2; 