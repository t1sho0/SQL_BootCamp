WITH last_currency_rate AS (
    SELECT DISTINCT ON (id)
        id,
        name,
        rate_to_usd,
        updated
    FROM currency
    ORDER BY id, updated DESC
),
balance_agg AS (
    SELECT
        b.user_id,
        b.type,
        b.currency_id,
        SUM(b.money) AS volume
    FROM balance b
    GROUP BY b.user_id, b.type, b.currency_id
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    ba.type,
    ba.volume,
    COALESCE(lcr.name, 'not defined') AS currency_name,
    COALESCE(lcr.rate_to_usd, 1) AS last_rate_to_usd,
    ba.volume * COALESCE(lcr.rate_to_usd, 1) AS total_volume_in_usd
FROM balance_agg ba
FULL JOIN "user" u ON u.id = ba.user_id
LEFT JOIN last_currency_rate lcr ON lcr.id = ba.currency_id
ORDER BY name DESC, lastname ASC, type ASC;
