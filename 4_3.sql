/*a. Rozłóż datę pokazaną w kolumnie start_date na trzy kolumny: rok, miesiąc, dzień.
b. Wyświetl kolumnę start_date oraz kolumnę final_date, która wyświetli datę o 3 dni późniejszą, niż data w start_date.
c. Wyświetl dzisiejszą datę.
d. Wyświetl nazwę obecnego miesiąca.
e. Wyświetl start_date, a następnie kolumny określające: numer tygodnia, nazwę miesiąca, kwartał, numer dnia w roku.*/

USE aggregates;

SELECT * FROM batman;

-- a Rozłóż datę pokazaną w kolumnie start_date na trzy kolumny: rok, miesiąc, dzień.
SELECT 
    DAY(start_date) AS DAY,
    MONTH(start_date) AS MONTH,
    YEAR(start_date) AS YEAR
 FROM batman;
 
 -- b Wyświetl kolumnę start_date oraz kolumnę final_date, która wyświetli datę o 3 dni późniejszą, niż data w start_date.
 SELECT
       start_date,
       DATE_ADD(start_date, INTERVAL + 3 DAY) AS final_date
 FROM batman;

-- c Wyświetl dzisiejszą datę.
SELECT
     DATE(CURRENT_TIMESTAMP) AS Dzisiejsza_data;
     
-- d Wyświetl nazwę obecnego miesiąca.
SELECT
     MONTHNAME (CURRENT_TIMESTAMP)  AS obecny_miesiąc;
     
-- e Wyświetl start_date, a następnie kolumny określające: numer tygodnia, nazwę miesiąca, kwartał, numer dnia w roku.
SELECT
      start_date,
      WEEK (start_date) AS numer_tygodnia,
      MONTHNAME (start_date) AS nazwa_miesiaca,
      QUARTER (start_date) AS kwartał,
      DAYOFYEAR (start_date) AS numer_dnia_w_roku
FROM batman;

