-- 7)  по 1 представлению на таблицу

CREATE OR REPLACE TEMP VIEW VIEW_FRACTION AS
  (SELECT
    fraction_nm
    ,total_gold_amt
  FROM
    DB_PROJECT_KISLYAKOV.FRACTION
  );

SELECT *
FROM
  VIEW_FRACTION;

CREATE OR REPLACE TEMP VIEW VIEW_UNIT_TYPE AS
  (SELECT
    unit_type_nm
    ,max_hp_amt
    ,damage_amt
    ,combat_distance_amt
    ,cost_amt
  FROM
    DB_PROJECT_KISLYAKOV.UNIT_TYPE
  );

SELECT *
FROM
  VIEW_UNIT_TYPE;

CREATE OR REPLACE TEMP VIEW VIEW_BUILDING AS
  (SELECT
    building_nm
    ,food_coeff
    ,gold_income_coeff
    , max_unit_number_coeff
    ,cost_amt
  FROM
    DB_PROJECT_KISLYAKOV.BUILDING
  );

SELECT *
FROM
  VIEW_BUILDING;

CREATE OR REPLACE TEMP VIEW VIEW_ENGLISH_ARMIES AS
  (SELECT
    commander_nm
    ,unit_number_amt
  FROM
    DB_PROJECT_KISLYAKOV.ARMY
  WHERE
    fraction_id = 0
  );

SELECT *
FROM
  VIEW_ENGLISH_ARMIES;

CREATE OR REPLACE TEMP VIEW VIEW_ENGLISH_CITIES AS
  (SELECT
    city_nm
    ,food_amt
    ,gold_income_amt
    ,max_unit_created_amt
    ,unit_created_amt
  FROM
    DB_PROJECT_KISLYAKOV.CITY
  WHERE
    fraction_id = 0
  );

SELECT *
FROM
  VIEW_ENGLISH_CITIES;

CREATE OR REPLACE TEMP VIEW VIEW_0_ARMY_UNITS AS
  (SELECT
    city_id
    ,unit_type_dk
    ,hp_amt
  FROM
    DB_PROJECT_KISLYAKOV.UNIT
  WHERE
    army_id = 0
  );

SELECT *
FROM
  VIEW_0_ARMY_UNITS;