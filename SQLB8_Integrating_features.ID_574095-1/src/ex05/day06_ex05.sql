COMMENT ON TABLE person_discounts IS 'Таблица для хранения персональных скидок пользователя';
COMMENT ON COLUMN person_discounts.person_id IS 'id Пользователя (ссылка на таблицу person)';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id Пиццерии (ссылка на таблицу pizzeria)';
COMMENT ON COLUMN person_discounts.discount IS 'Значение самой скидки пользователя';