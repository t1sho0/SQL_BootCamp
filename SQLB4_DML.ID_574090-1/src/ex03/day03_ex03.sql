(SELECT pz.name AS pizzeria_name 
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE gender = 'female'
EXCEPT ALL
SELECT pz.name AS pizzeria_name 
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE gender = 'male' )

UNION ALL

(SELECT pz.name AS pizzeria_name 
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE gender = 'male'
EXCEPT ALL
SELECT pz.name AS pizzeria_name 
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE gender = 'female' )

ORDER BY 1;