SELECT object_name
FROM (
    SELECT name AS object_name, 1 AS label
    FROM person
    UNION ALL 
    SELECT pizza_name, 2 AS label
    FROM menu
) AS combined_data
ORDER BY label, object_name;