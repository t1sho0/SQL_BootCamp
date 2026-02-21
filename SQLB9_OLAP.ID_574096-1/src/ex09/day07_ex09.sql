SELECT 
    address, 
    ROUND(MAX(age) - (MIN(age) / MAX(age)::numeric ), 2) AS formula,
    ROUND(AVG(age), 2) AS avarage, 
    CASE 
        WHEN
            ROUND(MAX(person.age) - (MIN(person.age) / MAX(person.age)::numeric), 2) > ROUND(AVG(person.age), 2) 
            THEN 'true'
        ELSE 'false'
    END AS comparison
FROM person
GROUP BY address
ORDER BY 1;
