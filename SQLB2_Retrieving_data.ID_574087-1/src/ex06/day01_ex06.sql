SELECT action_date, 
    (SELECT name FROM person WHERE person.id = res.person_id) AS person_name
FROM (
    SELECT visit_date AS action_date, person_id FROM person_visits
    INTERSECT
    SELECT order_date AS action_date, person_id FROM person_order
) AS res
ORDER BY action_date ASC, person_name DESC;