-- EXPLAIN ANALYZE
-- SELECT
--     m.pizza_name AS pizza_name,
--     max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
-- FROM  menu m
-- INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1,2;

-- в первый запуск выдал вот такой результат (actual time=0.181..0.182 rows=19.00 loops=1)
-- Planing time: 3.303 ms
-- Execusition time: 0.283 ms

-- CREATE INDEX idx_1 ON pizzeria (id, rating);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
RESET enable_seqscan;

--  (actual time=0.265..267 rows=19.00 loops=1)
-- Planing time=2.809 ms
-- Execution time=0.369 ms