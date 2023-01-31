/*1. Stwórz Bazę „Sklep odzieżowy”

2. Utwórz tabelę „Producenci” z kolumnami:

id producenta
nazwa producenta
adres producenta
nip producenta
data podpisania umowy z producentem
Do każdej kolumny ustaw odpowiedni „constraint”

3. Utwórz tabelę „Produkty” z kolumnami:

id produktu
id producenta
nazwa produktu
opis produktu
cena netto zakupu
cena brutto zakupu
cena netto sprzedaży
cena brutto sprzedaży
procent VAT sprzedaży
Do każdej kolumny ustaw odpowiedni „constraint”

4. Utwórz tabelę „Zamówienia” z kolumnami:

id zamówienia
id klienta
id produktu
Data zamówienia
Do każdej kolumny ustaw odpowiedni „constraint”

5. Utwórz tabelę „Klienci” z kolumnami:

id klienta
id zamówienia
imię
nazwisko
adres
Do każdej kolumny ustaw odpowiedni „constraint”
 
6. Połącz tabele ze sobą za pomocą kluczy obcych:

Produkty – Producenci
Zamówienia – Produkty
Zamówienia - Klienci

7. Każdą tabelę uzupełnij danymi wg:

Tabela „Producenci” – 4 pozycje
Tabela „Produkty” – 20 pozycji
Tabela „Zamówienia” – 10 pozycji
Tabela „Klienci” – 10 pozycji
8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci”

9. Posortuj te produkty alfabetycznie po nazwie

10. Wylicz średnią cenę za produktu od producenta z pozycji 1

11. Wyświetl dwie grupy produktów tego producenta:

Połowa najtańszych to grupa: „Tanie”
Pozostałe to grupa: „Drogie”
12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę

13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji

14. Policz łączną wartość wszystkich zamówień

15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego

16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych

17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną

18. Znajdź dzień w którym najwięcej zostało złożonych zamówień*/

-- 1
CREATE DATABASE sklep_odziezowy;
USE sklep_odziezowy;
drop database sklep_odziezowy;
/* 2. Utwórz tabelę „Producenci” z kolumnami:
id producenta
nazwa producenta
adres producenta
nip producenta
data podpisania umowy z producentem
Do każdej kolumny ustaw odpowiedni „constraint”*/

-- 2 
CREATE TABLE producenci(
	id_producent INTEGER PRIMARY KEY,
	nazwa VARCHAR (20),
	adres VARCHAR (20),
	NIP BIGINT,
	data_podpisania_umowy DATE
);

/* 3 Utwórz tabelę „Produkty” z kolumnami:
id produktu
id producenta
nazwa produktu
opis produktu
cena netto zakupu
cena brutto zakupu
cena netto sprzedaży
cena brutto sprzedaży
procent VAT sprzedaży
Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE TABLE produkty(
id_produktu INTEGER PRIMARY KEY,
id_producent INTEGER, 
nazwa_produktu TEXT,
opis_produktu TEXT,
cena_netto_zakupu DECIMAL(10,2),
cena_brutto_zakupu DECIMAL(10,2),
cena_netto_sprzedazy DECIMAL(10,2),
cena_brutto_sprzedazy DECIMAL(10,2),
producent_VAT_sprzedazy INTEGER
);

/*4. Utwórz tabelę „Zamówienia” z kolumnami:
id zamówienia
id klienta
id produktu
Data zamówienia
Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE TABLE zamowienia(
id_zamowienia INTEGER PRIMARY KEY,
id_klienta INTEGER,
id_produktu INTEGER, 
data_zamowienia DATE
);
select * from zamowienia;
/*5. Utwórz tabelę „Klienci” z kolumnami:
id klienta
id zamówienia
imię
nazwisko
adres
Do każdej kolumny ustaw odpowiedni „constraint”*/

CREATE TABLE klienci(
id_klienta INTEGER PRIMARY KEY,
id_zamowienia INTEGER,
imie TEXT,
nazwisko TEXT,
adres TEXT
);


/*6. Połącz tabele ze sobą za pomocą kluczy obcych:
Produkty – Producenci
Zamówienia – Produkty
Zamówienia - Klienci*/

ALTER TABLE produkty
ADD FOREIGN KEY (id_producent) REFERENCES producenci(id_producent);

ALTER TABLE zamowienia
ADD FOREIGN KEY (id_produktu) REFERENCES produkty(id_produktu);

ALTER TABLE zamowienia
ADD FOREIGN KEY (id_klienta) REFERENCES klienci(id_klienta);

/*7. Każdą tabelę uzupełnij danymi wg:

Tabela „Producenci” – 4 pozycje
Tabela „Produkty” – 20 pozycji
Tabela „Zamówienia” – 10 pozycji
Tabela „Klienci” – 10 pozycji*/

INSERT INTO producenci (id_producent, nazwa, adres, NIP, data_podpisania_umowy) 
		VALUES
		(1, 'cebula', 'Warszawa', 7890246982, '2018-02-09'),
		(2, 'por', 'Poznan', 1596542387, '2002-10-30'),
		(3, 'fasola', 'Wroclaw', 5672169234, '2015-02-28'),
		(4, 'burak', 'Gdansk', 1349765284, '2019-12-08')
;


INSERT INTO produkty   (id_produktu,
						id_producent, 
						nazwa_produktu,
						opis_produktu,
						cena_netto_zakupu,
						cena_brutto_zakupu,
						cena_netto_sprzedazy,
						cena_brutto_sprzedazy,
						producent_VAT_sprzedazy)

		VALUES
		(1, 2, 'bluza', 'czarna_kaptur', 200, 220, 250, 300, 123),
		(2, 2, 'bluzka', 'biala', 100, 120, 150, 200, 456),
        (3, 1, 'bluza', 'biala', 260, 290, 360, 420, 349),
		(4, 3, 'spodnie', 'biale', 250, 280, 300, 330, 132),
		(5, 4, 'bluza', 'czarna_kaptur', 250, 280, 360, 420, 465),
		(6, 3, 'koszulka', 'czerwona', 150, 180, 220, 230, 798),
		(7, 3, 'koszulka', 'biala', 160, 190, 230, 260, 321),
		(8, 4, 'skarpetki', 'biale', 21, 25, 30, 36, 654),
		(9, 4, 'rajstopy', 'czarne', 8, 11, 15, 19, 987),
		(10, 1, 'kurtka', 'czarna', 450, 480, 560, 650, 147),
		(11, 2, 'szalik', 'kolorowy', 120, 130, 160, 200, 258),
		(12, 3, 'szalik', 'czarny', 110, 150, 200, 220, 369),
		(13, 4, 'koszulka', 'czerwona', 130, 160, 200, 230, 741),
		(14, 2, 'czapka', 'pompon', 190, 230, 250, 290, 852),
		(15, 3, 'skarpety', 'kolorowe', 23, 30, 37, 42, 963),
		(16, 1, 'spodenki', 'szare', 48, 56, 80, 92, 357),
		(17, 2, 'dresy', 'czarne', 120, 150, 220, 260, 159),
		(18, 3, 'spodenki', 'czarne', 56, 63, 81, 90, 951),
		(19, 2, 'spodnie', 'jeansy', 230, 250, 300, 350, 753),
		(20, 2, 'pasek', 'skorzany', 300, 320, 390, 420, 167)
;
  
  INSERT INTO zamowienia(id_zamowienia,
						id_klienta,
						id_produktu, 
						data_zamowienia)
    
				VALUES
				(1, 2, 1, '2021-03-23'),
				(2, 4, 12, '2022-05-14'),
				(3, 8, 2, '2022-01-02'),
				(4, 1, 19, '2022-05-14'),
				(5, 6, 9, '2021-03-23'),
				(6, 3, 12, '2020-08-19'),
				(7, 10, 15, '2020-07-31'),
				(8, 7, 6, '2020-04-25'),
				(9, 9, 11, '2021-06-27'),
				(10, 5, 14, '2020-01-19')
;


INSERT INTO klienci(id_klienta,
					id_zamowienia,
					imie,
					nazwisko,
					adres)
			VALUES
			(1, 4, 'Andrzej', 'Kowalski', 'Opole'),
			(2, 1, 'Karolina', 'Woznak', 'Gdynia'),
			(3, 6, 'Renata', 'Ptak', 'Szczecin'),
			(4, 2, 'Lucjan', 'Korek', 'Lublin'),
			(5, 10, 'Wanda', 'Ruszaj', 'Skierniewice'),
			(6, 5, 'Roman', 'Wrak', 'Poznan'),
			(7, 8, 'Kamil', 'Pstryk', 'Luban'),
			(8, 3, 'Bozena', 'Mrok', 'Warszawa'),
			(9, 9, 'Regina', 'Borek', 'Kutno'),
			(10, 7, 'Witek', 'Rozboj', 'Wroclaw')
;

/*8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci”*/

SELECT * 
FROM produkty
WHERE id_producent = 1
;


/*9. Posortuj te produkty alfabetycznie po nazwie*/
SELECT * 
FROM produkty
WHERE id_producent = 1
ORDER BY nazwa_produktu
;

/*10. Wylicz średnią cenę za produktu od producenta z pozycji 1*/
SELECT  id_producent AS producent,
		ROUND(AVG(cena_netto_zakupu), 2) AS srednia_netto_zakupu,
        ROUND(AVG(cena_brutto_zakupu), 2) AS srednia_brutto_zakupu,
        ROUND(AVG(cena_netto_sprzedazy), 2) AS srednia_netto_sprzedazy,
        ROUND(AVG(cena_brutto_sprzedazy), 2) AS srednia_brutto_sprzedazy
FROM produkty
WHERE id_producent = 1
;

/*11. Wyświetl dwie grupy produktów tego producenta:
Połowa najtańszych to grupa: „Tanie”
Pozostałe to grupa: „Drogie”*/

(SELECT 
		id_producent AS producent,
        nazwa_produktu AS produkt,
		cena_brutto_sprzedazy AS cena,
        'tanie' AS 'wartosc'
FROM produkty 
WHERE cena_brutto_sprzedazy < (SELECT AVG(cena_brutto_sprzedazy) FROM produkty)
)

UNION

(SELECT 
		id_producent AS producent,
        nazwa_produktu AS produkt,
		cena_brutto_sprzedazy AS cena,
        'drogie' AS 'wartosc'
FROM produkty 
WHERE cena_brutto_sprzedazy > (SELECT AVG(cena_brutto_sprzedazy) FROM produkty)
);


-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę
SELECT
		zamowienia.id_produktu AS id,
        produkty.nazwa_produktu AS nazwa
FROM zamowienia
JOIN produkty
ON produkty.id_produktu = zamowienia.id_produktu;

-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji
SELECT *
FROM zamowienia
LIMIT 5
;

-- 14. Policz łączną wartość wszystkich zamówień
SELECT
		COUNT(id_zamowienia) AS liczba_zamowien,
		SUM(produkty.cena_brutto_sprzedazy) AS laczna_wartosc_zamowien
FROM zamowienia
JOIN produkty
ON produkty.id_produktu = zamowienia.id_produktu
;

-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego
SELECT
		zamowienia.id_produktu AS id,
        produkty.nazwa_produktu AS nazwa,
		zamowienia.data_zamowienia AS data_zamowienia
FROM zamowienia
JOIN produkty
ON produkty.id_produktu = zamowienia.id_produktu
ORDER BY zamowienia.data_zamowienia
;

-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych
SELECT *
FROM produkty
WHERE id_produktu IS NULL 
	  OR id_producent IS NULL 
      OR nazwa_produktu IS NULL 
      OR opis_produktu IS NULL
	  OR cena_netto_zakupu IS NULL 
      OR cena_brutto_zakupu IS NULL 
      OR cena_netto_sprzedazy IS NULL 
	  OR cena_brutto_sprzedazy IS NULL 
      OR producent_VAT_sprzedazy IS NULL
;	
						 
-- 17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną
WITH najczesciej_sprzedawany_produkt AS (
	SELECT id_produktu, 
		   COUNT(*) AS liczba_zamowien
	FROM zamowienia
	GROUP BY id_produktu
	ORDER BY COUNT(*) DESC
	LIMIT 1
)
SELECT id_produktu, 
	   nazwa_produktu, 
       cena_brutto_sprzedazy
FROM produkty
WHERE id_produktu = (SELECT id_produktu FROM najczesciej_sprzedawany_produkt)
;


-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień*/
WITH liczba_zamowien_kazdego_dnia AS 
(SELECT data_zamowienia, 
        count(id_zamowienia) as liczba_zamowien
	FROM zamowienia
	GROUP BY data_zamowienia)

SELECT data_zamowienia,
	   count(id_zamowienia) AS liczba_zamowien
	FROM zamowienia
	GROUP BY data_zamowienia
	HAVING liczba_zamowien = (
		SELECT MAX(liczba_zamowien)
		FROM liczba_zamowien_kazdego_dnia);