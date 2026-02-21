WITH dates AS (
    SELECT dates.missing_date::date
    FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS dates(missing_date))
SELECT missing_date FROM dates
LEFT JOIN 
    (SELECT visit_date FROM person_visits
    WHERE person_id = 1 OR person_id = 2) AS pv
ON dates.missing_date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY 1; 
