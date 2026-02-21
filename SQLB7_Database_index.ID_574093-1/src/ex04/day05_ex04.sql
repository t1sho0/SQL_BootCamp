-- CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
INSERT INTO menu VALUES ((SELECT MAX(id) + 1 FROM menu),1,'fafa', 900);
RESET enable_seqscan;


