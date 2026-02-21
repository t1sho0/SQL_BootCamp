-- CREATE OR REPLACE FUNCTION fnc_person_female()
-- RETURNS SETOF person AS $$
--     SELECT * FROM person WHERE gender = 'female';
-- $$ LANGUAGE SQL;


-- CREATE OR REPLACE FUNCTION fnc_person_male()
-- RETURNS SETOF person AS $$
--     SELECT * FROM person WHERE gender = 'male';
-- $$ LANGUAGE SQL;

SELECT * FROM fnc_person_female();
SELECT * FROM fnc_person_male();

-- DROP FUNCTION IF EXISTS fnc_person_female;
-- DROP FUNCTION IF EXISTS fnc_person_male;

