SELECT pz.name AS pizzeria_name FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pz.name AS pizzeria_name FROM person_order AS po 
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
WHERE p.name = 'Andrey'
ORDER BY 1;