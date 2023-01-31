/*a. Podaj średnią wieku. Podaj zaokrąglony wynik do dwóch miejsc po przecinku.
b. Wyświetl wartość bezwzględną liczby -3.
c. Wyświetl wynik mnożenie 2 * 3
d. Wyświetl wynik dzielenia 6 przez 2*/

USE aggregates;

SELECT * FROM batman;

-- a. Podaj średnią wieku. Podaj zaokrąglony wynik do dwóch miejsc po przecinku. 
SELECT 
      ROUND(AVG(age), 2) AS srednia_wieku
FROM batman;

-- b Wyświetl wartość bezwzględną liczby -3.
SELECT 
		ABS(-3) AS wartosc_bezwgledna;
        
-- c Wyświetl wynik mnożenie 2 * 3
SELECT 
		2 * 3;
        
-- d Wyświetl wynik dzielenia 6 przez 2*
SELECT
		6 / 2;
