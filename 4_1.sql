CREATE DATABASE aggregates;


CREATE TABLE aggregates.batman(
  id INTEGER PRIMARY KEY NOT NULL,
  first_name TEXT,
  last_name TEXT,
  sex CHAR(1),
  age INTEGER,
  price DOUBLE,
  start_date DATE,
  gift TEXT
);

INSERT INTO aggregates.batman VALUES (1, 'Alicja', 'Rogal', 'F', 16, 100.25,'2020-01-02', 'rower' );
INSERT INTO aggregates.batman VALUES (2, 'Iwona', 'Kowalska', 'F', 33, 56.58, '2020-01-03', 'komputer');
INSERT INTO aggregates.batman VALUES (3, 'Igor', 'Kowalski', 'M', 50, 68.00, '2020-01-04', 'karty');
INSERT INTO aggregates.batman VALUES (4, 'Kamil', 'Juszczak', 'M', 50, 40.87, '2020-01-05', 'piłka'); 
INSERT INTO aggregates.batman VALUES (5, 'Konrad', 'Kowal', 'M', 18, 32.63, '2020-01-06', 'herbata' );
INSERT INTO aggregates.batman VALUES (6, 'Iwona', 'Feniks', 'F', 35, 78.98, '2020-01-07', 'okno' );
INSERT INTO aggregates.batman VALUES (7, 'Robert', 'Lew', 'M', 40, 120.32, '2020-01-08', 'drzwi');
INSERT INTO aggregates.batman VALUES (8, 'Tomasz', 'Nowak', 'M', 60, 150.00, '2020-01-09', 'korona');
INSERT INTO aggregates.batman VALUES (9, 'Aldona', 'Buk', NULL, NULL, 121.25, '2020-01-10', 'wycieczka');

select * FROM aggregates.batman;

USE aggregates;

/*a. Policz, ile jest rekordów w tabeli (po id).
b. Policz, ile jest rekordów z wiekiem.
c. Ilu mężczyzn ma więcej niż 40 lat?
d. Oblicz sumę wszystkich cen.
e. Oblicz łączny wiek kobiet.
f. Podaj łączną wartość komputera i okna.
g. Podaj maksymalną cenę.
h. Podaj najpóźniejszą datę
i. Podaj nazwisko rozpoczynające się literą, która jest najbliżej końca alfabetu
j. Podaj minimalną cenę.
k. Podaj najwcześniejszą datę
l. Podaj nazwisko rozpoczynające się literą, która jest najbliżej początku alfabetu
m. Jednocześnie podaj cenę minimalną oraz maksymalną. Nadaj odpowiednie aliasy.
n. Oblicz różnicę pomiędzy ceną maksymalną, a minimalną.
o. Oblicz średnią wieku.
p. Oblicz średnią wieku za pomocą COUNT oraz SUM.
q. Oblicz średni wiek dla kobiet oraz średni wiek dla mężczyzn.*/


select * FROM aggregates.batman;

-- a Policz, ile jest rekordów w tabeli (po id).
SELECT COUNT(id)
FROM aggregates.batman;

-- b Policz, ile jest rekordów z wiekiem.
SELECT COUNT(age)
FROM aggregates.batman;

-- c Ilu mężczyzn ma więcej niż 40 lat?
SELECT COUNT(SEX = 'M') AS liczba_mezczyzn_powyzej_40
FROM aggregates.batman
WHERE age >= 40;

-- d Oblicz sumę wszystkich cen.
SELECT SUM(price) AS suma_wszystkich_cen
FROM aggregates.batman;

-- e Oblicz łączny wiek kobiet.
SELECT
       SUM(age) AS laczny_wiek_kobiet
FROM aggregates.batman
WHERE sex = 'F';

-- f Podaj łączną wartość komputera i okna.
SELECT SUM(price)
FROM aggregates.batman
WHERE gift = 'komputer' OR gift = 'okno';


-- g Podaj maksymalną cenę.
SELECT MAX(price)
FROM aggregates.batman;

-- h Podaj najpóźniejszą datę
SELECT 
     MAX(start_date)
FROM aggregates.batman;

-- i Podaj nazwisko rozpoczynające się literą, która jest najbliżej końca alfabetu
SELECT (last_name)
FROM aggregates.batman
ORDER BY last_name DESC
LIMIT 1;

-- j Podaj minimalną cenę
SELECT 
      MIN(price)
FROM aggregates.batman;

-- K Podaj najwcześniejszą datę 
SELECT 
     MIN(start_date)
FROM aggregates.batman;

-- l Podaj nazwisko rozpoczynające się literą, która jest najbliżej początku alfabetu
SELECT (last_name)
FROM aggregates.batman
ORDER BY last_name
LIMIT 1;


-- m Jednocześnie podaj cenę minimalną oraz maksymalną. Nadaj odpowiednie aliasy.
SELECT
     MIN(price) AS cena_minimalna,
     MAX(price) AS cena_maksymalna
FROM aggregates.batman;

-- n Oblicz różnicę pomiędzy ceną maksymalną, a minimalną
SELECT
	  MAX(price)-MIN(price) AS roznica_miedzy_cena_maksymalna_a_minimalna
FROM aggregates.batman;

-- o Oblicz średnią wieku.
SELECT
      ROUND(AVG(age), 2) AS srednia_wieku
FROM aggregates.batman;


-- p Oblicz średnią wieku za pomocą COUNT oraz SUM
SELECT 
      SUM(age)/COUNT(age) AS srednia_wieku
FROM aggregates.batman;


-- o Oblicz średni wiek dla kobiet oraz średni wiek dla mężczyzn.
SELECT sex,
      ROUND (AVG(age), 1) AS sredni_wiek
FROM aggregates.batman
WHERE sex in ('F','M')
GROUP BY sex;