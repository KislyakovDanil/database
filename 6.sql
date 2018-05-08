-- 6) CRUD-запросы

INSERT INTO DB_PROJECT_KISLYAKOV.FRACTION(fraction_id, fraction_nm, colour_code, total_gold_amt) VALUES
  (1, 'England', 11796480, 0);

INSERT INTO DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk, unit_type_nm, max_hp_amt, damage_amt, combat_distance_amt, cost_amt) VALUES
  (0, 'archer', 12, 6, 3, 12);

UPDATE DB_PROJECT_KISLYAKOV.FRACTION
  SET total_gold_amt = 1000
  WHERE fraction_id = 1;

UPDATE DB_PROJECT_KISLYAKOV.UNIT_TYPE
  SET max_hp_amt = 10
  WHERE unit_type_dk = 0;

DELETE FROM DB_PROJECT_KISLYAKOV.FRACTION
  WHERE fraction_id = 1;

DELETE FROM DB_PROJECT_KISLYAKOV.UNIT_TYPE
  WHERE unit_type_dk = 0;