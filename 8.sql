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