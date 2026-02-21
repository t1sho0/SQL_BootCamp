CREATE OR REPLACE FUNCTION 
    fnc_person_visits_and_eats_on_date(
        pperson varchar DEFAULT 'Dmitriy', 
        pprice INT DEFAULT 500, 
        pdate DATE DEFAULT '2022-01-08')

    RETURNS TABLE (pizzeria_name varchar) AS $$
BEGIN
    RETURN QUERY
    SELECT pz.name FROM person p 
    JOIN person_visits pv ON p.id = pv.person_id 
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN menu m ON pz.id = m.pizzeria_id
    WHERE (p.name = pperson)
        AND (m.price < pprice)
        AND (pv.visit_date = pdate);

END;
$$ LANGUAGE plpgsql;



select *  
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *  
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');



