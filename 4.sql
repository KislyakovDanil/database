-- 4) заполнить БД данными

INSERT INTO DB_PROJECT_KISLYAKOV.FRACTION(fraction_id, fraction_nm, colour_code, total_gold_amt) VALUES
  (0, 'England', 11796480, 0)
  ,(1, 'France', 80, 0)
  ,(2, 'Burgundy', 13145600, 0)
  ,(3, 'Scotland', 240, 0)
  ,(4, 'Ireland', 46080, 0);

INSERT INTO DB_PROJECT_KISLYAKOV.UNIT_TYPE(unit_type_dk, unit_type_nm, max_hp_amt, damage_amt, combat_distance_amt, cost_amt) VALUES
  (0, 'England_archer', 12, 8, 3, 16)
  ,(1, 'France_knight', 24, 10, 1, 30)
  ,(2, 'Burgundy_infantryman', 18, 6, 2, 20)
  ,(3, 'Scotland_infantryman', 16, 8, 2, 20)
  ,(4, 'Ireland_infantryman', 12, 6, 1, 8)
  ,(5, 'Standard_archer', 12, 6, 3, 12)
  ,(6, 'Standard_knight', 20, 8, 1, 24)
  ,(7, 'Standard_infantryman', 16, 6, 1, 16);

INSERT INTO DB_PROJECT_KISLYAKOV.BUILDING(building_id, building_nm, food_coeff, gold_income_coeff, max_unit_number_coeff, cost_amt) VALUES
  (0, 'barracks', 1, 1, 1.5, 120)
  ,(1, 'tavern', 1.2, 1, 1, 80)
  ,(2, 'castle', 1.2, 0.8, 2, 200)
  ,(3, 'town_hall', 1.2, 1.2, 1, 120)
  ,(4, 'farm', 1.5, 1, 1, 100)
  ,(5, 'workshop', 1, 1.5, 1, 100)
  ,(6, 'brothel', 1, 1.2, 1.2, 120)
  ,(7, 'hospital', 2, 1, 1, 200);

INSERT INTO DB_PROJECT_KISLYAKOV.ARMY(army_id, fraction_id, commander_nm, unit_number_amt, longitude, latitude) VALUES
  (0, 0, 'Edward III', 4, 1, 2)
  ,(1, 0, 'William', 2, 3, 4)
  ,(2, 1, 'Philip', 3, 5, 6)
  ,(3, 1, 'Charles', 1, 7, 8)
  ,(4, 2, 'John', 2, 9, 10)
  ,(5, 3, 'David II', 2, 11, 12)
  ,(6, 4, 'Edward', 1, 13, 14);

INSERT INTO DB_PROJECT_KISLYAKOV.CITY(city_id, fraction_id, city_nm, food_amt, gold_income_amt, max_unit_created_amt, unit_created_amt, longitude, latitude) VALUES
  (0, 0, 'London', 8, 12, 6, 4, 1, 2)
  ,(1, 0, 'Nottingham', 6, 6, 4, 2, 3, 4)
  ,(2, 1, 'Paris', 8, 8, 4, 3, 5, 6)
  ,(3, 1, 'Orleans', 8, 6, 4, 1, 7, 8)
  ,(4, 2, 'Dijon', 8, 6, 4, 2, 9, 10)
  ,(5, 3, 'Edinburgh', 6, 4, 3, 2, 11, 12)
  ,(6, 4, 'Dublin', 4, 4, 2, 1, 13, 14);

INSERT INTO DB_PROJECT_KISLYAKOV.UNIT(unit_id, army_id, city_id, unit_type_dk, hp_amt) VALUES
  (0, 0, 0, 0, 12)
  ,(1, 0, 0, 0, 8)
  ,(2, 0, 0, 7, 16)
  ,(3, 0, 0, 6, 15)
  ,(4, 1, 1, 0, 12)
  ,(5, 1, 1, 7, 14)
  ,(6, 2, 2, 1, 22)
  ,(7, 2, 2, 1, 20)
  ,(8, 2, 2, 1, 24)
  ,(9, 3, 3, 7, 16)
  ,(10, 4, 4, 2, 16)
  ,(11, 4, 4, 5, 12)
  ,(12, 5, 5, 3, 14)
  ,(13, 5, 5, 3, 16)
  ,(14, 6, 6, 4, 8);

INSERT INTO DB_PROJECT_KISLYAKOV.FRACTION_X_UNIT_TYPE(fraction_id, unit_type_dk) VALUES
  (0, 0)
  ,(0, 6)
  ,(0, 7)
  ,(1, 5)
  ,(1, 1)
  ,(1, 7)
  ,(2, 5)
  ,(2, 6)
  ,(2, 2)
  ,(3, 5)
  ,(3, 6)
  ,(3, 3)
  ,(4, 5)
  ,(4, 6)
  ,(4, 4);

INSERT INTO DB_PROJECT_KISLYAKOV.BUILDING_X_UNIT_TYPE(building_id, unit_type_dk) VALUES
  (0, 0)
  ,(0, 5)
  ,(2, 1)
  ,(2, 6);

INSERT INTO DB_PROJECT_KISLYAKOV.CITY_X_BUILDING(city_id, building_id) VALUES
  (0, 0)
  ,(0, 2)
  ,(0, 6)
  ,(1, 0)
  ,(1, 4)
  ,(2, 2)
  ,(2, 3)
  ,(2, 6)
  ,(3, 0)
  ,(3, 4)
  ,(4, 4)
  ,(4, 6)
  ,(5, 0)
  ,(5, 4)
  ,(6, 4);