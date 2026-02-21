-- TERMINAL 1

BEGIN;
SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- TERMINAL 2

BEGIN;
INSERT INTO pizzeria VALUES (
    10,
    'Kazan pizza',
    5
);
COMMIT;

