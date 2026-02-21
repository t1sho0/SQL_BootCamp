-- CREATE UNIQUE INDEX idx_person_discounts_unique 
-- ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT * FROM person_discounts AS pd
JOIN person AS p ON pd.person_id = p.id
WHERE p.name = 'Denis';
RESET enable_seqscan;
