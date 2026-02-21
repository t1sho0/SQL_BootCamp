-- CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE 
SELECT * FROM person WHERE UPPER(name) = 'DENIS';
RESET enable_seqscan;
