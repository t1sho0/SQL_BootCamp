SELECT p.name, m.pizza_name, m.price, 
m.price - (m.price * pd.discount / 100) AS discount_price, pz.name AS pizzeria_name
FROM person_discounts AS pd
JOIN person AS p ON pd.person_id = p.id
JOIN pizzeria AS pz ON pd.pizzeria_id = pz.id
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON po.menu_id = m.id
ORDER BY 1, 2;

