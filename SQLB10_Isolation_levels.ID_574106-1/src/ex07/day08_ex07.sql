-- TERMINAL 1

BEGIN;
UPDATE pizzeria SET rating = 1.6 WHERE id = 1;
UPDATE pizzeria SET rating = 3.2 WHERE id = 2;

-- TERMINAL 2

BEGIN;
UPDATE pizzeria SET rating = 2.2 WHERE id = 2;
UPDATE pizzeria SET rating = 2.3 WHERE id = 1;

