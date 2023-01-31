/*1. Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:

ID
Imię
Nazwisko
Wiek
Kurs
3. Każdą tabelę uzupełnij danymi z załącznika, lub zaktualizuj.
4. Wyświetl listę pracowników o Imieniu: Anna.
5. Wyświetl listę pracowników z brakującą daną w kolumnie Imię.
6. Wyświetl kursy prowadzone przez pracowników w wieku od 30 lat do 40 lat.
7. Wyświetl wiek pracowników z ID od 1 do 7.
8. Wyświetl listę pracowników z brakującymi danymi w kolumnie wiek.
9. Zmień nazwę kolumny „Kurs” na „Szkolenie”.*/

-- 1 
USE Pracownicy;

-- 2 Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
CREATE TABLE Pracownicy4 (
ID INTEGER PRIMARY KEY, 
Imie VARCHAR (25), 
Nazwisko VARCHAR (25), 
Wiek INTEGER, 
Kurs TEXT
);

-- 3 Każdą tabelę uzupełnij danymi z załącznika
INSERT INTO Pracownicy4 (ID, Imie, Nazwisko, Wiek, Kurs)
VALUES 
(1,	'Anna',	'NOWAK', 34, 'DS'),
(2,	'Roman', 'KOWALSKI', 42, 'DS'), 
(3,	'Tomasz', 'WIŚNIEWSKI', 33,	'DS'),
(4,	'Agata', 'WÓJCIK', 43, 'DS'),
(5,	'Elżbieta',	'KOWALCZYK', 28, 'Java'),
(6,	'Przemysław', 'KAMIŃSKI', 34, 'Java'),
(7,	'Robert', 'LEWANDOWSKI', 35, 'Java'),
(8,	'Radosław',	'ZIELIŃSKI', 38, 'Java'),
(9,	'',	'WOŹNIAK', 26, 'Java'),
(10, 'Robert', 'SZYMAŃSKI',	34,	'Java'),
(11, 'Radosław', 'DĄBROWSKI', 35, ''),
(12, 'Robert', 'KOZŁOWSKI',	'',	'UX'),
(13, 'Joanna', 'MAZUR',	26,	'UX'),
(14, 'Radosław', 'JANKOWSKI', 27, 'UX'),
(15, 'Patryk', 'LEWANDOWSKI', 28, 'Tester'),
(16, '', 'ZIELIŃSKI', 28,	'Tester'),
(17, 'Andrzej',	'WOŹNIAK', 31, 'Tester'),
(18, 'Andrze', 'LEWANDOWSKI', 30, 'Tester'),
(19, 'Roman', 'ZIELIŃSKI', 39, 'Tester'),
(20, 'Ewa',	'WOŹNIAK', 31, 'Tester');

SELECT * FROM Pracownicy4;

-- 4 Wyświetl listę pracowników o Imieniu: Anna.
SELECT * FROM Pracownicy4 WHERE Imie = 'ANNA';

-- 5. Wyświetl listę pracowników z brakującą daną w kolumnie Imię.
SELECT * FROM Pracownicy4 WHERE Imie = '';

-- 6 Wyświetl kursy prowadzone przez pracowników w wieku od 30 lat do 40 lat.
SELECT Kurs, Wiek FROM Pracownicy4 WHERE Wiek >= 30 AND Wiek <= 40;

-- 7 Wyświetl wiek pracowników z ID od 1 do 7.
SELECT Wiek FROM Pracownicy4 WHERE ID IN (1, 2, 3, 4, 5, 6, 7);

-- 8 Wyświetl listę pracowników z brakującymi danymi w kolumnie wiek.
SELECT * FROM Pracownicy4 WHERE Imie = '' OR Nazwisko = '' OR Wiek = '' OR Kurs = '';

-- 9 Zmień nazwę kolumny „Kurs” na „Szkolenie”
ALTER TABLE Pracownicy4 
CHANGE Kurs Szkolenie TEXT;