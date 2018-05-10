-- 3) создание таблиц

CREATE TABLE DB_PROJECT_KISLYAKOV.FRACTION (
  fraction_id INT PRIMARY KEY NOT NULL
  ,fraction_nm VARCHAR(50) NOT NULL
  ,colour_code INT NOT NULL CHECK ( colour_code >= 0) CHECK ( colour_code <= 16777215)
  ,total_gold_amt INT NOT NULL CHECK ( total_gold_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.UNIT_TYPE (
  unit_type_dk INT PRIMARY KEY NOT NULL
  ,unit_type_nm VARCHAR(50) NOT NULL
  ,max_hp_amt INT NOT NULL CHECK ( max_hp_amt > 0)
  ,damage_amt INT NOT NULL CHECK ( damage_amt > 0)
  ,combat_distance_amt INT NOT NULL CHECK ( combat_distance_amt >= 0)
  ,cost_amt INT NOT NULL CHECK ( cost_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.BUILDING (
  building_id INT PRIMARY KEY NOT NULL
  ,building_nm VARCHAR(50) NOT NULL
  ,food_coeff FLOAT NOT NULL CHECK ( food_coeff >= 0)
  ,gold_income_coeff FLOAT NOT NULL CHECK ( gold_income_coeff >= 0)
  ,max_unit_number_coeff FLOAT NOT NULL CHECK ( max_unit_number_coeff >= 0)
  ,cost_amt INT NOT NULL CHECK ( cost_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.ARMY (
  army_id INT PRIMARY KEY NOT NULL
  ,fraction_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.FRACTION(fraction_id)
  ,commander_nm VARCHAR(50) NOT NULL
  ,unit_number_amt INT NOT NULL CHECK ( unit_number_amt >= 0)
  ,longitude INT NOT NULL CHECK (longitude >= 0)
  ,latitude INT NOT NULL CHECK ( latitude >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.CITY (
  city_id INT PRIMARY KEY NOT NULL
  ,fraction_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.FRACTION(fraction_id)
  ,city_nm VARCHAR(50) NOT NULL
  ,food_amt INT NOT NULL CHECK ( food_amt >= 0)
  ,gold_income_amt INT NOT NULL CHECK ( gold_income_amt >= 0)
  ,max_unit_created_amt INT NOT NULL CHECK ( max_unit_created_amt >= 0)
  ,unit_created_amt INT NOT NULL CHECK ( unit_created_amt >= 0) CHECK ( unit_created_amt <= max_unit_created_amt)
  ,longitude INT NOT NULL CHECK (longitude >= 0)
  ,latitude INT NOT NULL CHECK ( latitude >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.UNIT (
  unit_id INT PRIMARY KEY NOT NULL
  ,army_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.ARMY(army_id)
  ,city_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.CITY(city_id)
  ,unit_type_dk INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk)
  ,hp_amt INT NOT NULL CHECK ( hp_amt >= 0)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.FRACTION_X_UNIT_TYPE (
  fraction_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.FRACTION(fraction_id)
  ,unit_type_dk INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk)
  ,CONSTRAINT pk_fraction_x_unit_type PRIMARY KEY (fraction_id,unit_type_dk)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.BUILDING_X_UNIT_TYPE (
  building_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.BUILDING(building_id)
  ,unit_type_dk INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk)
  ,CONSTRAINT pk_building_x_unit_type PRIMARY KEY (building_id,unit_type_dk)
);

CREATE TABLE DB_PROJECT_KISLYAKOV.CITY_X_BUILDING (
  city_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.CITY(city_id)
  ,building_id INT NOT NULL REFERENCES DB_PROJECT_KISLYAKOV.BUILDING(building_id)
  ,CONSTRAINT pk_city_x_building PRIMARY KEY (city_id,building_id)
);