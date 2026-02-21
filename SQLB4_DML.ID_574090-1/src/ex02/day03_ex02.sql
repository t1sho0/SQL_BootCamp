SELECT m.pizza_name, m.price, pz.name AS pizzeria_name 
FROM pizzeria AS pz
JOIN menu AS m ON pz.id = m.pizzeria_id
WHERE m.id NOT IN (SELECT menu_id FROM person_order)
ORDER BY 1, 2;