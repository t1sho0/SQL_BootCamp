SELECT order_date, name || '(age:' || age || ')' as person_information
FROM 
    (SELECT id AS person_id, name, age FROM person) AS p
NATURAL JOIN person_order as p_o
ORDER BY order_date ASC, person_information ASC;  
