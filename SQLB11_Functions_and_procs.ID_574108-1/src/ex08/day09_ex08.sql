CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE(formula NUMERIC) AS $$
DECLARE
    curr INTEGER := 0;
    next INTEGER := 1;
    tmp INTEGER := 0;
BEGIN 
    WHILE curr < pstop LOOP
        formula := curr;
        RETURN NEXT;

        tmp := curr + next;
        curr := next;
        next := tmp;
    END LOOP ;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);

select * from fnc_fibonacci();

