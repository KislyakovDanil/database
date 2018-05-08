CREATE DATABASE DB_PROJECT_KISLYAKOV;

-- 3) создание таблиц

CREATE TABLE DB_PROJECT_KISLYAKOV.FRACTION (
  fraction_id INT PRIMARY KEY NOT NULL,
  fraction_nm VARCHAR(50) NOT NULL,
  colour_code INT NOT NULL CHECK ( colour_code >= 0) CHECK ( colour_code <= 16777215),
  total_gold_amt INT NOT NULL CHECK ( total_gold_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.UNIT_TYPE (
  unit_type_dk INT PRIMARY KEY NOT NULL,
  unit_type_nm VARCHAR(50) NOT NULL,
  max_hp_amt INT NOT NULL CHECK ( max_hp_amt > 0),
  damage_amt INT NOT NULL CHECK ( damage_amt > 0),
  combat_distance_amt INT NOT NULL CHECK ( combat_distance_amt >= 0),
  cost_amt INT NOT NULL CHECK ( cost_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.BUILDING (
  building_id INT PRIMARY KEY NOT NULL,
  building_nm VARCHAR(50) NOT NULL,
  food_coeff FLOAT NOT NULL CHECK ( food_coeff >= 0),
  gold_income_coeff FLOAT NOT NULL CHECK ( gold_income_coeff >= 0),
  max_unit_number_coeff FLOAT NOT NULL CHECK ( max_unit_number_coeff >= 0),
  cost_amt INT NOT NULL CHECK ( cost_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.ARMY (
  army_id INT PRIMARY KEY NOT NULL,
  fraction_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.FRACTION(fraction_id),
  commander_nm VARCHAR(50) NOT NULL,
  unit_number_amt INT NOT NULL CHECK ( unit_number_amt >= 0),
  longitude INT NOT NULL CHECK (longitude >= 0),
  latitude INT NOT NULL CHECK ( latitude >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.CITY (
  city_id INT PRIMARY KEY NOT NULL,
  fraction_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.FRACTION(fraction_id),
  city_nm VARCHAR(50) NOT NULL,
  food_amt INT NOT NULL CHECK ( food_amt >= 0),
  gold_income_amt INT NOT NULL CHECK ( gold_income_amt >= 0),
  max_unit_created_amt INT NOT NULL CHECK ( max_unit_created_amt >= 0),
  unit_created_amt INT NOT NULL CHECK ( unit_created_amt >= 0) CHECK ( unit_created_amt <= max_unit_created_amt),
  longitude INT NOT NULL CHECK (longitude >= 0),
  latitude INT NOT NULL CHECK ( latitude >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.UNIT (
  unit_id INT PRIMARY KEY NOT NULL,
  army_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.ARMY(army_id),
  city_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.CITY(city_id),
  unit_type_dk INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk),
  hp_amt INT NOT NULL CHECK ( hp_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.FRACTION_X_UNIT_TYPE (
  fraction_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.FRACTION(fraction_id),
  unit_type_dk INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk),
  CONSTRAINT pk_fraction_x_unit_type PRIMARY KEY (fraction_id,unit_type_dk)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.BUILDING_X_UNIT_TYPE (
  building_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.BUILDING(building_id),
  unit_type_dk INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk),
  CONSTRAINT pk_building_x_unit_type PRIMARY KEY (building_id,unit_type_dk)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.CITY_X_BUILDING (
  city_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.CITY(city_id),
  building_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.BUILDING(building_id),
  CONSTRAINT pk_city_x_building PRIMARY KEY (city_id,building_id)
);

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

-- 4) заполнить БД данными

INSERT INTO DB_PROJECT_KISLYAKOV.FRACTION(fraction_id, fraction_nm, colour_code, total_gold_amt) VALUES
  (0, 'England', 11796480, 0),
  (1, 'France', 80, 0),
  (2, 'Burgundy', 13145600, 0),
  (3, 'Scotland', 240, 0),
  (4, 'Ireland', 46080, 0);

INSERT INTO DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk, unit_type_nm, max_hp_amt, damage_amt, combat_distance_amt, cost_amt) VALUES
  (0, 'England_archer', 12, 8, 3, 16),
  (1, 'France_knight', 24, 10, 1, 30),
  (2, 'Burgundy_infantryman', 18, 6, 2, 20),
  (3, 'Scotland_infantryman', 16, 8, 2, 20),
  (4, 'Ireland_infantryman', 12, 6, 1, 8),
  (5, 'Standard_archer', 12, 6, 3, 12),
  (6, 'Standard_knight', 20, 8, 1, 24),
  (7, 'Standard_infantryman', 16, 6, 1, 16);

INSERT INTO DB_PROJECT_KISLYAKOV.BUILDING(building_id, building_nm, food_coeff, gold_income_coeff, max_unit_number_coeff, cost_amt) VALUES
  (0, 'barracks', 1, 1, 1.5, 120),
  (1, 'tavern', 1.2, 1, 1, 80),
  (2, 'castle', 1.2, 0.8, 2, 200),
  (3, 'town_hall', 1.2, 1.2, 1, 120),
  (4, 'farm', 1.5, 1, 1, 100),
  (5, 'workshop', 1, 1.5, 1, 100),
  (6, 'brothel', 1, 1.2, 1.2, 120),
  (7, 'hospital', 2, 1, 1, 200);

INSERT INTO DB_PROJECT_KISLYAKOV.ARMY(army_id, fraction_id, commander_nm, unit_number_amt, longitude, latitude) VALUES
  (0, 0, 'Edward III', 4, 1, 2),
  (1, 0, 'William', 2, 3, 4),
  (2, 1, 'Philip', 3, 5, 6),
  (3, 1, 'Charles', 1, 7, 8),
  (4, 2, 'John', 2, 9, 10),
  (5, 3, 'David II', 2, 11, 12),
  (6, 4, 'Edward', 1, 13, 14);

INSERT INTO DB_PROJECT_KISLYAKOV.CITY(city_id, fraction_id, city_nm, food_amt, gold_income_amt, max_unit_created_amt, unit_created_amt, longitude, latitude) VALUES
  (0, 0, 'London', 8, 12, 6, 4, 1, 2),
  (1, 0, 'Nottingham', 6, 6, 4, 2, 3, 4),
  (2, 1, 'Paris', 8, 8, 4, 3, 5, 6),
  (3, 1, 'Orleans', 8, 6, 4, 1, 7, 8),
  (4, 2, 'Dijon', 8, 6, 4, 2, 9, 10),
  (5, 3, 'Edinburgh', 6, 4, 3, 2, 11, 12),
  (6, 4, 'Dublin', 4, 4, 2, 1, 13, 14);

INSERT INTO DB_PROJECT_KISLYAKOV.UNIT(unit_id, army_id, city_id, unit_type_dk, hp_amt) VALUES
  (0, 0, 0, 0, 12),
  (1, 0, 0, 0, 8),
  (2, 0, 0, 7, 16),
  (3, 0, 0, 6, 15),
  (4, 1, 1, 0, 12),
  (5, 1, 1, 7, 14),
  (6, 2, 2, 1, 22),
  (7, 2, 2, 1, 20),
  (8, 2, 2, 1, 24),
  (9, 3, 3, 7, 16),
  (10, 4, 4, 2, 16),
  (11, 4, 4, 5, 12),
  (12, 5, 5, 3, 14),
  (13, 5, 5, 3, 16),
  (14, 6, 6, 4, 8);

INSERT INTO DB_PROJECT_KISLYAKOV.FRACTION_X_UNIT_TYPE(fraction_id, unit_type_dk) VALUES
  (0, 0),
  (0, 6),
  (0, 7),
  (1, 5),
  (1, 1),
  (1, 7),
  (2, 5),
  (2, 6),
  (2, 2),
  (3, 5),
  (3, 6),
  (3, 3),
  (4, 5),
  (4, 6),
  (4, 4);

INSERT INTO DB_PROJECT_KISLYAKOV.BUILDING_X_UNIT_TYPE(building_id, unit_type_dk) VALUES
  (0, 0),
  (0, 5),
  (2, 1),
  (2, 6);

INSERT INTO DB_PROJECT_KISLYAKOV.CITY_X_BUILDING(city_id, building_id) VALUES
  (0, 0),
  (0, 2),
  (0, 6),
  (1, 0),
  (1, 4),
  (2, 2),
  (2, 3),
  (2, 6),
  (3, 0),
  (3, 4),
  (4, 4),
  (4, 6),
  (5, 0),
  (5, 4),
  (6, 4);

-- 5) 5 простых запросов

-- id всех анлнийских лучников в Лондоне

SELECT
  unit_id
FROM
  DB_PROJECT_KISLYAKOV.UNIT
WHERE
  army_id = 0
  AND unit_type_dk = 0;

-- сумма хп всех войск Шотландии

SELECT
  sum(hp_amt)
FROM
  DB_PROJECT_KISLYAKOV.UNIT
WHERE
  army_id IN(
    SELECT
      army_id
    FROM
      DB_PROJECT_KISLYAKOV.ARMY
    WHERE
      fraction_id = 3
  );

-- все виды пехоты, их характеристики и стоимость

SELECT
  unit_type_nm
  ,max_hp_amt
  ,damage_amt
  ,combat_distance_amt
  ,cost_amt
FROM
  DB_PROJECT_KISLYAKOV.UNIT_TYPE
WHERE
  unit_type_nm LIKE '%infantryman%';

-- id потенциальных дезертиров в Английской армии

SELECT
  unit_id
FROM
  DB_PROJECT_KISLYAKOV.UNIT
WHERE
  city_id IN(
    SELECT
      city_id
    FROM
      DB_PROJECT_KISLYAKOV.CITY
    WHERE
      food_amt - unit_created_amt <= 4
      AND fraction_id = 0
  );

-- города в которых построен замок или казармы

SELECT
  city_id
  ,city_nm
FROM
  DB_PROJECT_KISLYAKOV.CITY
WHERE
  city_id IN (
    SELECT DISTINCT
      city_id
    FROM
      DB_PROJECT_KISLYAKOV.CITY_X_BUILDING
    WHERE
      building_id = 0
      OR building_id = 2
  );

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

-- 8) 2 сложных представления (с джойном)

-- общее число юнитов в разичных фракциях

CREATE OR REPLACE TEMP VIEW VIEW_FRACTIONS_ARMIES_SIZE AS
  (SELECT
    FRACTION.fraction_nm
    ,sum(ARMY.unit_number_amt)
  FROM
    DB_PROJECT_KISLYAKOV.FRACTION
    INNER JOIN
    DB_PROJECT_KISLYAKOV.ARMY
    ON
      FRACTION.fraction_id = ARMY.fraction_id
  GROUP BY
    FRACTION.fraction_nm
  );

SELECT *
FROM
  VIEW_FRACTIONS_ARMIES_SIZE;

-- города, в которых построен бордель

CREATE OR REPLACE TEMP VIEW VIEW_CITIES_WITH_BROTHEL AS
  (SELECT
    CB.city_nm
  FROM
    (DB_PROJECT_KISLYAKOV.CITY
    INNER JOIN
    DB_PROJECT_KISLYAKOV.CITY_X_BUILDING
    ON
      CITY.city_id = CITY_X_BUILDING.city_id) AS CB
    INNER JOIN
    DB_PROJECT_KISLYAKOV.BUILDING
    ON
      CB.building_id = BUILDING.building_id
  WHERE
    BUILDING.building_id = 6
  );

SELECT *
FROM
  VIEW_CITIES_WITH_BROTHEL;

DROP DATABASE DB_PROJECT_KISLYAKOV;