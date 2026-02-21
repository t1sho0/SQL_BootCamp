INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH nearest_rate AS (
    SELECT
        b.user_id,
        b.money,
        b.type,
        b.currency_id,
        b.updated AS balance_updated,
        (SELECT c.name
         FROM currency c
         WHERE c.id = b.currency_id
         LIMIT 1) AS currency_name,
        COALESCE(
            (SELECT c.rate_to_usd
             FROM currency c
             WHERE c.id = b.currency_id
               AND c.updated <= b.updated
             ORDER BY c.updated DESC
             LIMIT 1),
            (SELECT c.rate_to_usd
             FROM currency c
             WHERE c.id = b.currency_id
               AND c.updated > b.updated
             ORDER BY c.updated ASC
             LIMIT 1)
        ) AS rate
    FROM balance b
    WHERE EXISTS (SELECT 1 FROM currency c WHERE c.id = b.currency_id)
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    nr.currency_name,
    nr.money * nr.rate AS currency_in_usd
FROM "user" u
FULL JOIN nearest_rate nr ON u.id = nr.user_id
WHERE nr.currency_name IS NOT NULL
ORDER BY name DESC, lastname ASC, currency_name ASC;
