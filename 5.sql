-- 5) 5 простых запросов

-- id всех анлнийских лучников в армии Эдварда III

SELECT
  unit_id
FROM
  DB_PROJECT_KISLYAKOV.UNIT
WHERE
  army_id = (
    SELECT
      army_id
    FROM
      DB_PROJECT_KISLYAKOV.ARMY
    WHERE
      commander_nm = 'Edward III'
  )
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
      fraction_id = (
        SELECT
          fraction_id
        FROM
          DB_PROJECT_KISLYAKOV.FRACTION
        WHERE
          fraction_nm = 'Scotland'
      )
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
      AND fraction_id = (
        SELECT
          fraction_id
        FROM
          DB_PROJECT_KISLYAKOV.FRACTION
        WHERE
          fraction_nm = 'England'
      )
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
      building_id IN (
        SELECT
          building_id
        FROM
          DB_PROJECT_KISLYAKOV.BUILDING
        WHERE
          building_nm = 'barracks'
          OR building_nm = 'castle'
      )
  );