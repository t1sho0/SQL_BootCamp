SELECT m.pizza_name AS pizza_name, pz.name AS pizzeria_name, m.price AS price
FROM (SELECT pizzeria_id, pizza_name, price FROM menu
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza') AS m 
LEFT JOIN pizzeria AS pz
ON m.pizzeria_id = pz.id
ORDER BY 1, 2;