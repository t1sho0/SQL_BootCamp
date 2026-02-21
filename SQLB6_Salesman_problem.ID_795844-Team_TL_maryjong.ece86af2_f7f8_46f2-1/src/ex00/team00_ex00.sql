-- CREATE TABLE nodes (
--     point1 VARCHAR,
--     point2 VARCHAR,
--     cost INT
-- );

-- INSERT INTO nodes VALUES ('a', 'b', 10), ('b', 'a', 10);
-- INSERT INTO nodes VALUES ('a', 'c', 15), ('c', 'a', 15);
-- INSERT INTO nodes VALUES ('a', 'd', 20), ('d', 'a', 20);
-- INSERT INTO nodes VALUES ('d', 'b', 25), ('b', 'd', 25);
-- INSERT INTO nodes VALUES ('d', 'c', 30), ('c', 'd', 30);
-- INSERT INTO nodes VALUES ('c', 'b', 35), ('b', 'c', 35);

WITH RECURSIVE paths AS (
    SELECT 
        point2 AS last_point, 
        cost AS total_cost, 
        ARRAY['a', point2]::varchar[] AS tour
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL 

    SELECT 
        n.point2,
        p.total_cost + n.cost,
        p.tour || n.point2
    FROM nodes n 
    JOIN paths p ON p.last_point = n.point1
    WHERE 
        (n.point2 <> ALL(p.tour))
        OR (cardinality(p.tour) = 4 AND n.point2 = 'a')
) 
SELECT total_cost, tour 
FROM paths
WHERE cardinality(tour) = 5 AND tour[5] = 'a'
  AND total_cost = (
      SELECT MIN(total_cost) 
      FROM paths 
      WHERE cardinality(tour) = 5 AND tour[5] = 'a'
  )
ORDER BY 1, 2;
