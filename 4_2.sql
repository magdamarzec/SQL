/* a. Wyświetl imię i nazwisko w jednej kolumnie. Kolumnie nadaj alias „Pracownik”
b. Złącz kolumny gift i price tak, aby powstał napis: „rower – cena: ”. Kolumnie nadaj alias: cennik.
c. Ponownie wykonaj zadanie 2b – doklej imię i nazwisko pracownika
d. Wyświetl prezenty. Ich nazwy mają być wyświetlane wielkimi literami.
e. Wyświetl imiona. Mają być wyświetlane małymi literami.
f. Wyświetl nazwiska oraz dodatkową kolumnę „długość” zawierającą informację o liczbie liter w nazwisku.
g. Wyświetl pierwsze dwie litery imion.
h. Wyświetl imię, nazwisko i login użytkownika w formacie: mała litera imienia + 3 pierwsze, małe litery nazwiska. */

USE aggregates;

SELECT * FROM batman;

-- a Wyświetl imię i nazwisko w jednej kolumnie. Kolumnie nadaj alias „Pracownik”
SELECT CONCAT(first_name, " ", last_name) AS Pracownik
FROM batman;

-- b Złącz kolumny gift i price tak, aby powstał napis: „rower – cena: ”. Kolumnie nadaj alias: cennik.
SELECT CONCAT(gift, '-', price) AS cennik
FROM batman
LIMIT 1;

-- c Ponownie wykonaj zadanie 2b – doklej imię i nazwisko pracownika
SELECT 
      first_name, 
      last_name,
      CONCAT(gift, '-', price) AS cennik
FROM batman
LIMIT 1;

-- d Wyświetl prezenty. Ich nazwy mają być wyświetlane wielkimi literami.
SELECT UPPER(gift)
FROM batman;

-- e Wyświetl imiona. Mają być wyświetlane małymi literami.
SELECT LOWER(first_name)
FROM batman;

-- f Wyświetl nazwiska oraz dodatkową kolumnę „długość” zawierającą informację o liczbie liter w nazwisku
SELECT
      last_name,
      LENGTH(last_name) AS dlugosc
FROM batman;

-- g Wyświetl pierwsze dwie litery imion.
SELECT
      SUBSTR(first_name, 1, 2)
FROM batman;

-- h Wyświetl imię, nazwisko i login użytkownika w formacie: mała litera imienia + 3 pierwsze, małe litery nazwiska.
SELECT
      first_name,
      last_name,
      CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 3)) AS login
FROM batman;
